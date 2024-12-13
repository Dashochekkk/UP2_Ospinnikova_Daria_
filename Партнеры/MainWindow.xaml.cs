using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace Партнеры
{
    public partial class MainWindow : Window
    {
        private List<Partners> cachedPartners;
        private Dictionary<int, decimal> discountDictionary = new Dictionary<int, decimal>();

        public MainWindow()
        {
            InitializeComponent();
            // Передаем словарь скидок в конвертер
            DiscountConverter.DiscountDictionary = discountDictionary;
            LoadDataAsync();
        }

        private async void LoadDataAsync()
        {
            cachedPartners = await Task.Run(() =>
            {
                var partners = Entities.GetContext().Partners.ToList();
                foreach (var partner in partners)
                {
                    discountDictionary[partner.partner_id] = CalculateDiscount(partner.partner_id);
                }
                return partners;
            });
            partnersListView.ItemsSource = cachedPartners;
        }

        public static decimal CalculateDiscount(int partnerId)
        {
            var sales = Entities.GetContext().SalesHistory.Where(s => s.partner_id == partnerId).ToList();
            int totalQuantity = sales.Sum(s => s.quantity);

            int discount = 0;
            if (totalQuantity >= 10000 && totalQuantity < 50000)
            {
                discount = 5;
            }
            else if (totalQuantity >= 50000 && totalQuantity < 300000)
            {
                discount = 10;
            }
            else if (totalQuantity >= 300000)
            {
                discount = 15;
            }

            return discount;
        }

        private void AddPartner_Click(object sender, RoutedEventArgs e)
        {
            // Открытие окна добавления партнера
            var addPartnerWindow = new AddEditPartnerWindow(null);
            addPartnerWindow.ShowDialog();
            LoadDataAsync(); // Обновление списка партнеров
        }

        private void EditPartner_Click(object sender, RoutedEventArgs e)
        {
            // Проверка, выбран ли партнер
            if (partnersListView.SelectedItem is Partners selectedPartner)
            {
                // Открытие окна редактирования партнера
                var editPartnerWindow = new AddEditPartnerWindow(selectedPartner);
                editPartnerWindow.ShowDialog();
                LoadDataAsync(); // Обновление списка партнеров
            }
            else
            {
                MessageBox.Show("Выберите партнера для редактирования.", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        private void partnersListView_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            // Проверяем, выбран ли элемент в ListView
            if (partnersListView.SelectedItem is Partners selectedPartner)
            {
                // Открываем окно с историей реализации
                var saleHistoryWindow = new SaleHistoryWindow(selectedPartner.partner_id);
                saleHistoryWindow.ShowDialog();
            }
            else
            {
                MessageBox.Show("Выберите партнера для просмотра истории реализации.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
    public class DiscountConverter : IValueConverter
    {
        public static Dictionary<int, decimal> DiscountDictionary { get; set; } = new Dictionary<int, decimal>();

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int partnerId && DiscountDictionary.ContainsKey(partnerId))
            {
                return DiscountDictionary[partnerId];
            }
            return 0;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}