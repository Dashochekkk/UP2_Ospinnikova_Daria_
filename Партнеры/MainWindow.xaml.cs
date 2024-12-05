using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Партнеры
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Windoц
    {
        public MainWindow()
        {
            InitializeComponent();
            var currentUsers = Entities.GetContext().Partners.ToList();
            partnersListView.ItemsSource = currentUsers;
           
        }
        public static decimal CalculateDiscount( int partnerId)
        {
            var sales = Entities.GetContext().SalesHistory.ToList();
            // Рассчитываем общее количество продукции, реализованной партнером
            int totalQuantity = sales.Where(s => s.partner_id == partnerId).Sum(s => s.quantity);

            // Определяем процент скидки на основе общего количества
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
    }
}

