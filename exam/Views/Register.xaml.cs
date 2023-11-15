


using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
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
using System.Diagnostics.Eventing.Reader;
using System.Linq.Expressions;

namespace exam.Views
{


    public partial class Register : Page
    {
        public Register() => InitializeComponent();


        SqlConnection connection = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            string password = txtPassword.Password;
            string conPassword = txtConpassword.Password;
            try
            {
                if (txtName.Text != "" && txtUsername.Text != "" && password != ""  && txtEmail.Text != "")
                {
                    if (password == conPassword)
                    {
                        int v = CheckIfUserExists(txtEmail.Text);
                        if (v != 1)
                        {

                            
                            connection.Open();
                            SqlCommand command = new SqlCommand("INSERT INTO Users VALUES (@Name, @Username, @Email, @Password, @Points)", connection);
                            command.Parameters.AddWithValue("@Name", txtName.Text);
                            command.Parameters.AddWithValue("@Username", txtUsername.Text);
                            command.Parameters.AddWithValue("@Email", txtEmail.Text);
                            command.Parameters.AddWithValue("@Password", password);
                            command.Parameters.AddWithValue("@Points", 0);
                            command.ExecuteNonQuery();
                            connection.Close();
                            MessageBox.Show("Registered Successfully!");


                            txtName.Text = "";
                            txtUsername.Text = "";

                            txtEmail.Text = "";
                            password = "";
                            conPassword = "";

                            MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
                            mainWindow.Main.Navigate(new Uri("Views/Account.xaml", UriKind.Relative));


                        }
                        else
                        {
                            MessageBox.Show("You are already registered!");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Password does  not match!");
                    }
                }
                else
                {
                    MessageBox.Show("Fill in the blinks!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private int CheckIfUserExists(string email)
        {
            int count = 0;

            // Your logic to check if the user already exists in the database
            using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email = @Email", connection))
            {
                command.Parameters.AddWithValue("@Email", email);
                connection.Open();
                count = (int)command.ExecuteScalar(); // This will return the count of users with the given email
                connection.Close();
            }

            return count;
        }

    }
}

