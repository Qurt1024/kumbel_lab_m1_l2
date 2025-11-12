// Задача 10: Комплексная работа со списками (Сложная) - РЕШЕНИЕ

void main() {
  // 1. Создаем список List<Map<String, dynamic>> tasks с 7 задачами
  // Каждая задача - это Map (словарь) с полями id, title, completed, priority
  List<Map<String, dynamic>> tasks = [
    {'id': 1, 'title': 'Сделать домашнее задание', 'completed': false, 'priority': 2},
    {'id': 2, 'title': 'Подготовиться к экзамену', 'completed': false, 'priority': 1},
    {'id': 3, 'title': 'Купить продукты', 'completed': false, 'priority': 2},
    {'id': 4, 'title': 'Позвонить врачу', 'completed': false, 'priority': 1},
    {'id': 5, 'title': 'Посмотреть фильм', 'completed': true, 'priority': 3},
    {'id': 6, 'title': 'Убраться в комнате', 'completed': false, 'priority': 2},
    {'id': 7, 'title': 'Почитать новости', 'completed': true, 'priority': 3},
  ];

  // 2. Выводим все задачи в удобном формате
  print('========== СПИСОК ЗАДАЧ ==========');
  // Функция для отображения приоритета в виде восклицательных знаков
  // 1 - высокий (!!!), 2 - средний (!!), 3 - низкий (!)
  for (var task in tasks) {
    var priorityIcon = task['priority'] == 1 ? '!!!' : (task['priority'] == 2 ? '!!' : '!');
    var status = task['completed'] ? 'завершено' : 'не завершено';
    print('[${task['id']}] [$priorityIcon] ${task['title']} ($status)');
  }
  print('');

  // 3. Находим все незавершенные задачи
  // Используем where() для фильтрации задач с completed == false
  var incompleteTasks = tasks.where((task) => task['completed'] == false).toList();
  print('Незавершенные задачи (${incompleteTasks.length}):');
  for (var task in incompleteTasks) {
    print('- ${task['title']}');
  }
  print('');

  // 4. Находим все задачи с высоким приоритетом (priority == 1)
  var highPriorityTasks = tasks.where((task) => task['priority'] == 1).toList();
  print('Задачи с высоким приоритетом (${highPriorityTasks.length}):');
  for (var task in highPriorityTasks) {
    print('- ${task['title']}');
  }
  print('');

  // 5. Отмечаем задачу с id = 3 как завершенную
  // Находим задачу с id = 3 и изменяем поле completed на true
  var taskToComplete = tasks.firstWhere((task) => task['id'] == 3);
  taskToComplete['completed'] = true;
  print('Задача #3 отмечена как завершенная');
  print('');

  // 6. Удаляем все завершенные задачи с низким приоритетом
  // Используем removeWhere() для удаления элементов по условию
  // Условие: completed == true И priority == 3
  tasks.removeWhere((task) => task['completed'] == true && task['priority'] == 3);

  // 7. Сортируем задачи по приоритету (сначала высокий)
  // Метод sort() с функцией сравнения
  // Сначала идут задачи с приоритетом 1, потом 2, потом 3
  tasks.sort((a, b) => a['priority'].compareTo(b['priority']));

  // 8. Считаем статистику
  print('========== СТАТИСТИКА ==========');
  var totalTasks = tasks.length;
  print('Всего задач: $totalTasks');

  // Считаем количество завершенных задач
  var completedCount = tasks.where((task) => task['completed'] == true).length;
  print('Завершено: $completedCount');

  // Считаем количество незавершенных задач
  var incompleteCount = tasks.where((task) => task['completed'] == false).length;
  print('Не завершено: $incompleteCount');

  // 9. Находим процент выполнения задач
  // Процент = (завершенные / всего) * 100
  var completionPercent = (completedCount / totalTasks * 100);
  // Округляем до 2 знаков после запятой используя toStringAsFixed()
  print('Процент выполнения: ${completionPercent.toStringAsFixed(2)}%');
}
