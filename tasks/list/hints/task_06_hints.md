# Подсказки к Задаче 6: Списки с разными типами данных

## Описание
Dart поддерживает списки с разными типами данных (List<dynamic>) и двумерные списки (список списков).

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать List<dynamic> | `var info = ['Иван', 20, 4.5, true]` |
| 2 | Определить тип каждого элемента | `info[0].runtimeType` |
| 3 | Создать двумерный список | `var grades = [[5, 4], [3, 4]]` |
| 4 | Получить элемент из подсписка | `grades[0][1]` |
| 5 | Вычислить средний балл | Сумма / количество |

## Списки с разными типами

```dart
// List<dynamic> может содержать любые типы
List<dynamic> studentInfo = [
  'Иван',      // String
  20,          // int
  4.5,         // double
  true         // bool
];

// Получение типа элемента
print(studentInfo[0].runtimeType);  // String
print(studentInfo[1].runtimeType);  // int
print(studentInfo[2].runtimeType);  // double
print(studentInfo[3].runtimeType);  // bool

// Доступ к элементам
String name = studentInfo[0];
int age = studentInfo[1];
double gpa = studentInfo[2];
bool isActive = studentInfo[3];
```

## Двумерные списки

```dart
// Список списков (матрица)
List<List<int>> grades = [
  [5, 4, 5, 4],  // Студент 1
  [3, 4, 4, 5],  // Студент 2
  [5, 5, 4, 5]   // Студент 3
];

// Доступ к элементам
print(grades[0]);      // [5, 4, 5, 4] - все оценки первого студента
print(grades[0][0]);   // 5 - первая оценка первого студента
print(grades[1][2]);   // 4 - третья оценка второго студента

// Количество студентов
print(grades.length);  // 3

// Количество оценок у первого студента
print(grades[0].length);  // 4
```

## Вычисление среднего балла

```dart
// Для одного студента
var studentGrades = [5, 4, 5, 4];
var sum = 0;
for (var grade in studentGrades) {
  sum += grade;
}
var average = sum / studentGrades.length;
print('Средний балл: $average');  // 4.5

// Для всех студентов
var allGrades = [
  [5, 4, 5, 4],
  [3, 4, 4, 5],
  [5, 5, 4, 5]
];

for (var i = 0; i < allGrades.length; i++) {
  var sum = 0;
  for (var grade in allGrades[i]) {
    sum += grade;
  }
  var avg = sum / allGrades[i].length;
  print('Студент ${i + 1}: средний балл = $avg');
}
```

## Поиск лучшего студента

```dart
var grades = [
  [5, 4, 5, 4],  // avg = 4.5
  [3, 4, 4, 5],  // avg = 4.0
  [5, 5, 4, 5]   // avg = 4.75
];

var bestStudent = 0;
var bestAverage = 0.0;

for (var i = 0; i < grades.length; i++) {
  var sum = 0;
  for (var grade in grades[i]) {
    sum += grade;
  }
  var avg = sum / grades[i].length;

  if (avg > bestAverage) {
    bestAverage = avg;
    bestStudent = i;
  }
}

print('Лучший студент: ${bestStudent + 1}');
print('Средний балл: $bestAverage');
```

## Частые ошибки

1. **Неправильный доступ к двумерному списку**
   ```dart
   var matrix = [[1, 2], [3, 4]];
   print(matrix[1, 0]);  // ОШИБКА! Неправильный синтаксис

   // Правильно
   print(matrix[1][0]);  // 3
   ```

2. **Попытка использовать методы без проверки типа**
   ```dart
   List<dynamic> data = ['текст', 42];
   print(data[0] + data[1]);  // ОШИБКА! Нельзя складывать String и int

   // Правильно - проверяйте типы
   if (data[0] is String && data[1] is int) {
     print('${data[0]}: ${data[1]}');
   }
   ```

3. **Забыли про разные уровни вложенности**
   ```dart
   var grades = [[5, 4], [3, 5]];
   var sum = 0;
   for (var grade in grades) {
     sum += grade;  // ОШИБКА! grade - это List, не число
   }

   // Правильно - нужен вложенный цикл
   for (var studentGrades in grades) {
     for (var grade in studentGrades) {
       sum += grade;
     }
   }
   ```

## Дополнительные примеры

```dart
// Информация о продукте
List<dynamic> product = [
  'Ноутбук',        // название
  'Dell XPS 13',    // модель
  1299.99,          // цена
  true,             // в наличии
  5                 // рейтинг
];

print('Название: ${product[0]} (${product[0].runtimeType})');
print('Модель: ${product[1]} (${product[1].runtimeType})');
print('Цена: ${product[2]} (${product[2].runtimeType})');
print('В наличии: ${product[3]} (${product[3].runtimeType})');
print('Рейтинг: ${product[4]} (${product[4].runtimeType})');

// Таблица данных (двумерный список)
var schedule = [
  ['Понедельник', 'Математика', 'Физика', 'История'],
  ['Вторник', 'Химия', 'Биология', 'Английский'],
  ['Среда', 'Математика', 'История', 'Физкультура']
];

print('\nРасписание:');
for (var day in schedule) {
  print('${day[0]}: ${day.sublist(1).join(", ")}');
}
```

## Работа с mixed данными

```dart
// Создание записи о студенте
List<dynamic> createStudent(String name, int age, double gpa) {
  return [name, age, gpa, true];
}

var student1 = createStudent('Иван', 20, 4.5);
var student2 = createStudent('Мария', 21, 4.8);

print('${student1[0]}, ${student1[1]} лет, средний балл: ${student1[2]}');
print('${student2[0]}, ${student2[1]} лет, средний балл: ${student2[2]}');
```

## Итерация по двумерному списку

```dart
var matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

// Обход всех элементов
for (var i = 0; i < matrix.length; i++) {
  for (var j = 0; j < matrix[i].length; j++) {
    print('matrix[$i][$j] = ${matrix[i][j]}');
  }
}

// С помощью for-in
for (var row in matrix) {
  for (var element in row) {
    print(element);
  }
}
```

## Полезная информация

- `List<dynamic>` может содержать элементы любых типов
- Двумерный список: `List<List<Type>>`
- Доступ к элементу: `list[row][column]`
- `runtimeType` показывает тип элемента
- Для вычислений нужны вложенные циклы
- Средний балл = сумма оценок / количество оценок
