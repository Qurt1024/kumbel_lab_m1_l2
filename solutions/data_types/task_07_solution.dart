// Задача 7: Тип данных num (Средняя) - РЕШЕНИЕ

void main() {
  // 1-4. Создаем num переменные
  // num - это общий тип для int и double
  // Переменная num может хранить как целые, так и дробные числа
  num temperature = 36.6; // double
  num age = 25;           // int
  num score = 100;        // int

  // 5. Выполняем вычисления
  // Сумма всех чисел
  num sum = temperature + age + score;

  // Среднее значение (делим на 3)
  num average = sum / 3;

  // 6. Проверяем тип каждой переменной
  // Оператор is проверяет принадлежность к типу
  bool tempIsDouble = temperature is double;
  bool tempIsInt = temperature is int;
  bool ageIsInt = age is int;
  bool ageIsDouble = age is double;

  // 7. Выводим результаты
  print('Исходные данные:');
  print('temperature: $temperature (это ${temperature is double ? 'double' : 'int'})');
  print('age: $age (это ${age is int ? 'int' : 'double'})');
  print('score: $score (это ${score is int ? 'int' : 'double'})');
  print('');
  print('Вычисления:');
  print('Сумма: $sum');
  print('Среднее: $average');
  print('');
  print('Проверка типов:');
  print('temperature является double: $tempIsDouble');
  print('temperature является int: $tempIsInt');
  print('age является int: $ageIsInt');
  print('age является double: $ageIsDouble');

  // ЧТО ТАКОЕ num?
  // num - это родительский (базовый) тип для int и double
  // Используется когда не важно, целое число или дробное
  //
  // ИЕРАРХИЯ ТИПОВ:
  //        num
  //       /   \
  //     int   double
  //
  // Это значит:
  // - любой int это тоже num
  // - любой double это тоже num
  // - но num может быть либо int, либо double

  // КОГДА ИСПОЛЬЗОВАТЬ num?
  // 1. Когда переменная может быть как int, так и double
  // 2. В параметрах функций, принимающих любые числа
  // 3. Когда тип определяется во время выполнения

  // ПРИМЕРЫ:
  // num value1 = 10;      // int
  // num value2 = 10.5;    // double
  // num result = value1 + value2; // 20.5 (double)
  //
  // Оператор is:
  // 10 is int = true
  // 10 is double = false
  // 10 is num = true
  // 10.5 is double = true
  // 10.5 is num = true
}
