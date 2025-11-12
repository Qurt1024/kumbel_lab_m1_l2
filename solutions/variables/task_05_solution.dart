// Задача 5: Различия между var, final и const (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем var переменную counter (можно изменять)
  var counter = 0;

  // 2. Создаем final переменную startTime (устанавливается один раз)
  final startTime = DateTime.now().millisecondsSinceEpoch;
  // Или можно использовать просто число:
  // final startTime = 12345;

  // 3. Создаем const переменную maxAttempts (известна до запуска)
  const maxAttempts = 3;

  // 4. Увеличиваем counter три раза
  print('Начальное значение counter: $counter');

  counter = counter + 1; // Увеличиваем на 1
  print('После первого увеличения: $counter');

  counter = counter + 1; // Увеличиваем на 1
  print('После второго увеличения: $counter');

  counter = counter + 1; // Увеличиваем на 1
  print('После третьего увеличения: $counter');

  // 5. Выводим все три переменные
  print('\n--- Итоговые значения ---');
  print('Начальное время: $startTime');
  print('Максимум попыток: $maxAttempts');
  print('Текущий счетчик: $counter');

  // 6. Комментарии объясняющие типы переменных
  print('\n--- Объяснение ---');
  print('counter (var) - можно изменять, поэтому увеличивается');
  print('startTime (final) - устанавливается один раз при запуске, нельзя изменить');
  print('maxAttempts (const) - константа времени компиляции, известна до запуска');

  // ВОПРОС: Что произойдет, если попытаться изменить startTime или maxAttempts?
  print('\n--- Попытка изменения ---');

  // Попытка изменить final переменную:
  // startTime = 54321; // ОШИБКА КОМПИЛЯЦИИ!
  // Ошибка: Can't assign to the final variable 'startTime'

  // Попытка изменить const переменную:
  // maxAttempts = 5; // ОШИБКА КОМПИЛЯЦИИ!
  // Ошибка: Constant variables can't be assigned a value

  print('Попытка изменить final или const переменные вызовет ошибку компиляции!');
  print('Только var переменные можно изменять после создания.');
}
