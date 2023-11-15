using Microsoft.Data.SqlClient;
using System;
using System.Windows;
using System.Windows.Controls;

namespace exam.Views
{
    /// <summary>
    /// Interaction logic for Add.xaml
    /// </summary>
    public partial class Add : Page
    {
        SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");

        public Add()
        {
            InitializeComponent();
        }

        private void btnAddQuestion_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtQuestion.Text) && !string.IsNullOrEmpty(txtAnswer2.Text) &&
                    !string.IsNullOrEmpty(txtAnswer1.Text) && !string.IsNullOrEmpty(txtAnswer3.Text) &&
                    !string.IsNullOrEmpty(txtAnswer4.Text) && !string.IsNullOrEmpty(txtCorrectAnswer.Text))
                {
                    String UserQuestion  = txtQuestion.Text;
                    int v = CheckIfUserQuestionsExists(UserQuestion);
                    if (v != 1)
                    {
                        connection.Open();
                        SqlCommand command = new SqlCommand("INSERT INTO UsersQuestionss VALUES (@Question, @PossibleAnswer1, @PossibleAnswer2, @PossibleAnswer3, @PossibleAnswer4, @CorrectAnswer)", connection);
                        command.Parameters.AddWithValue("@Question", txtQuestion.Text);
                        command.Parameters.AddWithValue("@PossibleAnswer1", txtAnswer1.Text);
                        command.Parameters.AddWithValue("@PossibleAnswer2", txtAnswer2.Text);
                        command.Parameters.AddWithValue("@PossibleAnswer3", txtAnswer3.Text);
                        command.Parameters.AddWithValue("@PossibleAnswer4", txtAnswer4.Text);
                        command.Parameters.AddWithValue("@CorrectAnswer", txtCorrectAnswer.Text);
                        command.ExecuteNonQuery();
                        connection.Close();
                        MessageBox.Show("Question added Successfully!");

                        txtQuestion.Text = "";
                        txtAnswer1.Text = "";
                        txtAnswer2.Text = "";
                        txtAnswer3.Text = "";
                        txtAnswer4.Text = "";
                        txtCorrectAnswer.Text = "";
                    }
                    else
                    {
                        MessageBox.Show("This question already exists!");
                    }
                }
                else
                {
                    MessageBox.Show("Fill in the blanks!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private int CheckIfUserQuestionsExists(string UserQuestion)
        {
            int count = 0;

            // Your logic to check if the user already exists in the database
            using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM UsersQuestionss WHERE Question = @Question", connection))
            {
                command.Parameters.AddWithValue("@Question", UserQuestion);
                connection.Open();
                count = (int)command.ExecuteScalar(); // This will return the count of users with the given email
                connection.Close();
            }

            return count;
        }
    }
}
