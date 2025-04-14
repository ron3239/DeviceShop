using System;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Controls;

namespace DeviceShop.components.screen
{
    public partial class SpecificationView : Page
    {
        private string _connectionString = "Data Source=.;Initial Catalog=DeviceShop;Integrated Security=True";
        private int _currentProductId;

        // Модели данных
        public class Characteristic
        {
            public string Name { get; set; }
            public string Value { get; set; }
            public string Unit { get; set; }
        }

        public class Component
        {
            public int ComponentId { get; set; }
            public string Name { get; set; }
            public int Quantity { get; set; }
            public string ArticleNumber { get; set; }
        }

        public class Part
        {
            public int PartId { get; set; }
            public string Name { get; set; }
            public int Quantity { get; set; }
            public string Gost { get; set; }
        }

        public class Operation
        {
            public string Equipment { get; set; }
            public string Duration { get; set; }
            public string Description { get; set; }
        }

        // Коллекции данных
        private ObservableCollection<Characteristic> _characteristics = new ObservableCollection<Characteristic>();
        private ObservableCollection<Component> _components = new ObservableCollection<Component>();
        private ObservableCollection<Part> _parts = new ObservableCollection<Part>();
        private ObservableCollection<Operation> _operations = new ObservableCollection<Operation>();

        public SpecificationView(int productId)
        {
            InitializeComponent();
            _currentProductId = productId;

            // Инициализация DataGrid
            dgCharacteristics.ItemsSource = _characteristics;
            dgComponents.ItemsSource = _components;
            dgParts.ItemsSource = _parts;
            dgOperations.ItemsSource = _operations;

            // Загрузка данных
            LoadProductInfo();
            LoadCharacteristics();
            LoadComponents();
            LoadParts();
            LoadOperations();
        }

