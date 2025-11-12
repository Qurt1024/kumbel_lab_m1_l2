// Задача 6: Практическое применение Set - анализ текста (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем строку text с текстом
  var text = 'Dart это язык программирования. Dart используется для Flutter. Flutter это фреймворк для мобильной разработки.';

  print('Текст 1: $text');
  print('');

  // 2. Разбиваем текст на слова
  // .split(' ') разделяет строку по пробелам и возвращает список слов
  var words = text.split(' ');

  // 3. Преобразуем все слова в нижний регистр
  // Создаем новый список где каждое слово преобразовано в lowercase
  // Также удаляем точки с помощью .replaceAll()
  var wordsLowercase = words.map((word) => word.toLowerCase().replaceAll('.', '')).toList();

  // 4. Создаем Set уникальных слов
  // .toSet() автоматически удалит дубликаты
  var uniqueWords = wordsLowercase.toSet();

  // 5. Анализ текста
  print('Анализ текста 1:');
  print('Всего слов: ${words.length}');
  print('Уникальных слов: ${uniqueWords.length}');

  // Вычисляем количество повторяющихся слов
  var repeatedWords = words.length - uniqueWords.length;
  print('Повторяющихся слов: $repeatedWords');
  print('');

  print('Уникальные слова: $uniqueWords');
  print('');

  // 6. Создаем второй текст и находим общие слова
  var text2 = 'Flutter это фреймворк от Google. Flutter используется для создания приложений.';

  print('Текст 2: $text2');
  print('');

  // Обрабатываем второй текст так же как первый
  var words2 = text2.split(' ');
  var words2Lowercase = words2.map((word) => word.toLowerCase().replaceAll('.', '')).toList();
  var uniqueWords2 = words2Lowercase.toSet();

  // Находим общие слова используя intersection (пересечение)
  // .intersection() вернет только слова, которые есть в обоих текстах
  var commonWords = uniqueWords.intersection(uniqueWords2);

  print('Общие слова в обоих текстах: $commonWords');
  print('Количество общих слов: ${commonWords.length}');
}
