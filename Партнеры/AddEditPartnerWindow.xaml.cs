using System;
using System.Windows;

namespace Партнеры
{
    public partial class AddEditPartnerWindow : Window
    {
        private Partners partner;

        public AddEditPartnerWindow(Partners partner)
        {
            InitializeComponent();
            this.partner = partner;

            if (partner != null)
            {
                // Заполнение полей данными для редактирования
                NameTextBox.Text = partner.partner_name;
                RatingTextBox.Text = partner.rating.ToString();
                PhoneTextBox.Text = partner.phone;
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (partner == null)
                {
                    // Добавление нового партнера
                    partner = new Partners
                    {
                        partner_name = NameTextBox.Text,
                        rating = int.Parse(RatingTextBox.Text),
                        phone = PhoneTextBox.Text
                    };
                    Entities.GetContext().Partners.Add(partner);
                }
                else
                {
                    // Редактирование существующего партнера
                    partner.partner_name = NameTextBox.Text;
                    partner.rating = int.Parse(RatingTextBox.Text);
                    partner.phone = PhoneTextBox.Text;
                }

                Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}