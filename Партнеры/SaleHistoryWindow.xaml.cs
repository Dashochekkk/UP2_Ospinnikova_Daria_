using System;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace Партнеры
{
    /// <summary>
    /// Логика взаимодействия для SaleHistoryWindow.xaml
    /// </summary>
    public partial class SaleHistoryWindow : Window
    {
        private int partnerId;

        public SaleHistoryWindow(int partnerId)
        {
            InitializeComponent();
            this.partnerId = partnerId;
            LoadSaleHistory();
        }

        private void LoadSaleHistory()
        {
            using (var context = new Entities())
            {
                // Загрузка истории продаж с данными из таблицы Products
                var sales = context.SalesHistory
            .Where(s => s.partner_id == partnerId)
            .Include(s => s.Products) // Загружаем связанные данные из таблицы Products
            .OrderByDescending(s => s.sale_date)
            .ToList();

                SaleHistoryListView.ItemsSource = sales;
            }
        }

       

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
           

        }
    }
}