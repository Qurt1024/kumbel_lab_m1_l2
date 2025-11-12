# Подсказки к Задаче 6: Практическое применение Set - анализ текста

## Подсказка 1: Разбиение текста на слова
Метод `split()` разбивает строку на список слов:
```dart
var text = 'Dart это язык программирования';
var words = text.split(' ');
print(words); // ['Dart', 'это', 'язык', 'программирования']
```

## Подсказка 2: Приведение к нижнему регистру
Для правильного сравнения слов нужно привести их к одному регистру:
```dart
var word = 'Dart';
var lower = word.toLowerCase();
print(lower); // 'dart'

// Для всех слов в списке
var words = ['Dart', 'FLUTTER', 'Mobile'];
var lowerWords = words.map((w) => w.toLowerCase()).toList();
print(lowerWords); // ['dart', 'flutter', 'mobile']
```

## Подсказка 3: Создание Set из списка слов
После разбиения текста создайте Set для получения уникальных слов:
```dart
var text = 'Dart это язык программирования Dart';
var words = text.split(' ');
var lowerWords = words.map((w) => w.toLowerCase()).toList();
var uniqueWords = lowerWords.toSet();

print('Всего слов: ${words.length}'); // 5
print('Уникальных: ${uniqueWords.length}'); // 4
```

## Подсказка 4: Подсчет повторений
Разница между общим количеством и уникальными:
```dart
var totalWords = words.length;
var uniqueWords = words.toSet().length;
var repeatedWords = totalWords - uniqueWords;

print('Повторяющихся слов: $repeatedWords');
```

## Подсказка 5: Поиск общих слов между текстами
Используйте intersection для нахождения общих слов:
```dart
var text1 = 'Dart это язык программирования';
var text2 = 'Flutter это фреймворк';

var words1 = text1.toLowerCase().split(' ').toSet();
var words2 = text2.toLowerCase().split(' ').toSet();

var commonWords = words1.intersection(words2);
print('Общие слова: $commonWords'); // {это}
```

## Частые ошибки

### Ошибка 1: Забыть перевести в нижний регистр
```dart
var text = 'Dart это язык Dart';
var words = text.split(' ').toSet();
print(words); // {Dart, это, язык} - 'Dart' считается одним словом
              // Но это разные слова: 'Dart' с заглавной и 'dart'

// ПРАВИЛЬНО
var text = 'Dart это язык Dart';
var words = text.toLowerCase().split(' ').toSet();
print(words); // {dart, это, язык} - правильно
```

### Ошибка 2: Не учитывать знаки препинания
```dart
var text = 'Привет, мир! Привет мир.';
var words = text.split(' ');
// ['Привет,', 'мир!', 'Привет', 'мир.']
// 'мир!' и 'мир.' считаются разными словами

// Нужно удалить знаки препинания (для продвинутых)
```

### Ошибка 3: Неправильный порядок операций
```dart
// НЕПРАВИЛЬНО
var words = text.split(' ').toSet().map((w) => w.toLowerCase());
// toSet() до toLowerCase может не убрать все дубликаты

// ПРАВИЛЬНО
var words = text.toLowerCase().split(' ').toSet();
// Сначала приводим к нижнему регистру, потом создаем Set
```

## Дополнительные примеры

### Пример 1: Полный анализ текста
```dart
var text = 'Flutter это фреймворк. Flutter используется для мобильной разработки. Dart это язык для Flutter.';

// Подготовка
var lowerText = text.toLowerCase();
var words = lowerText.split(' ');
var uniqueWords = words.toSet();

// Статистика
print('Текст: $text');
print('');
print('Всего слов: ${words.length}');
print('Уникальных слов: ${uniqueWords.length}');
print('Повторений: ${words.length - uniqueWords.length}');
print('');
print('Уникальные слова:');
for (var word in uniqueWords) {
  print('  - $word');
}
```

### Пример 2: Сравнение двух текстов
```dart
var article1 = 'Python это язык программирования для науки и веб разработки';
var article2 = 'JavaScript это язык программирования для веб разработки';

var words1 = article1.toLowerCase().split(' ').toSet();
var words2 = article2.toLowerCase().split(' ').toSet();

var common = words1.intersection(words2);
var unique1 = words1.difference(words2);
var unique2 = words2.difference(words1);

print('Общие слова: $common');
print('Только в первом: $unique1');
print('Только во втором: $unique2');
```

### Пример 3: Поиск часто употребляемых слов
```dart
var text = 'Dart язык. Flutter фреймворк. Dart и Flutter связаны. Flutter использует Dart.';
var words = text.toLowerCase().split(' ');
var uniqueWords = words.toSet();

print('Частота слов:');
for (var uniqueWord in uniqueWords) {
  var count = words.where((w) => w == uniqueWord).length;
  if (count > 1) {
    print('$uniqueWord: $count раз(а)');
  }
}
```

### Пример 4: Цепочка обработки
```dart
var reviews = [
  'Отличный продукт. Очень доволен.',
  'Хороший продукт. Рекомендую.',
  'Плохой продукт. Не советую.'
];

// Собираем все уникальные слова из всех отзывов
var allWords = <String>{};
for (var review in reviews) {
  var words = review.toLowerCase().split(' ');
  allWords.addAll(words);
}

print('Всего уникальных слов во всех отзывах: ${allWords.length}');
print('Словарь: $allWords');
```
