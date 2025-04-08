using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

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
                DeviceShopEntities dataBase = new DeviceShopEntities();
                _allEquipment = dataBase.Details
                    .Select(d => new
                    {
                        d.ArticleId,
                        d.Name,          // Фильтрация будет по этому полю
                        d.Count,
                        d.Price,
                        d.TypeDetailsId,
                        ArticleNumber = d.Article.ArticleName,
                        GostName = d.Gost.GostName,
                        TypeDetailsName = d.TypeDetails.TypeDetailsName,
                        UnitName = d.Unit.UnitName
                    })
                    .ToList();

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
    }
}