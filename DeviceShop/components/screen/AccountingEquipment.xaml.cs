
using System.Linq;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace DeviceShop.components.screen
{
    public partial class AccountingEquipment : Page
    {
        private List<dynamic> _allEquipment = new List<dynamic>();
        public class EquipmentDto
        {
            public int ArticleId { get; set; }
            public string Name { get; set; }
            public double Count { get; set; }
            public decimal Price { get; set; }
            public int TypeDetailsId { get; set; }
            public string ArticleName { get; set; }
            public string GostName { get; set; }
            public string TypeDetailsName { get; set; }
            public string UnitName { get; set; }
        }

        public AccountingEquipment()
        {
            InitializeComponent();
            LoadEquipmentData();
        }

        private void LoadEquipmentData()
        {
            try
            {
                DeviceShopEntities2 dataBase = new DeviceShopEntities2();
                _allEquipment = dataBase.Details
                    .Select(d => new
                    {
                        d.ArticleId,
                        d.Name,          // Фильтрация будет по этому полю
                        d.Count,
                        d.Price,
                        d.TypeDetailsId,
                        ArticleName = d.Article.ArticleName,
                        GostName = d.Gost.GostName,
                        TypeDetailsName = d.TypeDetails.TypeDetailsName,
                        UnitName = d.Unit.UnitName
                    }).ToList<dynamic>();
                    

                DataGrid.ItemsSource = _allEquipment;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке данных: {ex.Message}");
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            var searchPattern = SearchTextBox.Text.Trim();

            if (string.IsNullOrEmpty(searchPattern))
            {
                DataGrid.ItemsSource = _allEquipment;
                return;
            }

            try
            {
                string regexPattern = ConvertToRegexPattern(searchPattern);
                var filteredItems = _allEquipment
                    .Where(item => item.Name != null &&
                                   Regex.IsMatch(item.Name.ToString(), regexPattern, RegexOptions.IgnoreCase))
                    .ToList();

                DataGrid.ItemsSource = filteredItems;
            }
            catch
            {
                DataGrid.ItemsSource = _allEquipment;
            }
        }

        private string ConvertToRegexPattern(string searchPattern)
        {
            string pattern = Regex.Escape(searchPattern);
            pattern = pattern.Replace(@"\?", ".*");  // ? заменяем на .*
            pattern = pattern.Replace(@"\!", ".");   // ! заменяем на .
            return "^" + pattern + "$";  // Точное совпадение с шаблоном
        }
        private void DataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            try
            {
                if (DataGrid.SelectedItem == null) return;

                // Получаем выбранный элемент как EquipmentDto
                var selectedItem = (EquipmentDto)DataGrid.SelectedItem;

                using (var db = new DeviceShopEntities2())
                {
                    // Получаем полный объект Details из базы данных
                    var fullDetails = db.Details
                        .Include("Article")
                        .Include("Gost")
                        .Include("TypeDetails")
                        .Include("Unit")
                        .FirstOrDefault(d => d.ArticleId == selectedItem.ArticleId);

                    if (fullDetails != null)
                    {
                        // Открываем окно редактирования
                        var editWindow = new EditSpecificationItemWindow(fullDetails);
                        if (editWindow.ShowDialog() == true)
                        {
                            // Обновляем данные после редактирования
                            LoadEquipmentData();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при открытии спецификации: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}