# Подсказки к Задаче 9: Группировка данных с помощью Map

## Подсказка 1: Структура данных для группировки
Для группировки нужен Map где значения - списки:
```dart
var grouped = <String, List<Map<String, dynamic>>>{};
```

## Подсказка 2: Создание списка транзакций
Создайте список Map с транзакциями:
```dart
var transactions = [
  {'id': 1, 'category': 'еда', 'amount': 500, 'date': '2025-01-10'},
  {'id': 2, 'category': 'транспорт', 'amount': 200, 'date': '2025-01-10'},
  {'id': 3, 'category': 'еда', 'amount': 800, 'date': '2025-01-11'},
  // ... еще 7 транзакций
];
```

## Подсказка 3: Группировка транзакций
Переберите транзакции и распределите по категориям:
```dart
var byCategory = <String, List<Map<String, dynamic>>>{};

for (var transaction in transactions) {
  var category = transaction['category'] as String;

  // Если категории нет - создаем пустой список
  byCategory.putIfAbsent(category, () => []);

  // Добавляем транзакцию в список категории
  byCategory[category]!.add(transaction);
}
```

## Подсказка 4: Вычисление статистики по категории
Для каждой категории вычисляйте показатели:
```dart
for (var category in byCategory.keys) {
  var categoryTransactions = byCategory[category]!;

  // Количество
  int count = categoryTransactions.length;

  // Общая сумма
  int total = 0;
  for (var t in categoryTransactions) {
    total += t['amount'] as int;
  }

  // Средняя сумма
  double average = total / count;

  print('Категория: $category');
  print('Транзакций: $count');
  print('Общая сумма: $total руб.');
  print('Средняя: ${average.toStringAsFixed(2)} руб.');
}
```

## Подсказка 5: Поиск категории с максимумом
Храните максимумы в переменных и обновляйте при переборе:
```dart
String? categoryWithMaxSpending;
int maxSpending = 0;

String? categoryWithMaxCount;
int maxCount = 0;

for (var category in byCategory.keys) {
  var transactions = byCategory[category]!;

  // Подсчет суммы
  int sum = 0;
  for (var t in transactions) {
    sum += t['amount'] as int;
  }

  // Проверка максимума суммы
  if (sum > maxSpending) {
    maxSpending = sum;
    categoryWithMaxSpending = category;
  }

  // Проверка максимума количества
  if (transactions.length > maxCount) {
    maxCount = transactions.length;
    categoryWithMaxCount = category;
  }
}
```

## Пример группировки данных
```dart
var students = [
  {'name': 'Иван', 'class': '10A', 'score': 85},
  {'name': 'Мария', 'class': '10B', 'score': 92},
  {'name': 'Петр', 'class': '10A', 'score': 78},
  {'name': 'Анна', 'class': '10B', 'score': 88},
];

// Группировка по классам
var byClass = <String, List<Map<String, dynamic>>>{};

for (var student in students) {
  var className = student['class'] as String;
  byClass.putIfAbsent(className, () => []);
  byClass[className]!.add(student);
}

// Вывод статистики по классам
for (var className in byClass.keys) {
  var classStudents = byClass[className]!;
  var totalScore = 0;

  for (var s in classStudents) {
    totalScore += s['score'] as int;
  }

  var avgScore = totalScore / classStudents.length;

  print('Класс $className:');
  print('  Учеников: ${classStudents.length}');
  print('  Средний балл: ${avgScore.toStringAsFixed(2)}');
}
```

## Порядок действий
1. Создайте список из 10 транзакций с разными категориями
2. Выведите все транзакции
3. Создайте пустой Map для группировки
4. Переберите транзакции и распределите по категориям
5. Для каждой категории вычислите статистику
6. Найдите категорию с наибольшими расходами
7. Найдите категорию с наибольшим количеством транзакций
8. Выведите детальный отчет

## Частые ошибки
- Забыть создать пустой список при первой транзакции категории
- Не привести типы: `as String`, `as int`
- Считать среднее как int вместо double
- Не обнулить счетчики при переборе категорий
- Забыть восклицательный знак: `byCategory[category].add()` - ОШИБКА
