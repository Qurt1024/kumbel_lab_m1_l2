# Подсказки к Задаче 4: Проверка содержимого списка

## Описание
Dart предоставляет методы для проверки содержимого списков: наличие элементов, пустоты, поиск индексов.

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать список студентов | `var students = ['Иван', ...]` |
| 2 | Проверить наличие элемента | `students.contains('Мария')` |
| 3 | Найти индекс элемента | `students.indexOf('Петр')` |
| 4 | Проверить пустоту списка | `students.isEmpty` |
| 5 | Получить длину списка | `students.length` |

## Методы проверки содержимого

```dart
var students = ['Иван', 'Мария', 'Петр', 'Анна'];

// contains() - проверяет наличие элемента
print(students.contains('Мария'));  // true
print(students.contains('Олег'));   // false

// indexOf() - возвращает индекс элемента
print(students.indexOf('Петр'));    // 2
print(students.indexOf('Олег'));    // -1 (если не найден)

// isEmpty - проверяет, пустой ли список
print(students.isEmpty);   // false

// isNotEmpty - проверяет, не пустой ли список
print(students.isNotEmpty); // true

// length - количество элементов
print(students.length);     // 4
```

## Работа с indexOf()

```dart
var numbers = [10, 20, 30, 20, 40];

// Поиск элемента
var index = numbers.indexOf(20);
print('Индекс первого 20: $index');  // 1

// Поиск с определенной позиции
var index2 = numbers.indexOf(20, 2);
print('Индекс 20 после позиции 2: $index2');  // 3

// Если элемент не найден
var index3 = numbers.indexOf(100);
print('Индекс 100: $index3');  // -1

// Последнее вхождение
var lastIndex = numbers.lastIndexOf(20);
print('Последний индекс 20: $lastIndex');  // 3
```

## Проверки пустоты

```dart
var list1 = ['элемент'];
var list2 = <String>[];

// isEmpty - true если список пустой
print('list1 пустой: ${list1.isEmpty}');    // false
print('list2 пустой: ${list2.isEmpty}');    // true

// isNotEmpty - true если список не пустой
print('list1 не пустой: ${list1.isNotEmpty}');  // true
print('list2 не пустой: ${list2.isNotEmpty}');  // false

// Проверка перед операциями
if (list1.isNotEmpty) {
  print('Первый элемент: ${list1[0]}');
}
```

## Частые ошибки

1. **Не проверили результат indexOf()**
   ```dart
   var list = ['A', 'B', 'C'];
   var index = list.indexOf('D');
   print(list[index]);  // ОШИБКА! index = -1

   // Правильно
   var index = list.indexOf('D');
   if (index != -1) {
     print(list[index]);
   }
   ```

2. **Путаница между isEmpty и length**
   ```dart
   var list = ['элемент'];

   // Неправильно
   if (list.length == true) { }  // length - это число!

   // Правильно
   if (list.isEmpty) { }
   if (list.length == 0) { }
   if (list.length > 0) { }
   ```

3. **Доступ к пустому списку**
   ```dart
   var list = <String>[];
   print(list[0]);  // ОШИБКА! Список пустой

   // Правильно
   if (list.isNotEmpty) {
     print(list[0]);
   }
   ```

## Комбинирование проверок

```dart
var students = ['Иван', 'Мария', 'Петр'];

// Проверка и получение элемента
if (students.contains('Мария')) {
  var index = students.indexOf('Мария');
  print('Мария найдена на позиции: $index');
}

// Безопасный доступ
String? findStudent(List<String> list, String name) {
  if (list.contains(name)) {
    return name;
  }
  return null;
}

// Подсчет вхождений
int countOccurrences(List list, dynamic element) {
  int count = 0;
  for (var item in list) {
    if (item == element) count++;
  }
  return count;
}
```

## Дополнительные примеры

```dart
// Проверка наличия элементов
var fruits = ['яблоко', 'банан', 'апельсин'];

print('Есть яблоко: ${fruits.contains("яблоко")}');
print('Есть груша: ${fruits.contains("груша")}');

// Поиск позиций
var colors = ['красный', 'синий', 'зелёный', 'синий'];
print('Первый синий: ${colors.indexOf("синий")}');
print('Последний синий: ${colors.lastIndexOf("синий")}');

// Статистика списка
print('Всего цветов: ${colors.length}');
print('Список пустой: ${colors.isEmpty}');
print('Список не пустой: ${colors.isNotEmpty}');

// Пустой список
var emptyList = <String>[];
print('Пустой список пустой: ${emptyList.isEmpty}');
print('Длина пустого списка: ${emptyList.length}');
```

## Практические применения

```dart
// Проверка перед удалением
var tasks = ['Задача 1', 'Задача 2', 'Задача 3'];
var taskToRemove = 'Задача 2';

if (tasks.contains(taskToRemove)) {
  tasks.remove(taskToRemove);
  print('Задача удалена');
} else {
  print('Задача не найдена');
}

// Безопасное получение элемента
var numbers = [10, 20, 30];
var searchNumber = 20;

var index = numbers.indexOf(searchNumber);
if (index != -1) {
  print('Число $searchNumber найдено на позиции $index');
} else {
  print('Число $searchNumber не найдено');
}
```

## Полезная информация

- `contains(element)` - возвращает true/false
- `indexOf(element)` - возвращает индекс или -1 если не найден
- `lastIndexOf(element)` - находит последнее вхождение
- `isEmpty` - true если длина списка равна 0
- `isNotEmpty` - противоположность isEmpty
- Всегда проверяйте результат indexOf() перед использованием
