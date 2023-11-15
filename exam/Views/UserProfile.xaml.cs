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
   
    public partial class UserProfile : Page
    {
        

        public UserProfile()
        {
            InitializeComponent();

            // Set the DataContext to this instance (for data binding)
            txtUsername.Text = CurrentUser.Currentuser.ToString();
            GetPoints();
        }

      

        private void Logoutclick(object sender, RoutedEventArgs e)
        {
            LoggedInBoolean.LoggedIn = false;
            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
            mainWindow.Main.Navigate(new Uri("Views/Account.xaml", UriKind.Relative));
        }

        private void GetPoints()
        {
            string connectionString = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            string currentUser = CurrentUser.Currentuser; // Replace with your way of getting the current user

            // Assuming your Users table has a column named "Username" to identify users
            string query = $"SELECT Points FROM Users WHERE Username = @Username";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Use SqlParameter to prevent SQL injection
                    command.Parameters.AddWithValue("@Username", currentUser);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Assuming "Points" is an integer column; change the type accordingly
                            int points = Convert.ToInt32(reader["Points"]);


                            txtPoints.Text = $"{points} Points!";
                        }
                    }
                }
            }
        }
    }
}
