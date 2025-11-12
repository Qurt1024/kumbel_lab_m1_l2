// Задача 6: Изменение значений переменных (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем переменную balance (баланс счета)
  var balance = 1000;

  // 2. Создаем переменную transactions (количество операций)
  var transactions = 0;

  print('Начальный баланс: $balance');
  print('--- Операции ---');

  // 3. Операция 1: Пополнение на 500
  balance = balance + 500; // Или balance += 500;
  transactions = transactions + 1; // Или transactions++;
  print('+ 500 (пополнение)');
  print('Баланс: $balance');

  // Операция 2: Покупка на 200
  balance = balance - 200; // Или balance -= 200;
  transactions = transactions + 1;
  print('- 200 (покупка)');
  print('Баланс: $balance');

  // Операция 3: Зарплата +1000
  balance = balance + 1000;
  transactions = transactions + 1;
  print('+ 1000 (зарплата)');
  print('Баланс: $balance');

  // Операция 4: Оплата -300
  balance = balance - 300;
  transactions = transactions + 1;
  print('- 300 (оплата)');
  print('Баланс: $balance');

  // 4. Выводим итоговый баланс и количество операций
  print('--- Итого ---');
  print('Финальный баланс: $balance');
  print('Всего операций: $transactions');

  // Дополнительно: демонстрация сокращенных операторов
  print('\n--- Сокращенные операторы ---');
  var amount = 100;
  print('Начальная сумма: $amount');

  amount += 50; // Эквивалентно: amount = amount + 50;
  print('После += 50: $amount');

  amount -= 30; // Эквивалентно: amount = amount - 30;
  print('После -= 30: $amount');

  amount *= 2; // Эквивалентно: amount = amount * 2;
  print('После *= 2: $amount');

  amount ~/= 4; // Целочисленное деление: amount = amount ~/ 4;
  print('После ~/= 4: $amount');
}
