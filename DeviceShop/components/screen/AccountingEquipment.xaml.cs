
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
            if (DataGrid.SelectedItem == null) return;

            dynamic selected = DataGrid.SelectedItem;
            int productId = selected.ArticleId;

            // Переход к спецификации изделия
            var specView = new SpecificationView(productId);
            NavigationService.Navigate(specView);
        }
    }
}