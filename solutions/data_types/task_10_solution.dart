// Задача 10: Работа с типом Object и приведение типов (Сложная) - РЕШЕНИЕ

void main() {
  // 1-4. Создаем Object переменные
  // Object - это базовый тип для ВСЕХ объектов в Dart
  // Любое значение в Dart является Object (даже числа и строки)
  Object item1 = 'Привет';
  Object item2 = 42;
  Object item3 = 3.14;
  Object item4 = true;

  // 5. Обрабатываем каждую переменную
  print('Обработка Object переменных:');
  print('');

  // Обработка item1 (String)
  print('item1: $item1');

  // Проверяем тип с помощью оператора is
  if (item1 is String) {
    print('Проверка типа: это String');

    // Приводим к конкретному типу с помощью оператора as
    // После приведения можем использовать методы String
    String text = item1 as String;
    print('Длина строки: ${text.length}');
  }
  print('');

  // Обработка item2 (int)
  print('item2: $item2');
  if (item2 is int) {
    print('Проверка типа: это int');

    // Приводим к int и выполняем операцию
    int number = item2 as int;
    print('Умножить на 2: ${number * 2}');
  }
  print('');

  // Обработка item3 (double)
  print('item3: $item3');
  if (item3 is double) {
    print('Проверка типа: это double');

    // Приводим к double и округляем
    double decimal = item3 as double;
    print('Округлено: ${decimal.toInt()}');
  }
  print('');

  // Обработка item4 (bool)
  print('item4: $item4');
  if (item4 is bool) {
    print('Проверка типа: это bool');

    // Приводим к bool и инвертируем
    bool flag = item4 as bool;
    print('Инвертировано: ${!flag}');
  }
  print('');

  // 7. Пример неправильного приведения типа (закомментирован)
  print('Попытка неправильного приведения:');
  print('// String wrongText = item2 as String; // ОШИБКА во время выполнения!');

  // ВАЖНЫЕ ОПЕРАТОРЫ:
  // is - проверка типа (возвращает bool)
  //   'text' is String = true
  //   42 is String = false
  //
  // as - приведение типа (type casting)
  //   Object obj = 'text';
  //   String str = obj as String; // Преобразуем Object в String

  // РАЗНИЦА МЕЖДУ Object И dynamic:
  // Object:
  // - Базовый тип для всех объектов
  // - Компилятор проверяет типы
  // - Нужно приводить к конкретному типу для использования методов
  // - БЕЗОПАСНЕЕ, так как проверяется на этапе компиляции
  //
  // dynamic:
  // - Отключает проверку типов полностью
  // - Можно вызывать любые методы (ошибки только во время выполнения)
  // - НЕ РЕКОМЕНДУЕТСЯ для обычного кода

  // ПРИМЕР БЕЗОПАСНОЙ РАБОТЫ:
  // Object value = getUserData();
  //
  // // Сначала проверяем тип
  // if (value is String) {
  //   String text = value as String;
  //   print(text.toUpperCase()); // Безопасно!
  // } else if (value is int) {
  //   int number = value as int;
  //   print(number * 2); // Безопасно!
  // }

  // КОГДА ИСПОЛЬЗОВАТЬ Object?
  // - Коллекции с разными типами данных
  // - Возвращаемое значение может быть разных типов
  // - Универсальные контейнеры данных
  //
  // Пример: List<Object> mixedList = ['text', 42, 3.14, true];


  // Попробуйте раскомментировать (неправильное приведение):
  // String wrongText = item2 as String; // Что произойдет?
  // ОШИБКА: type 'int' is not a subtype of type 'String' in type cast
}
