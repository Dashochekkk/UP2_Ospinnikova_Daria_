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
            // Загрузка партнеров, типов продукции и типов материалов из базы данных
            using (var context = new Entities())
            {
               
                ProductTypeComboBox.ItemsSource = context.ProductType.ToList();
                MaterialTypeComboBox.ItemsSource = context.MaterialType.ToList();
            }
        }

        private void CalculateMaterial_Click(object sender, RoutedEventArgs e)
        {
            
            // Проверка, что все поля заполнены
            if (ProductTypeComboBox.SelectedItem == null ||
                MaterialTypeComboBox.SelectedItem == null ||
                !int.TryParse(QuantityTextBox.Text, out int quantity) ||
                !double.TryParse(Param1TextBox.Text, out double param1) ||
                !double.TryParse(Param2TextBox.Text, out double param2))
            {
                ResultTextBlock.Text = "Пожалуйста, заполните все поля корректно.";
                return;
            }

            // Получаем выбранные типы продукции и материала
            var selectedProductType = ProductTypeComboBox.SelectedItem as ProductType;
            var selectedMaterialType = MaterialTypeComboBox.SelectedItem as MaterialType;

            if (selectedProductType == null || selectedMaterialType == null)
            {
                ResultTextBlock.Text = "Некорректный выбор типа продукции или материала.";
                return;
            }

            // Вызываем метод расчета материала
            int requiredMaterial = MaterialCalculatorLogic.CalculateMaterial(
                selectedProductType.product_type_id,
                selectedMaterialType.material_type_id,
                quantity,
                param1,
                param2);

            if (requiredMaterial == -1)
            {
                ResultTextBlock.Text = "Ошибка: некорректные данные для расчета.";
            }
            else
            {
                ResultTextBlock.Text = $"Необходимое количество материала: {requiredMaterial}";
            }
        }

       

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}