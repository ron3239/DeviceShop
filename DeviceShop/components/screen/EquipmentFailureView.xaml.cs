using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using DeviceShop;

namespace DeviceShop.components.screen
{
    public partial class EquipmentFailureView : Page
    {
        private DeviceShopEntities2 _context;
        private int? _currentFailureId = null;

        public EquipmentFailureView()
        {
            InitializeComponent();
            Loaded += (s, e) => EquipmentFailureView_Loaded();
        }

        private void EquipmentFailureView_Loaded()
        {
            try
            {
                _context = new DeviceShopEntities2();

                // Загрузка оборудования
                var equipmentList = _context.Equipment
                    .Where(e => (bool)e.IsActive)
                    .Select(e => new { e.Id, e.Name })
                    .ToList();

                cmbEquipment.ItemsSource = equipmentList;
                cmbEquipment.DisplayMemberPath = "Name";
                cmbEquipment.SelectedValuePath = "Id";

                // Для демонстрации содержимого списка
                string equipmentNames = string.Join("\n", equipmentList.Select(e => e.Name));
                MessageBox.Show($"Доступное оборудование:\n{equipmentNames}");

                // Загрузка причин сбоев
                var failureReasons = _context.FailureReason
                    .Where(fr => (bool)fr.IsActive)
                    .Select(fr => new { fr.Id, fr.Description })
                    .ToList();

                cmbFailureReason.ItemsSource = failureReasons;
                cmbFailureReason.DisplayMemberPath = "Description";
                cmbFailureReason.SelectedValuePath = "Id";

                txtStartTime.Text = DateTime.Now.ToString("HH:mm");
                txtReportedBy.Text = Environment.UserName;

                LoadFailureHistory();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке данных: {ex.Message}");
            }
        }

        private void LoadFailureHistory()
        {
            try
            {
                var failureHistory = _context.EquipmentFailure
                    .Include(f => f.Equipment)
                    .Include(f => f.FailureReason)
                    .OrderByDescending(f => f.StartTime)
                    .Select(f => new
                    {
                        Device = f.Equipment.Name,
                        Error = f.FailureReason.Description,
                        startTime = f.StartTime,
                        endTime = f.EndTime,
                        Duration = f.EndTime.HasValue ? (f.EndTime - f.StartTime).ToString() : "В процессе",
                        ReportedBy = f.ReportedBy,
                        FixedBy = f.FixedBy
                    })
                    .ToList();

                dgFailures.ItemsSource = failureHistory;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке истории сбоев: {ex.Message}");
            }
        }

        private void BtnRegister_Click(object sender, RoutedEventArgs e)
        {
            if (cmbEquipment.SelectedItem == null || cmbFailureReason.SelectedItem == null)
            {
                MessageBox.Show("Выберите оборудование и причину сбоя");
                return;
            }

            if (!DateTime.TryParse(txtStartTime.Text, out var startTime))
            {
                MessageBox.Show("Некорректный формат времени (используйте HH:mm)");
                return;
            }

            var startDateTime = dpStartDate.SelectedDate.Value.Date.Add(startTime.TimeOfDay);

            try
            {
                var failure = new EquipmentFailure
                {
                    EquipmentId = (int)cmbEquipment.SelectedValue,
                    FailureReasonId = (int)cmbFailureReason.SelectedValue,
                    StartTime = startDateTime,
                    Notes = txtNotes.Text,
                    ReportedBy = txtReportedBy.Text,
                    EndTime = null,
                    FixedBy = null
                };

                _context.EquipmentFailure.Add(failure);
                _context.SaveChanges();

                _currentFailureId = failure.Id;
                btnRegister.IsEnabled = false;
                btnResume.IsEnabled = true;

                LoadFailureHistory();
                MessageBox.Show("Сбой успешно зарегистрирован");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при регистрации сбоя: {ex.Message}");
            }
        }

        private void BtnResume_Click(object sender, RoutedEventArgs e)
        {
            if (!_currentFailureId.HasValue)
            {
                MessageBox.Show("Нет активного сбоя для завершения");
                return;
            }

            try
            {
                var failure = _context.EquipmentFailure.Find(_currentFailureId.Value);
                if (failure != null)
                {
                    failure.EndTime = DateTime.Now;
                    failure.FixedBy = Environment.UserName;
                    _context.SaveChanges();

                    _currentFailureId = null;
                    btnRegister.IsEnabled = true;
                    btnResume.IsEnabled = false;

                    LoadFailureHistory();
                    MessageBox.Show("Устранение сбоя зафиксировано");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при фиксации устранения: {ex.Message}");
            }
        }
    }
}