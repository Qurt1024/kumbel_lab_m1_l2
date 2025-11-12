// Задача 9: Система управления правами доступа (Сложная) - РЕШЕНИЕ

void main() {
  // Система управления правами доступа
  print('Система управления правами доступа');
  print('');

  // 2. Определяем три роли с правами доступа
  // Роль admin - полный набор прав
  var adminRights = <String>{'read', 'write', 'delete', 'manage_users', 'view_logs'};

  // Роль editor - права на чтение, запись и просмотр логов
  var editorRights = <String>{'read', 'write', 'view_logs'};

  // Роль viewer - только права на чтение
  var viewerRights = <String>{'read'};

  print('Роли:');
  print('admin: $adminRights');
  print('editor: $editorRights');
  print('viewer: $viewerRights');
  print('');

  // 3. Создаем 5 пользователей с разными ролями
  // Используем Map для хранения пользователей и их прав
  var users = <String, Set<String>>{};

  // Создаем копии прав для каждого пользователя
  // Используем Set.from() чтобы создать независимые копии
  users['Иван'] = Set<String>.from(adminRights);
  users['Мария'] = Set<String>.from(editorRights);
  users['Петр'] = Set<String>.from(viewerRights);
  users['Анна'] = Set<String>.from(editorRights);
  users['Олег'] = Set<String>.from(viewerRights);

  print('Пользователи:');
  print('Иван (admin): ${users['Иван']}');
  print('Мария (editor): ${users['Мария']}');
  print('Петр (viewer): ${users['Петр']}');
  print('Анна (editor): ${users['Анна']}');
  print('Олег (viewer): ${users['Олег']}');
  print('');

  // 4. Проверки доступа - hasPermission
  // Проверяем, есть ли у пользователя конкретное право
  print('Проверки доступа:');

  // Иван может delete?
  var ivanCanDelete = users['Иван']!.contains('delete');
  print('Иван может delete: $ivanCanDelete');

  // Мария может delete?
  var mariaCanDelete = users['Мария']!.contains('delete');
  print('Мария может delete: $mariaCanDelete');

  // Петр может write?
  var petrCanWrite = users['Петр']!.contains('write');
  print('Петр может write: $petrCanWrite');
  print('');

  // 4. Выдача права - grantPermission
  // Добавляем право пользователю Петр
  print('Выдача прав:');
  users['Петр']!.add('write');
  print('Выдано право write пользователю Петр');
  print('Петр (viewer): ${users['Петр']}');
  print('');

  // 4. Найти пользователей с правом - getUsersWithPermission
  // Ищем всех пользователей, у которых есть право 'write'
  var usersWithWrite = <String>[];
  if (users['Иван']!.contains('write')) usersWithWrite.add('Иван');
  if (users['Мария']!.contains('write')) usersWithWrite.add('Мария');
  if (users['Петр']!.contains('write')) usersWithWrite.add('Петр');
  if (users['Анна']!.contains('write')) usersWithWrite.add('Анна');
  if (users['Олег']!.contains('write')) usersWithWrite.add('Олег');

  print('Пользователи с правом write: $usersWithWrite');
  print('');

  // 5. Находим общие права для всех пользователей
  // Начинаем с прав первого пользователя и находим пересечение с остальными
  var commonRights = Set<String>.from(users['Иван']!);
  commonRights = commonRights.intersection(users['Мария']!);
  commonRights = commonRights.intersection(users['Петр']!);
  commonRights = commonRights.intersection(users['Анна']!);
  commonRights = commonRights.intersection(users['Олег']!);

  print('Общие права для всех: $commonRights');

  // 6. Находим права, которые есть только у админов
  // Берем права админов и вычитаем права всех не-админов
  var adminOnlyRights = Set<String>.from(users['Иван']!);
  adminOnlyRights = adminOnlyRights.difference(users['Мария']!);
  adminOnlyRights = adminOnlyRights.difference(users['Петр']!);
  adminOnlyRights = adminOnlyRights.difference(users['Анна']!);
  adminOnlyRights = adminOnlyRights.difference(users['Олег']!);

  print('Права только админов: $adminOnlyRights');
}
