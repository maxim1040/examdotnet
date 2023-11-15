using System;
using System.Collections.Generic;
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
using System.Data.SqlClient;
using Microsoft.Data.SqlClient;
using exam.Views;
using exam;

namespace exam.Views
{
    /// <summary>
    /// Logique d'interaction pour Account.xaml
    /// </summary>
    public partial class Account : Page
    {
        public Account()
        {
            InitializeComponent();
        }

        SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");

        public string Currentuser { get; private set; }

        private void Btn_login(object sender, RoutedEventArgs e)
        {
            if (txtUsername.Text != "" && txtPassword.Text != "")
            {
                string query = "SELECT COUNT(*) FROM dbo.Users WHERE username = @Username AND password = @Password";

                using (SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True"))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters and set their values
                        command.Parameters.AddWithValue("@Username", txtUsername.Text);
                        command.Parameters.AddWithValue("@Password", txtPassword.Text);

                        int v = (int)command.ExecuteScalar();

                        if (v != 1)
                        {
                            MessageBox.Show("Error username or password", "Error!");
                        }
                        else
                        {
                            MessageBox.Show("Welcome to your profile!");
                            
                            LoggedInBoolean.LoggedIn = true;
                            
                            CurrentUser.Currentuser = txtUsername.Text;

                            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
                            UserProfile userProfilePage = new UserProfile();
                            mainWindow.Main.Navigate(userProfilePage);

                            txtPassword.Text = "";
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Fill in the blanks");
            }
        }
        private void Btn_register(object sender, RoutedEventArgs e) { 
            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow; 
            mainWindow.Main.Navigate(new Uri("Views/Register.xaml", UriKind.Relative)); 
        }


    }
}
