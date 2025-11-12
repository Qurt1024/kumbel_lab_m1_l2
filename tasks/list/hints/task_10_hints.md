# Подсказки к Задаче 10: Комплексная работа со списками (Todo List)

## Описание
Эта задача объединяет все методы работы со списками для создания системы управления задачами.

## Пошаговое решение

| Шаг | Что нужно сделать | Синтаксис |
|-----|-------------------|-----------|
| 1 | Создать список Map объектов | `List<Map<String, dynamic>>` |
| 2 | Фильтровать задачи | `tasks.where((task) => условие)` |
| 3 | Изменить задачу | Найти по id и изменить поле |
| 4 | Удалить задачи | `tasks.removeWhere(условие)` |
| 5 | Сортировать | `tasks.sort((a, b) => сравнение)` |
| 6 | Подсчитать статистику | Использовать length и where |

## Структура задачи (Map)

```dart
// Одна задача
var task = {
  'id': 1,
  'title': 'Сделать домашнее задание',
  'completed': false,
  'priority': 1  // 1-высокий, 2-средний, 3-низкий
};

// Доступ к полям
print(task['title']);      // Сделать домашнее задание
print(task['completed']);  // false
print(task['priority']);   // 1
```

## Создание списка задач

```dart
List<Map<String, dynamic>> tasks = [
  {
    'id': 1,
    'title': 'Сделать домашнее задание',
    'completed': false,
    'priority': 2
  },
  {
    'id': 2,
    'title': 'Подготовиться к экзамену',
    'completed': false,
    'priority': 1
  },
  {
    'id': 3,
    'title': 'Купить продукты',
    'completed': false,
    'priority': 3
  },
  // ... еще задачи
];
```

## Фильтрация задач

```dart
// Найти все незавершенные задачи
var incomplete = tasks.where((task) => !task['completed']).toList();
print('Незавершенные задачи: ${incomplete.length}');

// Найти задачи с высоким приоритетом
var highPriority = tasks.where((task) => task['priority'] == 1).toList();
print('Высокий приоритет: ${highPriority.length}');

// Найти завершенные задачи с низким приоритетом
var completedLowPriority = tasks.where((task) =>
  task['completed'] == true && task['priority'] == 3
).toList();
```

## Изменение задачи

```dart
// Найти задачу по id и изменить статус
void completeTask(List<Map<String, dynamic>> tasks, int id) {
  for (var task in tasks) {
    if (task['id'] == id) {
      task['completed'] = true;
      print('Задача #$id отмечена как завершенная');
      break;
    }
  }
}

// Использование
completeTask(tasks, 3);

// Альтернатива с firstWhere
var taskToComplete = tasks.firstWhere(
  (task) => task['id'] == 3,
  orElse: () => {}
);
if (taskToComplete.isNotEmpty) {
  taskToComplete['completed'] = true;
}
```

## Удаление задач

```dart
// Удалить все завершенные задачи с низким приоритетом
tasks.removeWhere((task) =>
  task['completed'] == true && task['priority'] == 3
);

// Удалить конкретную задачу по id
tasks.removeWhere((task) => task['id'] == 5);

// Удалить все завершенные задачи
tasks.removeWhere((task) => task['completed'] == true);
```

## Сортировка задач

```dart
// Сортировка по приоритету (сначала высокий)
tasks.sort((a, b) => a['priority'].compareTo(b['priority']));

// Сортировка по приоритету (сначала низкий)
tasks.sort((a, b) => b['priority'].compareTo(a['priority']));

// Сортировка по id
tasks.sort((a, b) => a['id'].compareTo(b['id']));

// Сложная сортировка: сначала по статусу, потом по приоритету
tasks.sort((a, b) {
  // Сначала незавершенные
  if (a['completed'] != b['completed']) {
    return a['completed'] ? 1 : -1;
  }
  // Потом по приоритету
  return a['priority'].compareTo(b['priority']);
});
```

## Форматированный вывод

```dart
// Красивый вывод задач
void printTasks(List<Map<String, dynamic>> tasks) {
  print('=' * 40);
  print('СПИСОК ЗАДАЧ');
  print('=' * 40);

  for (var task in tasks) {
    var id = task['id'];
    var title = task['title'];
    var completed = task['completed'];
    var priority = task['priority'];

    // Символ приоритета
    var prioritySymbol = priority == 1 ? '[!!!]' :
                        priority == 2 ? '[!!]' : '[!]';

    // Статус
    var status = completed ? 'завершено' : 'не завершено';

    print('[$id] $prioritySymbol $title ($status)');
  }
}
```

