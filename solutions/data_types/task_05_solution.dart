// Задача 5: Преобразование типов (Средняя) - РЕШЕНИЕ

void main() {
  // 1-2. Создаем строковые переменные с числами
  String strNumber = '42';
  String strDouble = '3.14';

  // 3. Преобразуем строку в целое число
  // int.parse() - парсит (разбирает) строку и преобразует в int
  // Важно: строка должна содержать корректное число, иначе ошибка!
  int numberFromString = int.parse(strNumber);

  // 4. Преобразуем строку в число с дробной частью
  // double.parse() - парсит строку и преобразует в double
  double doubleFromString = double.parse(strDouble);

  // 5. Создаем переменную с возрастом
  int age = 25;

  // 6. Преобразуем число в строку
  // .toString() - преобразует любое значение в строку
  // Это нужно когда хотим число использовать как текст
  String ageAsString = age.toString();

  // 7. Преобразуем int в double
  // .toDouble() - преобразует целое число в дробное
  // 10 становится 10.0
  int intNumber = 10;
  double intAsDouble = intNumber.toDouble();

  // 8. Преобразуем double в int
  // .toInt() - отбрасывает дробную часть, оставляет только целую
  // 9.8 становится 9 (НЕ округление, а отбрасывание!)
  double doubleNumber = 9.8;
  int doubleAsInt = doubleNumber.toInt();

  // 9. Выводим все результаты
  print('Исходные данные:');
  print("strNumber (String): '$strNumber'");
  print("strDouble (String): '$strDouble'");
  print('');
  print('После преобразования:');
  print('число из strNumber (int): $numberFromString');
  print('число из strDouble (double): $doubleFromString');
  print("возраст как строка (String): '$ageAsString'");
  print('10 как double: $intAsDouble');
  print('9.8 как int: $doubleAsInt');

  // ОСНОВНЫЕ МЕТОДЫ ПРЕОБРАЗОВАНИЯ:
  // String → int: int.parse('42')
  // String → double: double.parse('3.14')
  // int → String: (42).toString()
  // double → String: (3.14).toString()
  // int → double: (10).toDouble() = 10.0
  // double → int: (9.8).toInt() = 9 (отбрасывает дробную часть!)
  // double → int (округление): (9.8).round() = 10

  // ВАЖНО:
  // - .toInt() НЕ округляет, а отбрасывает дробную часть!
  // - Для округления используйте .round(), .ceil(), .floor()
  // - int.parse() выдаст ошибку если строка не число: int.parse('abc') - ОШИБКА!
}
