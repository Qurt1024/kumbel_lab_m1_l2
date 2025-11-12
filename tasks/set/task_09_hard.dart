// Задача 9: Система управления правами доступа (Сложная)
//
// ОПИСАНИЕ:
// Используйте Set для создания системы управления правами доступа.
// Каждый пользователь имеет набор прав (Set<String>).
// Реализуйте проверки доступа и управление правами.
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте Map<String, Set<String>> где ключ - имя пользователя,
//    значение - множество прав доступа
// 2. Определите три роли с правами:
//    - admin: {'read', 'write', 'delete', 'manage_users', 'view_logs'}
//    - editor: {'read', 'write', 'view_logs'}
//    - viewer: {'read'}
// 3. Создайте 5 пользователей с разными ролями
// 4. Реализуйте функции:
//    - hasPermission(user, permission) - проверка наличия права
//    - grantPermission(user, permission) - выдать право
//    - revokePermission(user, permission) - отобрать право
//    - getUsersWithPermission(permission) - найти пользователей с правом
// 5. Найдите общие права для всех пользователей
// 6. Найдите права, которые есть только у админов
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Система управления правами доступа
//
// Роли:
// admin: {read, write, delete, manage_users, view_logs}
// editor: {read, write, view_logs}
// viewer: {read}
//
// Пользователи:
// Иван (admin): {read, write, delete, manage_users, view_logs}
// Мария (editor): {read, write, view_logs}
// Петр (viewer): {read}
// Анна (editor): {read, write, view_logs}
// Олег (viewer): {read}
//
// Проверки доступа:
// Иван может delete: true
// Мария может delete: false
// Петр может write: false
//
// Выдача прав:
// Выдано право write пользователю Петр
// Петр (viewer): {read, write}
//
// Пользователи с правом write: [Иван, Мария, Анна, Петр]
//
// Общие права для всех: {read}
// Права только админов: {delete, manage_users}

void main() {
  // Напишите ваш код здесь

}

// Создайте функции здесь
