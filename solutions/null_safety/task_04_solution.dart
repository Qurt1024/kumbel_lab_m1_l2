// Задача 4: Оператор утверждения не-null (!) (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем nullable String? переменную text со значением
  String? text = 'Dart';

  print('Текст: $text');

  // 2. Используем оператор ! (null assertion operator)
  // Оператор ! говорит компилятору: "Я уверен, что это значение НЕ null"
  // После ! переменная становится НЕ-nullable и можно вызывать методы
  // ВАЖНО: Используйте ! только когда ТОЧНО знаете, что значение не null!
  int textLength = text!.length;

  print('Длина текста: $textLength');
  print('(использован ! оператор, безопасно)');

  print('');

  // 3. Создаем nullable int? переменную number
  int? number = 42;

  print('Число: $number');

  // 4. Умножаем число на 2 используя ! оператор
  // number! преобразует nullable int? в НЕ-nullable int
  // После этого можно использовать математические операции
  int doubled = number! * 2;

  print('Число × 2: $doubled');
  print('(использован ! оператор, безопасно)');

  print('');

  // 5. Создаем nullable String? переменную emptyText со значением null
  String? emptyText = null;

  print('Пустой текст: $emptyText');
  print('Попытка использовать ! на null:');

  // 6. Попытка использовать ! на null (ОШИБКА!)
  // Если раскомментировать, программа упадет с ошибкой во время выполнения
  // Ошибка: "Null check operator used on a null value"
  // Оператор ! НЕ проверяет на null - он просто утверждает, что значение не null
  // emptyText!.length; // ОШИБКА! Null check operator used on a null value
  print('// emptyText!.length // ОШИБКА! Null check operator used on a null value');

  print('');
  print('Правильный способ с проверкой:');

  // 7. Правильный способ - использовать безопасный оператор ?.
  // Оператор ?. проверяет на null и не вызывает ошибку
  int? safeLength = emptyText?.length;

  print('Длина: $safeLength (проверено безопасно)');
}
