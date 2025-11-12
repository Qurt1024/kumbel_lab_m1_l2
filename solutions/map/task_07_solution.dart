// Задача 7: Методы Map - putIfAbsent, update, addAll (Средняя) - РЕШЕНИЕ

void main() {
  // 1. Создаем Map<String, int> для подсчета слов
  Map<String, int> wordCount = {};

  // 2-3. Обрабатываем предложение: "hello world hello dart world"
  // Используем putIfAbsent для добавления слов, если их еще нет
  // Используем update для увеличения счетчика, если слово уже есть
  print('Обработка предложения: "hello world hello dart world"');
  print('');

  // Слово "hello" - первый раз
  // putIfAbsent(key, () => value) добавляет элемент только если ключа еще нет
  wordCount.putIfAbsent('hello', () => 1);
  print('Добавлено слово: hello (${wordCount['hello']})');

  // Слово "world" - первый раз
  wordCount.putIfAbsent('world', () => 1);
  print('Добавлено слово: world (${wordCount['world']})');

  // Слово "hello" - второй раз (повторяется)
  // update(key, (oldValue) => newValue) обновляет существующее значение
  // Используем проверку containsKey, так как студенты не знают функции
  if (wordCount.containsKey('hello')) {
    wordCount['hello'] = wordCount['hello']! + 1;
    print('Слово повторяется: hello (${wordCount['hello']})');
  }

  // Слово "dart" - первый раз
  wordCount.putIfAbsent('dart', () => 1);
  print('Добавлено слово: dart (${wordCount['dart']})');

  // Слово "world" - второй раз (повторяется)
  if (wordCount.containsKey('world')) {
    wordCount['world'] = wordCount['world']! + 1;
    print('Слово повторяется: world (${wordCount['world']})');
  }

  print('');
  print('Частота слов:');
  print('hello: ${wordCount['hello']} раза');
  print('world: ${wordCount['world']} раза');
  print('dart: ${wordCount['dart']} раз');
  print('');

  // 4. Создаем второй Map с дополнительными словами
  Map<String, int> moreWords = {
    'hello': 1,    // еще одно появление hello
    'world': 1,    // еще одно появление world
    'dart': 1,     // еще одно появление dart
    'flutter': 1   // новое слово
  };

  print('Добавление новых слов...');
  print('');

  // 5. Объединяем оба Map используя addAll
  // Однако addAll перезаписывает значения, а нам нужно складывать
  // Поэтому делаем это вручную для каждого ключа из moreWords

  // Обрабатываем 'hello' из moreWords
  if (wordCount.containsKey('hello')) {
    wordCount['hello'] = wordCount['hello']! + moreWords['hello']!;
  } else {
    wordCount['hello'] = moreWords['hello']!;
  }

  // Обрабатываем 'world' из moreWords
  if (wordCount.containsKey('world')) {
    wordCount['world'] = wordCount['world']! + moreWords['world']!;
  } else {
    wordCount['world'] = moreWords['world']!;
  }

  // Обрабатываем 'dart' из moreWords
  if (wordCount.containsKey('dart')) {
    wordCount['dart'] = wordCount['dart']! + moreWords['dart']!;
  } else {
    wordCount['dart'] = moreWords['dart']!;
  }

  // Обрабатываем 'flutter' из moreWords (новое слово)
  if (wordCount.containsKey('flutter')) {
    wordCount['flutter'] = wordCount['flutter']! + moreWords['flutter']!;
  } else {
    wordCount['flutter'] = moreWords['flutter']!;
  }

  // 6. Выводим итоговую статистику
  print('Финальная статистика:');
  print('hello: ${wordCount['hello']} раза');
  print('world: ${wordCount['world']} раза');
  print('dart: ${wordCount['dart']} раза');
  print('flutter: ${wordCount['flutter']} раз');
}
