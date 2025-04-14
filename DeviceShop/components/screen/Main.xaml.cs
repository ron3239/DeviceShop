using System;
using System.Windows;
using System.Windows.Controls;

namespace DeviceShop.components.screen
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Page
    {
        public Main()
        {
            InitializeComponent();
        }


        private void ExiteClick(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
        private void AccountingEquipment(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AccountingEquipment());
        }
        private void Entrance(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Entrance());
        }
        private void AssemblyProducts(object sender, RoutedEventArgs e) { 
            NavigationService.Navigate(new AssemblyPage());
}
        private void EquipmentFailureView(object sender, RoutedEventArgs e) {
            NavigationService.Navigate(new EquipmentFailureView());
        }
    }
}
