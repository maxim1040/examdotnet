using exam.Views;
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

namespace exam
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Main.Content = new Home();
            
        }
        ComboBox categoryComboBox;

        private void BtnHome_Click(object sender, RoutedEventArgs e)
        {
            Main.Content = new Home();
        }

        private void BtnAccount_Click(object sender, RoutedEventArgs e)
        {
            

            if ( LoggedInBoolean.LoggedIn == true) {
                Main.Content = new UserProfile();

            }
            else
            {
                Main.Content = new Account();
            }
        }

        private void BtnPlay_Click(object sender, RoutedEventArgs e)
        {
            if (LoggedInBoolean.LoggedIn == true)
            {
                Main.Content = new Play();

            }
            else
            {
                MessageBox.Show("Log in first!");
            }
          

        }

        private void BtnLeaderboard_Click(object sender, RoutedEventArgs e)
        {
            Main.Content = new Leaderboard();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (LoggedInBoolean.LoggedIn == true)
            {
                Main.Content = new Add();

            }
            else
            {
                MessageBox.Show("Log in first!");
            }
        }

      
    }
}
