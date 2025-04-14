using System;
using System.Linq;
using System.Windows;


namespace DeviceShop.components.screen
{
    public partial class SelectionWindow : Window
    {
        public int SelectedId { get; private set; }
        public string SelectedName { get; private set; }
        public string SelectedUnit { get; private set; }
        public decimal SelectedPrice { get; private set; }

        public SelectionWindow()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            using (var db = new DeviceShopEntities2())
            {
                // Disable proxy creation to avoid lazy loading issues
                db.Configuration.ProxyCreationEnabled = false;
                db.Configuration.LazyLoadingEnabled = false;

                // Load accessories with Unit data
                var accessories = db.Accessories
                    .AsNoTracking() // Add this to improve performance
                    .Select(a => new
                    {
                        Id = a.AccessoriesId,
                        a.Name,
                        UnitName = a.Unit.UnitName, // Access the Unit property while context is alive
                        a.Price
                    })
                    .ToList();

                // Load details with Unit data
                var details = db.Details
                    .AsNoTracking() // Add this to improve performance
                    .Select(d => new
                    {
                        Id = d.DetailsId,
                        d.Name,
                        UnitName = d.Unit.UnitName, // Access the Unit property while context is alive
                        d.Price
                    })
                    .ToList();

                AccessoriesList.ItemsSource = accessories;
                DetailsList.ItemsSource = details;
            }
        }

        private void SelectButton_Click(object sender, RoutedEventArgs e)
        {
            if (AccessoriesList.SelectedItem != null)
            {
                dynamic selected = AccessoriesList.SelectedItem;
                SelectedId = selected.Id;
                SelectedName = selected.Name;
                SelectedUnit = selected.UnitName;
                SelectedPrice = selected.Price;
                DialogResult = true;
            }
            else if (DetailsList.SelectedItem != null)
            {
                dynamic selected = DetailsList.SelectedItem;
                SelectedId = selected.Id;
                SelectedName = selected.Name;
                SelectedUnit = selected.UnitName;
                SelectedPrice = selected.Price;
                DialogResult = true;
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите компонент", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}