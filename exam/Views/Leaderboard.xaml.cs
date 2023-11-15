using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    /// Logique d'interaction pour Leaderboard.xaml
    /// </summary>
    public partial class Leaderboard : Page
    {
        public Leaderboard()
        {
            InitializeComponent();
            ShowDataInGrid();
        }
        private void ShowDataInGrid()
        {
            string connectionString = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=quizzt;Integrated Security=True;Encrypt=True;TrustServerCertificate=True";
            string query = "SELECT UserName, Points FROM Users"; 

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set the initial sorting by ascending points
                DataView view = dataTable.DefaultView;
                view.Sort = "Points DESC";

                MyDataGrid.ItemsSource = dataTable.DefaultView;
            }
        }


        private void MyDataGrid_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            // Prevent text selection by marking the event as handled
            e.Handled = true;
        }
    }
}
