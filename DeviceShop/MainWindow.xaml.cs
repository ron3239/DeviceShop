using DeviceShop.components.screen;
using System.Windows;
using System.Windows.Navigation;

namespace DeviceShop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new Main());
        }
        private void BackClick(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }
    }
}
