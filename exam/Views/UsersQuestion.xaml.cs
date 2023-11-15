using exam.Models;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace exam.Views
{
    /// <summary>
    /// Logique d'interaction pour GeneralKnowledgeQuestions.xaml
    /// </summary>
    public partial class UsersQuestion : Page
    {
        private List<QuizQuestion> questionList;
        private QuizQuestion currentQuestion;
        private int currentQuestionIndex;
        private int PointsEarned = 0;
        public UsersQuestion()
        {
            InitializeComponent();
            LoadQuestions();
            LoadNextQuestion(); // You should implement this method to load questions from your database
        }

        private void LoadQuestions()
        {
            questionList = new List<QuizQuestion>();

            // Assuming connectionString is a string containing your database connection information
            string connectionString = "Server=localhost\\SQLEXPRESS;Database=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            // Query to retrieve 10 random questions from your QuestionsGks table
            string sqlQuery = "SELECT TOP 10 Question, PossibleAnswer1, PossibleAnswer2, PossibleAnswer3, PossibleAnswer4, CorrectAnswer " +
                              "FROM UsersQuestionss " +
                              "ORDER BY NEWID()";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            QuizQuestion question = new QuizQuestion
                            {
                                Question = reader["Question"].ToString(),
                                PossibleAnswer1 = reader["PossibleAnswer1"].ToString(),
                                PossibleAnswer2 = reader["PossibleAnswer2"].ToString(),
                                PossibleAnswer3 = reader["PossibleAnswer3"].ToString(),
                                PossibleAnswer4 = reader["PossibleAnswer4"].ToString(),
                                CorrectAnswer = reader["CorrectAnswer"].ToString()
                            };

                            questionList.Add(question);
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that might occur during database access
                Console.WriteLine("Error: " + ex.Message);
            }
        }


        private void LoadNextQuestion()
        {
            if (questionList.Count > 0)
            {
                // Randomly select a question index
                Random random = new Random();
                currentQuestionIndex = random.Next(questionList.Count);

                // Retrieve the selected question
                currentQuestion = questionList[currentQuestionIndex];

                // Set the DataContext to the current question
                DataContext = currentQuestion;

                // Remove the selected question from the list to avoid repetition
                questionList.RemoveAt(currentQuestionIndex);
            }
            else
            {
                // No questions left, end the quiz or display a message
                MessageBox.Show("Quiz completed. U earned " + PointsEarned + " Points!");
                UpdateUserPoints(PointsEarned);
                PointsEarned = 0;
                MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
                mainWindow.Main.Navigate(new Uri("Views/Play.xaml", UriKind.Relative));
                // You may want to navigate to another page or perform some other action here
            }
        }

        private void UpdateUserPoints(int earnedPoints)
        {
            // Assuming connectionString is a string containing your database connection information
            string connectionString = "Server=localhost\\SQLEXPRESS;Database=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";



            // Query to update the Points in the Users table
            string sqlUpdateQuery = "UPDATE Users SET Points = Points + @EarnedPoints WHERE Username = @Username";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(sqlUpdateQuery, connection))
                    {
                        command.Parameters.Add("@EarnedPoints", SqlDbType.Int).Value = earnedPoints;
                        command.Parameters.Add("@Username", SqlDbType.NVarChar).Value = CurrentUser.Currentuser;

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that might occur during database access
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        private void AnswerButton_Click(object sender, RoutedEventArgs e)
        {
            // Handle the button click event to check if the selected answer is correct
            Button clickedButton = (Button)sender;
            string selectedAnswer = clickedButton.Content.ToString();

            if (selectedAnswer == currentQuestion.CorrectAnswer)
            {
                PointsEarned = PointsEarned + 1;
                MessageBox.Show("Correct! U win a Point!");

            }
            else
            {
                MessageBox.Show("Incorrect. The correct answer is: " + currentQuestion.CorrectAnswer);
            }

            // Load the next question after processing the current one
            LoadNextQuestion();
        }
    }

   
}
