using System;
using System.Data.Entity.Validation;
using System.Linq;
using System.Windows;

namespace Партнеры
{
    public partial class AddEditPartnerWindow : Window
    {
        private Partners partner;

        public AddEditPartnerWindow(Partners partner = null)
        {
            InitializeComponent();
            this.partner = partner;

            // Заполнение выпадающего списка типов партнеров (пример)
            PartnerTypeComboBox.ItemsSource = new[] { "ЗАО", "ООО", "ПАО", "ОАО" };

            if (partner != null)
            {
                // Заполнение полей данными для редактирования
                NameTextBox.Text = partner.partner_name;
                PartnerTypeComboBox.SelectedItem = partner.partner_type; // Выбор текущего типа партнера
                RatingTextBox.Text = partner.rating.ToString();
                AddressTextBox.Text = partner.legal_address;
                DirectorNameTextBox.Text = partner.director_name;
                PhoneTextBox.Text = partner.phone;
                EmailTextBox.Text = partner.email;
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Проверка данных перед сохранением
                if (string.IsNullOrWhiteSpace(NameTextBox.Text))
                {
                    MessageBox.Show("Поле 'Наименование' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (PartnerTypeComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Поле 'Тип партнера' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (!int.TryParse(RatingTextBox.Text, out int rating) || rating < 0)
                {
                    MessageBox.Show("Рейтинг должен быть целым неотрицательным числом.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(AddressTextBox.Text))
                {
                    MessageBox.Show("Поле 'Адрес' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(DirectorNameTextBox.Text))
                {
                    MessageBox.Show("Поле 'ФИО директора' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(PhoneTextBox.Text))
                {
                    MessageBox.Show("Поле 'Телефон' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (string.IsNullOrWhiteSpace(EmailTextBox.Text))
                {
                    MessageBox.Show("Поле 'Email' не может быть пустым.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (partner == null)
                {
                    // Добавление нового партнера
                    partner = new Partners
                    {
                        partner_name = NameTextBox.Text,
                        partner_type = PartnerTypeComboBox.SelectedItem.ToString(),
                        rating = rating,
                        legal_address = AddressTextBox.Text,
                        director_name = DirectorNameTextBox.Text,
                        phone = PhoneTextBox.Text,
                        email = EmailTextBox.Text
                    };
                    Entities.GetContext().Partners.Add(partner);
                }
                else
                {
                    // Редактирование существующего партнера
                    partner.partner_name = NameTextBox.Text;
                    partner.partner_type = PartnerTypeComboBox.SelectedItem.ToString();
                    partner.rating = rating;
                    partner.legal_address = AddressTextBox.Text;
                    partner.director_name = DirectorNameTextBox.Text;
                    partner.phone = PhoneTextBox.Text;
                    partner.email = EmailTextBox.Text;
                }

                Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                Close();
            }
            catch (DbEntityValidationException ex)
            {
                // Обработка ошибок валидации
                var errorMessages = ex.EntityValidationErrors
                    .SelectMany(x => x.ValidationErrors)
                    .Select(x => x.ErrorMessage);

                var fullErrorMessage = string.Join("\n", errorMessages);
                MessageBox.Show($"Ошибка валидации:\n{fullErrorMessage}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                // Обработка других исключений
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}