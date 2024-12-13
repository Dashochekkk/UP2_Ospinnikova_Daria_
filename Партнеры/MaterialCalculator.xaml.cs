using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Партнеры
{
    public partial class MaterialCalculator : Page
    {
        public MaterialCalculator()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            // Загрузка партнеров из базы данных
            using (var context = new Entities())
            {
                PartnerComboBox.ItemsSource = context.Partners.ToList();
                MaterialTypeComboBox.ItemsSource = context.MaterialType.ToList(); // Исправлено: загружаем из MaterialType
                ProductTypeComboBox.ItemsSource = context.ProductType.ToList(); // Исправлено: загружаем из ProductType
            }
        }

        private void CalculateMaterialFromHistory_Click(object sender, RoutedEventArgs e)
        {
            // Получение ID партнера из ComboBox
            if (PartnerComboBox.SelectedItem is Partners selectedPartner)
            {
                int partnerId = selectedPartner.partner_id;

                
                decimal totalMaterialNeeded = 0;

                // Отображение результата
                if (totalMaterialNeeded == -1)
                {
                    ResultTextBlock.Text = "Некорректные данные для расчета.";
                }
                else
                {
                    ResultTextBlock.Text = $"Необходимое количество материала на основе истории продаж: {totalMaterialNeeded}";
                }
            }
            else
            {
                ResultTextBlock.Text = "Пожалуйста, выберите партнера.";
            }
        }

        private void CalculateMaterial_Click(object sender, RoutedEventArgs e)
        {
            // Логика для расчета материала на основе введенных данных
            ResultTextBlock.Text = "Расчет материала по введенным данным.";
        }
    }
}