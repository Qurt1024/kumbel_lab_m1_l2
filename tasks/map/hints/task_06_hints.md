# Подсказки к Задаче 6: Вложенные Map

## Подсказка 1: Создание вложенного Map
Map может содержать другие Map как значения:
```dart
var students = <String, Map<String, dynamic>>{
  'STU001': {
    'name': 'Иван',
    'age': 20,
    'course': 2,
    'gpa': 4.5
  }
};
```

## Подсказка 2: Доступ к вложенным значениям
Используйте двойное обращение по ключам:
```dart
var studentInfo = students['STU001'];
var name = students['STU001']!['name'];
var age = students['STU001']!['age'];

// Или в два этапа:
var student = students['STU001']!;
print('Имя: ${student['name']}');
print('Возраст: ${student['age']}');
```

## Подсказка 3: Перебор вложенного Map
Перебирайте внешний Map, затем работайте с внутренними:
```dart
for (var id in students.keys) {
  var student = students[id]!;
  print('ID: $id');
  print('Имя: ${student['name']}');
  print('Возраст: ${student['age']} лет');
  print('---');
}
```

## Подсказка 4: Поиск по критерию во вложенных Map
Для поиска лучшего студента:
```dart
String? bestStudentName;
double maxGpa = 0;

for (var student in students.values) {
  if (student['gpa'] > maxGpa) {
    maxGpa = student['gpa'];
    bestStudentName = student['name'];
  }
}

print('Лучший студент: $bestStudentName (GPA: $maxGpa)');
```

## Подсказка 5: Фильтрация вложенных Map
Для поиска студентов на 2 курсе:
```dart
print('Студенты на 2 курсе:');
for (var student in students.values) {
  if (student['course'] == 2) {
    print(student['name']);
  }
}
```

## Подсказка 6: Вычисление среднего значения
Для среднего возраста:
```dart
int totalAge = 0;
for (var student in students.values) {
  totalAge += student['age'] as int;
}
double avgAge = totalAge / students.length;
```

## Пример работы с вложенными Map
```dart
var employees = <String, Map<String, dynamic>>{
  'EMP001': {
    'name': 'Анна',
    'department': 'IT',
    'salary': 80000
  },
  'EMP002': {
    'name': 'Борис',
    'department': 'HR',
    'salary': 60000
  }
};

// Вывод информации
for (var id in employees.keys) {
  var emp = employees[id]!;
  print('ID: $id');
  print('Имя: ${emp['name']}');
  print('Отдел: ${emp['department']}');
  print('Зарплата: ${emp['salary']}');
  print('---');
}

// Поиск сотрудников из IT
for (var emp in employees.values) {
  if (emp['department'] == 'IT') {
    print('IT сотрудник: ${emp['name']}');
  }
}
```

## Частые ошибки
- Забыть восклицательный знак при доступе: `students['STU001']['name']` - ОШИБКА
- Неправильный порядок обращения: сначала внешний ключ, потом внутренний
- Забыть тип `dynamic` для внутреннего Map с разными типами данных
- Не приводить типы при вычислениях: `as int`, `as double`

## Ответ на вопрос
Чтобы получить доступ к значению во вложенном Map:
```dart
// Способ 1: Двойное обращение
var name = students['STU001']!['name'];

// Способ 2: В два этапа (более читаемо)
var student = students['STU001']!;
var name = student['name'];
```
