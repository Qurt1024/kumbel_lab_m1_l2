# Подсказки к Задаче 2: Добавление и удаление элементов Set

## Подсказка 1: Создание пустого Set
Для работы с элементами сначала нужно правильно создать пустое множество:
```dart
// ВАЖНО: указать тип элементов!
var numbers = <int>{};
Set<String> names = {};

// ОШИБКА: создаст Map, а не Set
var wrong = {}; // это Map!
```

## Подсказка 2: Метод add()
Метод `add()` добавляет один элемент и возвращает `true` или `false`:
```dart
var numbers = <int>{};
bool added1 = numbers.add(10); // true - элемент добавлен
bool added2 = numbers.add(10); // false - дубликат, не добавлен

print(numbers); // {10}
```

## Подсказка 3: Метод addAll()
Метод `addAll()` добавляет несколько элементов из списка или множества:
```dart
var numbers = {1, 2, 3};

// Добавить несколько чисел
numbers.addAll([4, 5, 6]);
print(numbers); // {1, 2, 3, 4, 5, 6}

// Добавить из другого Set
var moreNumbers = {7, 8, 9};
numbers.addAll(moreNumbers);
```

## Подсказка 4: Метод remove()
Метод `remove()` удаляет элемент и возвращает `true` или `false`:
```dart
var colors = {'красный', 'синий', 'зеленый'};

bool removed1 = colors.remove('синий'); // true - удален
bool removed2 = colors.remove('желтый'); // false - не найден

print(colors); // {красный, зеленый}
```

## Подсказка 5: Отслеживание изменений
Выводите множество после каждой операции для наглядности:
```dart
var numbers = <int>{};
print('Начало: $numbers'); // {}

numbers.add(10);
print('После add(10): $numbers'); // {10}

numbers.add(10);
print('После повторного add(10): $numbers'); // {10} - не изменилось
```

## Частые ошибки

### Ошибка 1: Забыть указать тип для пустого Set
```dart
// НЕПРАВИЛЬНО
var numbers = {};  // это Map<dynamic, dynamic>
numbers.add(1);    // ОШИБКА!

// ПРАВИЛЬНО
var numbers = <int>{};
numbers.add(1); // OK
```

### Ошибка 2: Ожидать ошибку при добавлении дубликата
```dart
var numbers = {1, 2, 3};
numbers.add(1); // Не вызовет ошибку, просто проигнорирует
// Множество останется {1, 2, 3}
```

### Ошибка 3: Ожидать ошибку при удалении несуществующего элемента
```dart
var numbers = {1, 2, 3};
numbers.remove(100); // Не вызовет ошибку
// Просто вернет false
```

## Дополнительные примеры

### Пример 1: Постепенное заполнение
```dart
var fruits = <String>{};
var toAdd = ['яблоко', 'банан', 'яблоко', 'груша'];

for (var fruit in toAdd) {
  bool wasAdded = fruits.add(fruit);
  if (wasAdded) {
    print('Добавлен: $fruit');
  } else {
    print('Дубликат: $fruit');
  }
}
print('Итого: $fruits'); // {яблоко, банан, груша}
```

### Пример 2: Массовое добавление и удаление
```dart
var numbers = <int>{};
numbers.addAll([1, 2, 3, 4, 5]);
print('Добавлено: $numbers'); // {1, 2, 3, 4, 5}

numbers.addAll([4, 5, 6, 7]); // 4 и 5 - дубликаты
print('После addAll: $numbers'); // {1, 2, 3, 4, 5, 6, 7}

numbers.remove(3);
numbers.remove(5);
print('После удалений: $numbers'); // {1, 2, 4, 6, 7}
```

### Пример 3: Проверка результатов операций
```dart
var tags = <String>{};

if (tags.add('важное')) {
  print('Тег добавлен');
}

if (!tags.add('важное')) {
  print('Тег уже существует');
}

if (tags.remove('срочное')) {
  print('Тег удален');
} else {
  print('Тег не найден');
}
```
