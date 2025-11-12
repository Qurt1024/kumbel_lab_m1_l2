# Подсказки к Задаче 7: Работа с nullable коллекциями

## Подсказка 1: Типы nullable коллекций
Важно различать три варианта:
```dart
List<String>?   // Сам список может быть null
List<String?>   // Список не null, но элементы могут быть null
List<String?>?  // И список и элементы могут быть null
```

## Подсказка 2: Nullable список
Если весь список может быть null:
```dart
List<String>? list = null;
print(list?.length);  // null (безопасно)
print(list?.length ?? 0);  // 0 (с значением по умолчанию)
```

## Подсказка 3: Список с nullable элементами
Список существует, но элементы могут быть null:
```dart
List<String?> items = ['a', null, 'b', null, 'c'];
for (var item in items) {
  if (item != null) {
    print(item);  // Выведет только 'a', 'b', 'c'
  }
}
```

## Подсказка 4: Фильтрация null элементов
Можно отфильтровать null значения:
```dart
List<String?> list = ['a', null, 'b', null];
var notNull = list.where((e) => e != null);
print(notNull.length);  // 2
```

## Подсказка 5: Map с nullable значениями
Map может иметь nullable значения:
```dart
Map<String, int?> scores = {
  'Иван': 100,
  'Мария': null,
  'Петр': 85
};

for (var entry in scores.entries) {
  if (entry.value != null) {
    print('${entry.key}: ${entry.value}');
  } else {
    print('${entry.key}: нет оценки');
  }
}
```

## Подсказка 6: Вычисления с проверкой null
При вычислениях нужно пропускать null значения:
```dart
Map<String, int?> scores = {
  'Иван': 100,
  'Мария': null,
  'Петр': 80
};

int sum = 0;
int count = 0;

for (var score in scores.values) {
  if (score != null) {
    sum += score;
    count++;
  }
}

if (count > 0) {
  double average = sum / count;
  print('Средний балл: $average');
}
```

## Подсказка 7: Пример с поиском null
```dart
void main() {
  Map<String, int?> data = {
    'a': 10,
    'b': null,
    'c': 20,
    'd': null
  };

  // Подсчет не-null значений
  var withValues = data.entries.where((e) => e.value != null);
  print('С значениями: ${withValues.length}');

  // Список ключей с null
  var nullKeys = data.entries
      .where((e) => e.value == null)
      .map((e) => e.key)
      .toList();
  print('Ключи с null: $nullKeys');
}
```
