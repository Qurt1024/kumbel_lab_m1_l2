// Задача 5: Перебор элементов Map (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map<String, double> с товарами и ценами
  Map<String, double> products = {
    'Хлеб': 50.0,
    'Молоко': 80.0,
    'Яйца': 120.0,
    'Масло': 200.0,
    'Сыр': 350.0
  };

  // 2. Выводим каждый товар и его цену
  // Обращаемся к каждому значению по его ключу напрямую
  print('Список товаров и цен:');
  print('Хлеб: ${products['Хлеб']} руб.');
  print('Молоко: ${products['Молоко']} руб.');
  print('Яйца: ${products['Яйца']} руб.');
  print('Масло: ${products['Масло']} руб.');
  print('Сыр: ${products['Сыр']} руб.');
  print('');

  // 3. Получаем список всех ключей (названий товаров)
  // .keys возвращает коллекцию всех ключей Map
  var productKeys = products.keys;
  print('Ключи (товары): ${productKeys.toList()}');

  // 4. Получаем список всех значений (цен)
  // .values возвращает коллекцию всех значений Map
  var productValues = products.values;
  print('Значения (цены): ${productValues.toList()}');
  print('');

  // 5. Находим самую высокую цену
  // Преобразуем значения в список и получаем доступ к каждому элементу
  var prices = productValues.toList();
  var maxPrice = prices[0];  // начинаем с первой цены
  // Проверяем каждую цену и обновляем максимум если нашли больше
  if (prices[1] > maxPrice) maxPrice = prices[1];
  if (prices[2] > maxPrice) maxPrice = prices[2];
  if (prices[3] > maxPrice) maxPrice = prices[3];
  if (prices[4] > maxPrice) maxPrice = prices[4];
  print('Самая высокая цена: $maxPrice руб.');

  // 6. Находим самую низкую цену
  // Аналогично, но ищем минимальное значение
  var minPrice = prices[0];  // начинаем с первой цены
  if (prices[1] < minPrice) minPrice = prices[1];
  if (prices[2] < minPrice) minPrice = prices[2];
  if (prices[3] < minPrice) minPrice = prices[3];
  if (prices[4] < minPrice) minPrice = prices[4];
  print('Самая низкая цена: $minPrice руб.');

  // 7. Вычисляем общую стоимость (сумму всех цен)
  // Складываем все цены вручную, так как циклы не доступны
  var totalCost = prices[0] + prices[1] + prices[2] + prices[3] + prices[4];
  print('Общая стоимость: $totalCost руб.');

  // 8. Вычисляем среднюю цену
  // Делим общую сумму на количество товаров
  var averagePrice = totalCost / products.length;
  print('Средняя цена: $averagePrice руб.');
}
