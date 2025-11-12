# Подсказки к Задаче 9: Система управления правами доступа

## Подсказка 1: Структура данных Map<String, Set<String>>
Для хранения пользователей и их прав используйте Map, где ключ - имя пользователя, значение - Set прав:
```dart
Map<String, Set<String>> users = {
  'Иван': {'read', 'write', 'delete'},
  'Мария': {'read', 'write'},
  'Петр': {'read'}
};
```

## Подсказка 2: Определение ролей
Создайте константы для разных ролей:
```dart
var adminRights = {'read', 'write', 'delete', 'manage_users', 'view_logs'};
var editorRights = {'read', 'write', 'view_logs'};
var viewerRights = {'read'};
```

## Подсказка 3: Функция проверки прав
Функция должна проверить, есть ли у пользователя конкретное право:
```dart
bool hasPermission(Map<String, Set<String>> users, String userName, String permission) {
  // Проверяем, существует ли пользователь
  if (!users.containsKey(userName)) {
    return false;
  }

  // Проверяем, есть ли право у пользователя
  return users[userName]!.contains(permission);
}

// Использование
if (hasPermission(users, 'Иван', 'delete')) {
  print('Иван может удалять');
}
```

## Подсказка 4: Функция выдачи права
Функция должна добавить право пользователю:
```dart
void grantPermission(Map<String, Set<String>> users, String userName, String permission) {
  if (users.containsKey(userName)) {
    users[userName]!.add(permission);
    print('Выдано право $permission пользователю $userName');
  }
}
```

## Подсказка 5: Функция отзыва права
Функция должна удалить право у пользователя:
```dart
void revokePermission(Map<String, Set<String>> users, String userName, String permission) {
  if (users.containsKey(userName)) {
    users[userName]!.remove(permission);
    print('Отозвано право $permission у пользователя $userName');
  }
}
```

## Подсказка 6: Поиск пользователей с правом
Функция должна найти всех пользователей, у которых есть конкретное право:
```dart
List<String> getUsersWithPermission(Map<String, Set<String>> users, String permission) {
  var result = <String>[];

  for (var entry in users.entries) {
    if (entry.value.contains(permission)) {
      result.add(entry.key);
    }
  }

  return result;
}
```

## Подсказка 7: Общие права для всех
Используйте intersection для нахождения прав, которые есть у всех:
```dart
// Начинаем с прав первого пользователя
var commonRights = users.values.first.toSet();

// Находим пересечение со всеми остальными
for (var userRights in users.values) {
  commonRights = commonRights.intersection(userRights);
}

print('Общие права: $commonRights');
```

## Подсказка 8: Уникальные права админов
Найдите права, которые есть только у администраторов:
```dart
// Объединяем права всех не-админов
var nonAdminRights = editorRights.union(viewerRights);

// Находим разность
var adminOnlyRights = adminRights.difference(nonAdminRights);
print('Только у админов: $adminOnlyRights');
```

## Частые ошибки

### Ошибка 1: Забыть оператор ! при доступе к Map
```dart
// ОШИБКА
users[userName].contains(permission);  // Может быть null

// ПРАВИЛЬНО
users[userName]!.contains(permission); // С проверкой на null
// или
if (users.containsKey(userName)) {
  users[userName]!.contains(permission);
}
```

### Ошибка 2: Изменять оригинальные роли
```dart
var adminRights = {'read', 'write'};
users['Иван'] = adminRights;
users['Мария'] = adminRights; // Обе ссылаются на один Set!

// ПРАВИЛЬНО - создавать копии
users['Иван'] = {...adminRights}; // Spread оператор
users['Мария'] = Set.from(adminRights); // Set.from
```

### Ошибка 3: Не проверять существование пользователя
```dart
// ОШИБКА
users['Несуществующий']!.add('право'); // Выбросит исключение

// ПРАВИЛЬНО
if (users.containsKey('Несуществующий')) {
  users['Несуществующий']!.add('право');
}
```

## Дополнительные примеры

### Пример 1: Создание системы с ролями
```dart
void main() {
  // Определяем роли
  var admin = {'read', 'write', 'delete', 'manage_users', 'view_logs'};
  var editor = {'read', 'write', 'view_logs'};
  var viewer = {'read'};

  // Создаем пользователей с копиями прав
  Map<String, Set<String>> users = {
    'Иван': {...admin},    // Копия прав админа
    'Мария': {...editor},
    'Петр': {...viewer},
    'Анна': {...editor},
    'Олег': {...viewer}
  };

  // Выводим пользователей
  print('Пользователи системы:');
  for (var entry in users.entries) {
    print('${entry.key}: ${entry.value}');
  }
}
```

### Пример 2: Проверка доступа
```dart
void checkAccess(Map<String, Set<String>> users, String user, String action) {
  if (hasPermission(users, user, action)) {
    print('✓ $user может $action');
  } else {
    print('✗ $user НЕ может $action');
  }
}

checkAccess(users, 'Иван', 'delete');
checkAccess(users, 'Мария', 'delete');
checkAccess(users, 'Петр', 'write');
```

### Пример 3: Управление правами
```dart
print('Права Петра до: ${users['Петр']}');

// Выдаем право
grantPermission(users, 'Петр', 'write');
print('Права Петра после: ${users['Петр']}');

// Отзываем право
revokePermission(users, 'Петр', 'write');
print('Права Петра в конце: ${users['Петр']}');
```

### Пример 4: Анализ прав
```dart
// Кто может писать?
var canWrite = getUsersWithPermission(users, 'write');
print('Могут писать: $canWrite');

// Кто может удалять?
var canDelete = getUsersWithPermission(users, 'delete');
print('Могут удалять: $canDelete');

// Общие права для всех
var allRights = users.values.first.toSet();
for (var rights in users.values) {
  allRights = allRights.intersection(rights);
}
print('Общие права для всех: $allRights'); // {read}
```

### Пример 5: Полная система
```dart
void main() {
  // Роли
  var admin = {'read', 'write', 'delete', 'manage_users', 'view_logs'};
  var editor = {'read', 'write', 'view_logs'};
  var viewer = {'read'};

  // Пользователи
  Map<String, Set<String>> users = {
    'Иван': {...admin},
    'Мария': {...editor},
    'Петр': {...viewer}
  };

  print('=== СИСТЕМА УПРАВЛЕНИЯ ПРАВАМИ ===\n');

  // Проверки
  print('Проверки доступа:');
  checkAccess(users, 'Иван', 'delete');
  checkAccess(users, 'Мария', 'delete');

  print('\nВыдача права:');
  grantPermission(users, 'Петр', 'write');

  print('\nПоиск пользователей:');
  var writers = getUsersWithPermission(users, 'write');
  print('Пользователи с правом write: $writers');

  print('\nАнализ прав:');

  // Общие права
  var common = users.values.reduce((a, b) => a.intersection(b));
  print('Общие права для всех: $common');

  // Уникальные права админов
  var nonAdminRights = editor.union(viewer);
  var adminOnly = admin.difference(nonAdminRights);
  print('Права только админов: $adminOnly');
}
```
