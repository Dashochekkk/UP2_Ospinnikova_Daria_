using System;
using System.Linq;

namespace Партнеры
{
    public class MaterialCalculatorLogic
    {
        public static int CalculateMaterial(int productTypeId, int materialTypeId, int quantity, double param1, double param2)
        {
            using (var context = new Entities())
            {
                // Получаем коэффициент типа продукции
                var productType = context.ProductType.FirstOrDefault(pt => pt.product_type_id == productTypeId);
                if (productType == null)
                {
                    return -1; // Тип продукции не найден
                }

                // Получаем процент брака материала
                var materialType = context.MaterialType.FirstOrDefault(mt => mt.material_type_id == materialTypeId);
                if (materialType == null)
                {
                    return -1; // Тип материала не найден
                }

                // Проверяем, что параметры продукции положительные
                if (param1 <= 0 || param2 <= 0)
                {
                    return -1; // Некорректные параметры продукции
                }

                // Рассчитываем количество материала на одну единицу продукции
                double materialPerUnit = param1 * param2 * (double)productType.type_coefficient;

                // Учитываем процент брака материала
                double defectRate = (double)materialType.defect_rate;
                double totalMaterial = materialPerUnit * quantity * (1 + defectRate);

                // Округляем до целого числа, так как количество материала должно быть целым
                return (int)Math.Ceiling(totalMaterial);
            }
        }
    }
}