        private void LoadProductInfo()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var command = new SqlCommand(
                    "SELECT Name, Description FROM Products WHERE ProductId = @ProductId",
                    connection);
                command.Parameters.AddWithValue("@ProductId", _currentProductId);

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtProductInfo.Text = $"{reader["Name"]} - {reader["Description"]}";
                    }
                }
            }
        }

        private void LoadCharacteristics()
        {
            _characteristics.Clear();
            // Здесь можно добавить загрузку характеристик из вашей БД, если есть соответствующая таблица
            _characteristics.Add(new Characteristic { Name = "Масса", Value = "15", Unit = "кг" });
            _characteristics.Add(new Characteristic { Name = "Габариты", Value = "1200x800x500", Unit = "мм" });
        }

        private void LoadComponents()
        {
            _components.Clear();
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var command = new SqlCommand(
                    @"SELECT s.ComponentId, a.Name, s.Quantity, ar.ArticleName AS ArticleNumber 
                      FROM Specifications s
                      JOIN Accessories a ON s.ComponentId = a.AccessoriesId
                      JOIN Article ar ON a.ArticleId = ar.ArticleId
                      WHERE s.ProductId = @ProductId AND s.ComponentType = 'Accessory'",
                    connection);
                command.Parameters.AddWithValue("@ProductId", _currentProductId);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        _components.Add(new Component
                        {
                            ComponentId = Convert.ToInt32(reader["ComponentId"]),
                            Name = reader["Name"].ToString(),
                            Quantity = Convert.ToInt32(reader["Quantity"]),
                            ArticleNumber = reader["ArticleNumber"].ToString()
                        });
                    }
                }
            }
        }

        private void LoadParts()
        {
            _parts.Clear();
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var command = new SqlCommand(
                    @"SELECT s.ComponentId, d.Name, s.Quantity, g.GostName AS Gost 
                      FROM Specifications s
                      JOIN Details d ON s.ComponentId = d.DetailsId
                      LEFT JOIN Gost g ON d.GostId = g.GostId
                      WHERE s.ProductId = @ProductId AND s.ComponentType = 'Detail'",
                    connection);
                command.Parameters.AddWithValue("@ProductId", _currentProductId);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        _parts.Add(new Part
                        {
                            PartId = Convert.ToInt32(reader["ComponentId"]),
                            Name = reader["Name"].ToString(),
                            Quantity = Convert.ToInt32(reader["Quantity"]),
                            Gost = reader["Gost"] != DBNull.Value ? reader["Gost"].ToString() : "Не указан"
                        });
                    }
                }
            }
        }

        private void LoadOperations()
        {
            _operations.Clear();
            // Здесь можно добавить загрузку операций из вашей БД, если есть соответствующая таблица
            _operations.Add(new Operation { Equipment = "Токарный станок", Duration = "2 ч", Description = "Черновая обработка вала" });
            _operations.Add(new Operation { Equipment = "Фрезерный станок", Duration = "1.5 ч", Description = "Фрезеровка пазов" });
        }

        #region Обработчики кнопок для характеристик
        private void BtnAddCharacteristic_Click(object sender, RoutedEventArgs e)
        {
            _characteristics.Add(new Characteristic { Name = "Новая характеристика", Value = "", Unit = "" });
        }

        private void BtnRemoveCharacteristic_Click(object sender, RoutedEventArgs e)
        {
            if (dgCharacteristics.SelectedItem != null)
            {
                _characteristics.Remove((Characteristic)dgCharacteristics.SelectedItem);
            }
            else
            {
                MessageBox.Show("Выберите характеристику для удаления", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        #endregion

        #region Обработчики кнопок для комплектующих
        private void BtnAddComponent_Click(object sender, RoutedEventArgs e)
        {
            // В реальном приложении здесь нужно открыть диалог выбора комплектующего
            _components.Add(new Component { Name = "Новое комплектующее", Quantity = 1, ArticleNumber = "" });
        }

        private void BtnRemoveComponent_Click(object sender, RoutedEventArgs e)
        {
            if (dgComponents.SelectedItem != null)
            {
                var component = (Component)dgComponents.SelectedItem;

                try
                {
                    using (var connection = new SqlConnection(_connectionString))
                    {
                        connection.Open();
                        var command = new SqlCommand(
                            "DELETE FROM Specifications WHERE ProductId = @ProductId AND ComponentId = @ComponentId AND ComponentType = 'Accessory'",
                            connection);
                        command.Parameters.AddWithValue("@ProductId", _currentProductId);
                        command.Parameters.AddWithValue("@ComponentId", component.ComponentId);

                        command.ExecuteNonQuery();
                    }

                    _components.Remove(component);
                    MessageBox.Show("Комплектующее удалено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Выберите комплектующее для удаления", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        #endregion

        #region Обработчики кнопок для деталей
        private void BtnAddPart_Click(object sender, RoutedEventArgs e)
        {
            // В реальном приложении здесь нужно открыть диалог выбора детали
            _parts.Add(new Part { Name = "Новая деталь", Quantity = 1, Gost = "" });
        }

        private void BtnRemovePart_Click(object sender, RoutedEventArgs e)
        {
            if (dgParts.SelectedItem != null)
            {
                var part = (Part)dgParts.SelectedItem;

                try
                {
                    using (var connection = new SqlConnection(_connectionString))
                    {
                        connection.Open();
                        var command = new SqlCommand(
                            "DELETE FROM Specifications WHERE ProductId = @ProductId AND ComponentId = @ComponentId AND ComponentType = 'Detail'",
                            connection);
                        command.Parameters.AddWithValue("@ProductId", _currentProductId);
                        command.Parameters.AddWithValue("@ComponentId", part.PartId);

                        command.ExecuteNonQuery();
                    }

                    _parts.Remove(part);
                    MessageBox.Show("Деталь удалена", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                MessageBox.Show("Выберите деталь для удаления", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        #endregion

        #region Обработчики кнопок для операций
        private void BtnAddOperation_Click(object sender, RoutedEventArgs e)
        {
            _operations.Add(new Operation { Equipment = "Новое оборудование", Duration = "1 ч", Description = "" });
        }

        private void BtnRemoveOperation_Click(object sender, RoutedEventArgs e)
        {
            if (dgOperations.SelectedItem != null)
            {
                _operations.Remove((Operation)dgOperations.SelectedItem);
            }
            else
            {
                MessageBox.Show("Выберите операцию для удаления", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        #endregion

        #region Обработчики кнопок сохранения/отмены
        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Сохранение изменений в БД
                using (var connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    // Удаляем все существующие спецификации для этого продукта
                    var deleteCommand = new SqlCommand(
                        "DELETE FROM Specifications WHERE ProductId = @ProductId",
                        connection);
                    deleteCommand.Parameters.AddWithValue("@ProductId", _currentProductId);
                    deleteCommand.ExecuteNonQuery();

                    // Добавляем комплектующие
                    foreach (var component in _components)
                    {
                        var insertCommand = new SqlCommand(
                            "INSERT INTO Specifications (ProductId, ComponentType, ComponentId, Quantity) " +
                            "VALUES (@ProductId, 'Accessory', @ComponentId, @Quantity)",
                            connection);
                        insertCommand.Parameters.AddWithValue("@ProductId", _currentProductId);
                        insertCommand.Parameters.AddWithValue("@ComponentId", component.ComponentId);
                        insertCommand.Parameters.AddWithValue("@Quantity", component.Quantity);
                        insertCommand.ExecuteNonQuery();
                    }

                    // Добавляем детали
                    foreach (var part in _parts)
                    {
                        var insertCommand = new SqlCommand(
                            "INSERT INTO Specifications (ProductId, ComponentType, ComponentId, Quantity) " +
                            "VALUES (@ProductId, 'Detail', @ComponentId, @Quantity)",
                            connection);
                        insertCommand.Parameters.AddWithValue("@ProductId", _currentProductId);
                        insertCommand.Parameters.AddWithValue("@ComponentId", part.PartId);
                        insertCommand.Parameters.AddWithValue("@Quantity", part.Quantity);
                        insertCommand.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Изменения сохранены успешно", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            // Возврат на предыдущую страницу или закрытие окна
            if (NavigationService.CanGoBack)
            {
                NavigationService.GoBack();
            }
            else
            {
                var window = Window.GetWindow(this);
                window?.Close();
            }
        }
        #endregion
    }
}