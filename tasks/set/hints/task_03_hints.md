# Подсказки к Задаче 3: Преобразование между List и Set

## Подсказка 1: Зачем преобразовывать List в Set?
Главная причина - удаление дубликатов:
```dart
var listWithDuplicates = [1, 2, 3, 2, 4, 1, 5];
var uniqueNumbers = listWithDuplicates.toSet();
print(uniqueNumbers); // {1, 2, 3, 4, 5} - только уникальные
```

## Подсказка 2: Метод toSet()
Преобразует список в множество одной командой:
```dart
var numbers = [1, 2, 3, 2, 4, 1, 5];
Set<int> uniqueNumbers = numbers.toSet();

// Или кратко
var uniqueNumbers = numbers.toSet();
```

## Подсказка 3: Метод toList()
Преобразует множество обратно в список:
```dart
var uniqueSet = {1, 2, 3, 4, 5};
List<int> numbersList = uniqueSet.toList();

// Или кратко
var numbersList = uniqueSet.toList();
```

## Подсказка 4: Альтернативный способ - Set.from()
Можно создать Set из List используя конструктор:
```dart
var numbers = [1, 2, 3, 2, 4];
var uniqueNumbers = Set.from(numbers);
// Результат такой же, как numbers.toSet()
```

## Подсказка 5: Подсчет удаленных дубликатов
Сравните размеры до и после:
```dart
var original = [1, 2, 3, 2, 4, 1, 5, 3];
var unique = original.toSet();

int originalCount = original.length;
int uniqueCount = unique.length;
int duplicatesRemoved = originalCount - uniqueCount;

print('Было: $originalCount');
print('Стало: $uniqueCount');
print('Удалено дубликатов: $duplicatesRemoved');
```

## Частые ошибки

### Ошибка 1: Забыть, что Set теряет порядок
```dart
var numbers = [3, 1, 4, 1, 5, 9, 2, 6];
var unique = numbers.toSet();
// unique может быть {1, 2, 3, 4, 5, 6, 9}
// Порядок не гарантирован!
```

### Ошибка 2: Думать, что toSet() изменяет исходный список
```dart
var numbers = [1, 2, 3, 2, 4];
var unique = numbers.toSet();

print(numbers); // [1, 2, 3, 2, 4] - не изменился
print(unique);  // {1, 2, 3, 4} - новый Set
```

### Ошибка 3: Путать List и Set синтаксис
```dart
// List - квадратные скобки, доступ по индексу
var list = [1, 2, 3];
print(list[0]); // 1

// Set - фигурные скобки, НЕТ доступа по индексу
var set = {1, 2, 3};
// print(set[0]); // ОШИБКА! У Set нет индексов
```

## Дополнительные примеры

### Пример 1: Очистка списка от дубликатов
```dart
var cities = ['Москва', 'Казань', 'Москва', 'Сочи', 'Казань', 'Москва'];
print('Исходный список: $cities');
print('Длина: ${cities.length}'); // 6

var uniqueCities = cities.toSet();
print('Уникальные города: $uniqueCities');
print('Длина: ${uniqueCities.length}'); // 3

// Преобразуем обратно в список
var cleanedList = uniqueCities.toList();
print('Очищенный список: $cleanedList');
```

### Пример 2: Работа со строками
```dart
var words = ['привет', 'мир', 'привет', 'dart', 'мир', 'flutter'];

var uniqueWords = words.toSet();
print('Слов всего: ${words.length}'); // 6
print('Уникальных: ${uniqueWords.length}'); // 4
print('Повторений: ${words.length - uniqueWords.length}'); // 2
```

### Пример 3: Цепочка преобразований
```dart
var numbers = [5, 2, 8, 2, 9, 5, 3, 8, 1];

// List -> Set (удалить дубликаты) -> List (для сортировки)
var result = numbers.toSet().toList();
result.sort(); // Сортируем список

print('Исходный: $numbers');
print('Уникальные отсортированные: $result');
```

### Пример 4: Подсчет статистики
```dart
var scores = [100, 95, 100, 87, 95, 100, 92, 87];

print('Всего оценок: ${scores.length}');
print('Уникальных оценок: ${scores.toSet().length}');
print('Повторяющихся: ${scores.length - scores.toSet().length}');
print('Список уникальных: ${scores.toSet()}');
```