## Статистика

```dart
// Общее количество задач
var total = tasks.length;

// Завершенные задачи
var completed = tasks.where((task) => task['completed'] == true).length;

// Незавершенные задачи
var incomplete = tasks.where((task) => task['completed'] == false).length;

// Процент выполнения
var percentage = (completed / total * 100).toStringAsFixed(2);

print('Всего задач: $total');
print('Завершено: $completed');
print('Не завершено: $incomplete');
print('Процент выполнения: $percentage%');
```

## Частые ошибки

1. **Неправильный доступ к полям Map**
   ```dart
   var task = {'title': 'Задача'};
   print(task.title);  // ОШИБКА! Это не объект

   // Правильно
   print(task['title']);
   ```

2. **Изменение во время итерации**
   ```dart
   // Неправильно - изменяем список во время цикла
   for (var task in tasks) {
     tasks.remove(task);  // ОШИБКА!
   }

   // Правильно - используйте removeWhere
   tasks.removeWhere((task) => условие);
   ```

3. **Забыли проверить наличие элемента**
   ```dart
   var task = tasks.firstWhere((t) => t['id'] == 999);  // ОШИБКА если не найдено

   // Правильно
   var task = tasks.firstWhere(
     (t) => t['id'] == 999,
     orElse: () => {}
   );
   ```

4. **Неправильная сортировка**
   ```dart
   // Неправильно
   tasks.sort((a, b) => a['priority'] - b['priority']);  // Может не работать

   // Правильно
   tasks.sort((a, b) => a['priority'].compareTo(b['priority']));
   ```

## Дополнительные примеры

```dart
// Группировка по приоритету
void groupByPriority(List<Map<String, dynamic>> tasks) {
  var high = tasks.where((t) => t['priority'] == 1).toList();
  var medium = tasks.where((t) => t['priority'] == 2).toList();
  var low = tasks.where((t) => t['priority'] == 3).toList();

  print('Высокий приоритет (${high.length}):');
  high.forEach((t) => print('  - ${t['title']}'));

  print('Средний приоритет (${medium.length}):');
  medium.forEach((t) => print('  - ${t['title']}'));

  print('Низкий приоритет (${low.length}):');
  low.forEach((t) => print('  - ${t['title']}'));
}

// Поиск задачи по названию
Map<String, dynamic>? findTaskByTitle(
  List<Map<String, dynamic>> tasks,
  String title
) {
  try {
    return tasks.firstWhere(
      (task) => task['title'].toLowerCase().contains(title.toLowerCase())
    );
  } catch (e) {
    return null;
  }
}
```

## Полная структура программы

```dart
void main() {
  // 1. Создание списка задач
  List<Map<String, dynamic>> tasks = [
    // ... 7 задач
  ];

  // 2. Вывод всех задач
  printAllTasks(tasks);

  // 3. Фильтрация
  printIncompleteTasks(tasks);
  printHighPriorityTasks(tasks);

  // 4. Изменение задачи
  completeTask(tasks, 3);

  // 5. Удаление
  removeCompletedLowPriority(tasks);

  // 6. Сортировка
  tasks.sort((a, b) => a['priority'].compareTo(b['priority']));

  // 7. Статистика
  printStatistics(tasks);
}
```

## Вспомогательные функции

```dart
// Добавить новую задачу
void addTask(List<Map<String, dynamic>> tasks,
             String title, int priority) {
  var newId = tasks.isEmpty ? 1 : tasks.last['id'] + 1;
  tasks.add({
    'id': newId,
    'title': title,
    'completed': false,
    'priority': priority
  });
}

// Изменить приоритет
void changePriority(List<Map<String, dynamic>> tasks,
                    int id, int newPriority) {
  for (var task in tasks) {
    if (task['id'] == id) {
      task['priority'] = newPriority;
      break;
    }
  }
}

// Получить следующую задачу (высокий приоритет, не завершена)
Map<String, dynamic>? getNextTask(List<Map<String, dynamic>> tasks) {
  var incomplete = tasks.where((t) => !t['completed']).toList();
  if (incomplete.isEmpty) return null;

  incomplete.sort((a, b) => a['priority'].compareTo(b['priority']));
  return incomplete.first;
}
```

## Полезная информация

- Map используется для структурированных данных
- Доступ к полям через квадратные скобки: `map['key']`
- `where()` для фильтрации списка
- `removeWhere()` для удаления по условию
- `sort()` с `compareTo()` для сортировки
- Всегда проверяйте наличие элементов перед изменением
- Используйте функции для организации кода
- Процент = (часть / целое) * 100
