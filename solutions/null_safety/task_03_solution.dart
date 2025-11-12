// Задача 3: Оператор безопасного вызова (?.) (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем nullable String? переменную message со значением
  String? message = 'Привет, мир!';

  print('Сообщение: $message');

  // 2. Используем оператор ?. (null-aware operator) для получения длины
  // Оператор ?. безопасно вызывает метод или свойство
  // Если объект null, вся цепочка вызовов вернет null без ошибки
  // Если объект НЕ null, вызов выполняется как обычно
  int? length = message?.length;

  print('Длина: $length');

  // 3. Преобразуем в верхний регистр используя ?.toUpperCase()
  // Метод toUpperCase() будет вызван, так как message не null
  String? upperCase = message?.toUpperCase();

  print('Верхний регистр: $upperCase');

  print('');

  // 4. Присваиваем message значение null
  message = null;

  print('Сообщение: $message');

  // 5. Снова пытаемся получить длину и преобразовать
  // Теперь message равен null, поэтому оператор ?. вернет null
  // Ошибки не будет - это безопасная операция
  length = message?.length;

  print('Длина: $length');

  // 6. Используем комбинацию ?. и ?? для значений по умолчанию
  // ?. вернет null (так как message = null)
  // ?? заменит null на значение по умолчанию
  int lengthWithDefault = message?.length ?? 0;

  print('Длина (с значением по умолчанию): $lengthWithDefault');

  upperCase = message?.toUpperCase();
  print('Верхний регистр: $upperCase');

  String upperCaseWithDefault = message?.toUpperCase() ?? 'НЕТ СООБЩЕНИЯ';
  print('Верхний регистр (с значением по умолчанию): $upperCaseWithDefault');

  print('');
  print('Попытка вызвать метод без ?. на null:');

  // 7. Попытка вызвать .length без ?. на null (ОШИБКА!)
  // Если раскомментировать, получим ошибку во время выполнения
  // Нельзя вызывать методы или свойства на null без оператора ?.
  // print(message.length); // ОШИБКА! Нельзя вызывать методы на null
  print('// message.length // ОШИБКА! Нельзя вызывать методы на null');
}
