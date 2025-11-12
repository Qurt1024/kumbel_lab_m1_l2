// Задача 5: Проверка на null с if (Средняя) - РЕШЕНИЕ

void main() {
  // Тест 1: Вызываем функцию с null
  print('Тест 1: processInput(null)');
  processInput(null);

  print('');

  // Тест 2: Вызываем функцию со значением 'hello'
  print("Тест 2: processInput('hello')");
  processInput('hello');

  print('');

  // Тест 3: Вызываем функцию со значением 'dart programming'
  print("Тест 3: processInput('dart programming')");
  processInput('dart programming');

  print('');

  // Вычисление квадратов
  print('Вычисление квадратов:');

  // Тестируем calculateSquare с null
  // Функция вернет null, так как входное значение null
  int? result1 = calculateSquare(null);
  print('calculateSquare(null): $result1');

  // Тестируем calculateSquare с числом 5
  // Функция вернет 25 (5 × 5)
  int? result2 = calculateSquare(5);
  print('calculateSquare(5): $result2');

  // Тестируем calculateSquare с числом 10
  // Функция вернет 100 (10 × 10)
  int? result3 = calculateSquare(10);
  print('calculateSquare(10): $result3');
}

// Функция processInput обрабатывает входную строку
// Параметр input - nullable, может быть null
void processInput(String? input) {
  // Используем if для проверки на null
  // Проверка != null - это самый безопасный способ работы с nullable значениями
  if (input != null) {
    // После проверки if (input != null) компилятор понимает,
    // что внутри блока input ГАРАНТИРОВАННО не null
    // Это называется "type promotion" - автоматическое продвижение типа
    // Теперь input имеет тип String (не nullable) и можно использовать его свойства
    print('Получен ввод: $input');
    print('Длина: ${input.length}');
    print('Верхний регистр: ${input.toUpperCase()}');
  } else {
    // Если input равен null, выводим сообщение
    print('Нет данных');
  }
}

// Функция calculateSquare вычисляет квадрат числа
// Параметр number - nullable, может быть null
// Возвращаемый тип int? - тоже nullable, так как можем вернуть null
int? calculateSquare(int? number) {
  // Проверяем, не является ли число null
  if (number != null) {
    // Если число не null, вычисляем квадрат
    // После проверки number имеет тип int (не nullable)
    return number * number;
  } else {
    // Если число null, возвращаем null
    return null;
  }
}
