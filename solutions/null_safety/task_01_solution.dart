// Задача 1: Знакомство с null (Легкая) - РЕШЕНИЕ

void main() {
  // 1. Создаем обычную String переменную name
  // String - это НЕ-nullable тип, такая переменная НЕ может содержать null
  String name = 'Иван';

  // 2. Создаем nullable String? переменную nickname
  // Знак вопроса (?) после типа делает переменную nullable
  // Это означает, что переменная может содержать либо строку, либо null
  String? nickname;

  // 3. Присваиваем nickname значение null
  // Для nullable переменных null является валидным значением
  nickname = null;

  print('Обычная переменная: $name');
  print('Nullable переменная: $nickname');

  // 4. Проверяем nickname на null используя оператор сравнения ==
  // Оператор == null возвращает true если переменная равна null
  print('nickname равен null: ${nickname == null}');

  print('');
  print('Присвоено значение nickname...');

  // 6. Присваиваем nickname значение 'Ваня'
  // Теперь nickname содержит строку, а не null
  nickname = 'Ваня';

  // 7. Снова проверяем на null
  // Теперь nickname не равен null, так как содержит строку 'Ваня'
  print('nickname равен null: ${nickname == null}');
  print('nickname: $nickname');

  print('');
  print('Попытка присвоить null обычной переменной:');

  // 8. Попытка присвоить null обычной переменной (ОШИБКА!)
  // Это вызовет ошибку компиляции, потому что String не может быть null
  // Только типы с ? (nullable) могут содержать null
  // name = null; // ОШИБКА! String не может быть null
  print('// name = null; // ОШИБКА! String не может быть null');
}
