using System.Linq;
using System.Windows.Controls;

namespace DeviceShop.components.screen
{
    /// <summary>
    /// Логика взаимодействия для AccountingEquipment.xaml
    /// </summary>
    public partial class AccountingEquipment : Page
    {
        public AccountingEquipment()
        {
            InitializeComponent();
            DeviceShopEntities dataBase = new DeviceShopEntities();
            DataGrid.ItemsSource = dataBase.Details.ToList();
        }

    }

}

/*namespace DeviceShop.components.screen
{
    public partial class AccountingEquipment : Page
    {
        public AccountingEquipment()
        {
            InitializeComponent();

            // Создаем контекст БД
            using (var dataBase = new DeviceShopEntities())
            {
                // Отключаем прокси для чистых данных
                dataBase.Configuration.ProxyCreationEnabled = false;

                // Загружаем данные с явным указанием нужных полей
                DataGrid.ItemsSource = dataBase.Details
                    .Select(d => new  // Создаем анонимный тип с нужными полями
                    {
                        d.Id,
                        d.Name,
                        d.ArticleNumber,
                        d.Price,
                        // Добавьте другие нужные поля
                        CategoryName = d.Category.Name, // Пример для связанной сущности
                        SupplierName = d.Supplier.Name  // Пример для связанной сущности
                    })
                    .ToList();
            }
        }
    }
}*/