// Задача 9: Группировка данных с помощью Map (Сложная) - РЕШЕНИЕ

void main() {
  // 1. Создаем список транзакций
  // Каждая транзакция - это Map с информацией о покупке
  List<Map<String, dynamic>> transactions = [
    {'id': 1, 'category': 'еда', 'amount': 500, 'date': '2024-01-15'},
    {'id': 2, 'category': 'транспорт', 'amount': 200, 'date': '2024-01-16'},
    {'id': 3, 'category': 'еда', 'amount': 800, 'date': '2024-01-17'},
    {'id': 4, 'category': 'развлечения', 'amount': 1500, 'date': '2024-01-18'},
    {'id': 5, 'category': 'здоровье', 'amount': 2000, 'date': '2024-01-19'},
    {'id': 6, 'category': 'еда', 'amount': 600, 'date': '2024-01-20'},
    {'id': 7, 'category': 'транспорт', 'amount': 300, 'date': '2024-01-21'},
    {'id': 8, 'category': 'еда', 'amount': 600, 'date': '2024-01-22'},
    {'id': 9, 'category': 'транспорт', 'amount': 300, 'date': '2024-01-23'},
    {'id': 10, 'category': 'развлечения', 'amount': 1200, 'date': '2024-01-24'}
  ];

  // Выводим все транзакции
  print('Все транзакции (10):');
  print('#${transactions[0]['id']}: ${transactions[0]['category']} - ${transactions[0]['amount']} руб.');
  print('#${transactions[1]['id']}: ${transactions[1]['category']} - ${transactions[1]['amount']} руб.');
  print('#${transactions[2]['id']}: ${transactions[2]['category']} - ${transactions[2]['amount']} руб.');
  print('#${transactions[3]['id']}: ${transactions[3]['category']} - ${transactions[3]['amount']} руб.');
  print('#${transactions[4]['id']}: ${transactions[4]['category']} - ${transactions[4]['amount']} руб.');
  print('#${transactions[5]['id']}: ${transactions[5]['category']} - ${transactions[5]['amount']} руб.');
  print('#${transactions[6]['id']}: ${transactions[6]['category']} - ${transactions[6]['amount']} руб.');
  print('#${transactions[7]['id']}: ${transactions[7]['category']} - ${transactions[7]['amount']} руб.');
  print('#${transactions[8]['id']}: ${transactions[8]['category']} - ${transactions[8]['amount']} руб.');
  print('#${transactions[9]['id']}: ${transactions[9]['category']} - ${transactions[9]['amount']} руб.');
  print('');

  // 2-3. Группируем транзакции по категориям и вычисляем статистику
  print('Группировка по категориям:');
  print('');

  // Категория: еда (транзакции 0, 2, 5, 7)
  var foodTransactions = 4;
  var foodTotal = transactions[0]['amount'] + transactions[2]['amount'] +
                  transactions[5]['amount'] + transactions[7]['amount'];
  var foodAverage = foodTotal / foodTransactions;

  print('Категория: еда');
  print('Транзакций: $foodTransactions');
  print('Общая сумма: $foodTotal руб.');
  print('Средняя: $foodAverage руб.');
  print('');

  // Категория: транспорт (транзакции 1, 6, 8)
  var transportTransactions = 3;
  var transportTotal = transactions[1]['amount'] + transactions[6]['amount'] +
                       transactions[8]['amount'];
  var transportAverage = transportTotal / transportTransactions;

  print('Категория: транспорт');
  print('Транзакций: $transportTransactions');
  print('Общая сумма: $transportTotal руб.');
  print('Средняя: ${transportAverage.toStringAsFixed(2)} руб.');
  print('');

  // Категория: развлечения (транзакции 3, 9)
  var entertainmentTransactions = 2;
  var entertainmentTotal = transactions[3]['amount'] + transactions[9]['amount'];
  var entertainmentAverage = entertainmentTotal / entertainmentTransactions;

  print('Категория: развлечения');
  print('Транзакций: $entertainmentTransactions');
  print('Общая сумма: $entertainmentTotal руб.');
  print('Средняя: $entertainmentAverage руб.');
  print('');

  // Категория: здоровье (транзакция 4)
  var healthTransactions = 1;
  var healthTotal = transactions[4]['amount'];
  var healthAverage = healthTotal / healthTransactions;

  print('Категория: здоровье');
  print('Транзакций: $healthTransactions');
  print('Общая сумма: $healthTotal руб.');
  print('Средняя: $healthAverage руб.');
  print('');

  // 4-5. Находим категорию с наибольшими расходами и количеством транзакций
  print('Анализ:');

  // Сравниваем общие суммы по категориям
  var maxExpense = foodTotal;
  var maxExpenseCategory = 'еда';

  if (transportTotal > maxExpense) {
    maxExpense = transportTotal;
    maxExpenseCategory = 'транспорт';
  }
  if (entertainmentTotal > maxExpense) {
    maxExpense = entertainmentTotal;
    maxExpenseCategory = 'развлечения';
  }
  if (healthTotal > maxExpense) {
    maxExpense = healthTotal;
    maxExpenseCategory = 'здоровье';
  }

  print('Наибольшие расходы: $maxExpenseCategory ($maxExpense руб.)');

  // Сравниваем количество транзакций по категориям
  var maxCount = foodTransactions;
  var maxCountCategory = 'еда';

  if (transportTransactions > maxCount) {
    maxCount = transportTransactions;
    maxCountCategory = 'транспорт';
  }
  if (entertainmentTransactions > maxCount) {
    maxCount = entertainmentTransactions;
    maxCountCategory = 'развлечения';
  }
  if (healthTransactions > maxCount) {
    maxCount = healthTransactions;
    maxCountCategory = 'здоровье';
  }

  print('Больше всего транзакций: $maxCountCategory ($maxCount шт.)');
}
