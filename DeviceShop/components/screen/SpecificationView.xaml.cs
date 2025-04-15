using System;
using System.Linq;
using System.Windows;

namespace DeviceShop.components.screen
{
    public partial class EditSpecificationItemWindow : Window
    {
        private readonly DeviceShopEntities2 _db;
        private readonly Details _item;


        public EditSpecificationItemWindow(Details item)
        {
            InitializeComponent();

            _db = new DeviceShopEntities2();
            _item = item;

            LoadItemData();
        }

        private void LoadItemData()
        {
            // Основные свойства
            txtName.Text = _item.Name;
            txtCount.Text = _item.Count.ToString();
            txtPrice.Text = _item.Price.ToString("F2");
            txtTypeDetailsId.Text = _item.TypeDetailsId.ToString();

            // Заполняем комбо-боксы
            ComboBoxArticleName.ItemsSource = _db.Article.ToList();
            ComboBoxArticleName.DisplayMemberPath = "ArticleName";
            ComboBoxArticleName.SelectedValuePath = "ArticleId";
            ComboBoxArticleName.SelectedValue = _item.ArticleId;

            ComboBoxGostName.ItemsSource = _db.Gost.ToList();
            ComboBoxGostName.DisplayMemberPath = "GostName";
            ComboBoxGostName.SelectedValuePath = "GostId";
            ComboBoxGostName.SelectedValue = _item.GostId;

            ComboBoxTypeDetailsName.ItemsSource = _db.TypeDetails.ToList();
            ComboBoxTypeDetailsName.DisplayMemberPath = "TypeDetailsName";
            ComboBoxTypeDetailsName.SelectedValuePath = "TypeDetailsId";
            ComboBoxTypeDetailsName.SelectedValue = _item.TypeDetailsId;

            ComboBoxUnitName.ItemsSource = _db.Unit.ToList();
            ComboBoxUnitName.DisplayMemberPath = "UnitName";
            ComboBoxUnitName.SelectedValuePath = "UnitId";
            ComboBoxUnitName.SelectedValue = _item.UnitId;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            // Валидация данных
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                MessageBox.Show("Введите наименование", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!decimal.TryParse(txtPrice.Text, out decimal price))
            {
                MessageBox.Show("Некорректное значение цены", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (!double.TryParse(txtCount.Text, out double count))
            {
                MessageBox.Show("Некорректное значение количества", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            try
            {
                // Обновляем объект
                _item.Name = txtName.Text;
                _item.Price = price;
                _item.Count = count;
                _item.TypeDetailsId = (int)ComboBoxTypeDetailsName.SelectedValue;
                _item.ArticleId = (int)ComboBoxArticleName.SelectedValue;
                _item.GostId = (int?)ComboBoxGostName.SelectedValue;
                _item.UnitId = (int)ComboBoxUnitName.SelectedValue;

                // Сохраняем изменения
                _db.SaveChanges();

                DialogResult = true;
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка",
                              MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
            Close();
        }

        protected override void OnClosed(EventArgs e)
        {
            _db.Dispose();
            base.OnClosed(e);
        }
    }
}