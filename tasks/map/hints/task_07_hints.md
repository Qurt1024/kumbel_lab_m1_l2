# Подсказки к Задаче 7: Методы Map - putIfAbsent, update, addAll

## Подсказка 1: Метод putIfAbsent
Добавляет значение только если ключа еще нет:
```dart
wordCount.putIfAbsent('hello', () => 0);
// Если 'hello' нет - добавит со значением 0
// Если 'hello' уже есть - ничего не делает
```

## Подсказка 2: Метод update
Обновляет существующее значение:
```dart
wordCount.update('hello', (value) => value + 1);
// Берет текущее значение, увеличивает на 1, сохраняет обратно
```

## Подсказка 3: Комбинация putIfAbsent и update
Для подсчета слов используйте логику:
```dart
if (wordCount.containsKey(word)) {
  // Слово уже есть - увеличиваем счетчик
  wordCount.update(word, (count) => count + 1);
  print('Слово повторяется: $word (${wordCount[word]})');
} else {
  // Слова нет - добавляем с 1
  wordCount.putIfAbsent(word, () => 1);
  print('Добавлено слово: $word (1)');
}
```

## Подсказка 4: Разбиение строки на слова
Чтобы разбить предложение на слова:
```dart
String sentence = "hello world hello dart world";
List<String> words = sentence.split(' ');
// words = ['hello', 'world', 'hello', 'dart', 'world']
```

## Подсказка 5: Метод addAll
Объединяет два Map:
```dart
var moreWords = {
  'hello': 1,
  'dart': 1,
  'flutter': 1
};

wordCount.addAll(moreWords);
// Если ключ уже есть - значения складываются
// Если ключа нет - добавляется новая пара
```

## Подсказка 6: Порядок действий
1. Создайте пустой Map для подсчета слов
2. Разбейте предложение на список слов
3. Переберите каждое слово:
   - Если слова нет - добавьте с putIfAbsent
   - Если слово есть - увеличьте счетчик с update
4. Выведите итоговую статистику
5. Создайте второй Map с дополнительными словами
6. Объедините с помощью addAll
7. Выведите финальную статистику

## Пример подсчета элементов
```dart
var letterCount = <String, int>{};
var text = "hello";

for (var i = 0; i < text.length; i++) {
  var letter = text[i];

  if (letterCount.containsKey(letter)) {
    letterCount.update(letter, (count) => count + 1);
    print('$letter повторяется (${letterCount[letter]})');
  } else {
    letterCount.putIfAbsent(letter, () => 1);
    print('Новая буква: $letter (1)');
  }
}

print('Результат: $letterCount');
// {h: 1, e: 1, l: 2, o: 1}
```

## Пример addAll с конфликтами
```dart
var map1 = {'a': 1, 'b': 2};
var map2 = {'b': 3, 'c': 4};

// ВАЖНО: addAll перезаписывает значения!
map1.addAll(map2);
print(map1);  // {a: 1, b: 3, c: 4}
// 'b' было 2, стало 3 (перезаписано из map2)
```

## Частые ошибки
- Забыть круглые скобки в putIfAbsent: `putIfAbsent(key, 0)` - ОШИБКА, нужна функция: `() => 0`
- Не возвращать значение в update: `(value) { value + 1 }` - ОШИБКА, нужно: `(value) => value + 1`
- Думать что addAll складывает значения - нет, он перезаписывает!
- Не обработать первое добавление слова отдельно от последующих
