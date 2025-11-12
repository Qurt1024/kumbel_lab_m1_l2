// Задача 7: Типизированные переменные (Средняя) - РЕШЕНИЕ

void main() {
  // 1-6. Создаем переменные с явными типами
  String firstName = 'Иван';
  String lastName = 'Иванов';
  int age = 20;
  double height = 1.75; // рост в метрах
  double weight = 70.0; // вес в килограммах
  bool isStudent = true;

  // 7. Вычисляем индекс массы тела (BMI)
  double bmi = weight / (height * height);

  // 8. Выводим всю информацию в виде профиля пользователя
  print('=== ПРОФИЛЬ ПОЛЬЗОВАТЕЛЯ ===');
  print('ФИО: $firstName $lastName');
  print('Возраст: $age лет');
  print('Рост: $height м');
  print('Вес: $weight кг');
  print('Студент: ${isStudent ? "да" : "нет"}');
  print('Индекс массы тела: ${bmi.toStringAsFixed(2)}');

  // Дополнительно: объяснение типов
  print('\n=== ТИПЫ ПЕРЕМЕННЫХ ===');
  print('firstName и lastName - тип String (текст)');
  print('age - тип int (целое число)');
  print('height и weight - тип double (дробное число)');
  print('isStudent - тип bool (логическое значение true/false)');

  // Дополнительно: интерпретация BMI
  print('\n=== ИНТЕРПРЕТАЦИЯ BMI ===');
  if (bmi < 18.5) {
    print('Недостаточный вес');
  } else if (bmi < 25) {
    print('Нормальный вес');
  } else if (bmi < 30) {
    print('Избыточный вес');
  } else {
    print('Ожирение');
  }

  // Демонстрация явной типизации vs var
  print('\n=== ЯВНАЯ ТИПИЗАЦИЯ VS VAR ===');
  String explicitType = 'Явный тип';
  var inferredType = 'Неявный тип';

  print('explicitType: $explicitType (тип: ${explicitType.runtimeType})');
  print('inferredType: $inferredType (тип: ${inferredType.runtimeType})');
  print('Оба имеют тип String, но первый указан явно, второй - выведен автоматически');
}
