using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace DeviceShop.components.screen
{
    public partial class Entrance : Page
    {
        private DeviceShopEntities2 _db = new DeviceShopEntities2();

        private List<EntranceItem> _items = new List<EntranceItem>();


        public Entrance()
        {
            InitializeComponent();
            LoadDate();
            LoadId();
            LoadDogovor();

            // Устанавливаем источник данных с автоматическим обновлением
            var collectionView = new CollectionViewSource { Source = _items };
            ItemsDataGrid.ItemsSource = collectionView.View;

            // Подписываемся на событие изменения коллекции
            collectionView.View.CollectionChanged += (s, e) => CalculateTotal();
        }

        private void LoadDate()
        {
            DocumentDate.SelectedDate = DateTime.Today;
        }
        private void LoadDogovor()
        {
            try
            {
                // Загружаем договора
                var contracts = _db.Contract.ToList();

                ComboBoxDogovor.ItemsSource = contracts;
                ComboBoxDogovor.DisplayMemberPath = "ContractId";
                ComboBoxDogovor.SelectedValuePath = "ContractId";

                ComboBoxDogovor.SelectionChanged += ComboBoxDogovor_SelectionChanged;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка загрузки договоров: {ex.Message}");
            }
        }

        private void ComboBoxDogovor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBoxDogovor.SelectedItem is Contract selectedContract)
            {
                Suppliers.Text = selectedContract.NameProvider;
            }
        }


        private void LoadId()
        {
            using (var db = new DeviceShopEntities2())
            {
                int _nextId = db.Entrance.Count() + 1;
                DocumentNumber.Text = _nextId.ToString();


            }
        }

        private void ShowSelectionWindow(object sender, RoutedEventArgs e)
        {
            var selectionWindow = new SelectionWindow();
            if (selectionWindow.ShowDialog() == true)
            {
                var newItem = new EntranceItem
                {
                    ComponentId = selectionWindow.SelectedId,
                    Name = selectionWindow.SelectedName,
                    Quantity = 1,
                    Unit = selectionWindow.SelectedUnit,
                    Price = selectionWindow.SelectedPrice
                };

                _items.Add(newItem);
                // Подписываемся на изменение свойств элемента
                newItem.PropertyChanged += (s, args) =>
                {
                    if (args.PropertyName == nameof(EntranceItem.TotalPrice))
                        CalculateTotal();
                };

                CalculateTotal();
            }
        }

        private void CalculateTotal()
        {
            decimal total = _items.Sum(item => item.TotalPrice);
            TotalAmountText.Text = total.ToString("N2");
        }

        private void ItemsDataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                // Принудительно обновляем привязку
                var binding = (e.EditingElement as TextBox)?.GetBindingExpression(TextBox.TextProperty);
                binding?.UpdateSource();
            }
        }
        private void DeleteSelectedItem(object sender, RoutedEventArgs e)
        {
            // Проверяем, есть ли выбранная строка
            if (ItemsDataGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите элемент для удаления", "Внимание",
                               MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            // Получаем выбранный элемент
            var selectedItem = ItemsDataGrid.SelectedItem as EntranceItem;

            // Подтверждение удаления
            var result = MessageBox.Show($"Удалить '{selectedItem.Name}'?", "Подтверждение удаления",
                                        MessageBoxButton.YesNo, MessageBoxImage.Question);

            if (result == MessageBoxResult.Yes)
            {
                // Удаляем из коллекции
                _items.Remove(selectedItem);

                // Обновляем DataGrid
                ItemsDataGrid.Items.Refresh();

                // Пересчитываем итоговую сумму
                CalculateTotal();
            }
        }

    }
}