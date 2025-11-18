// Задача 1: Знакомство с null (Легкая)
//
// ОПИСАНИЕ:
// null - это специальное значение, означающее "отсутствие значения".
// В Dart переменная может содержать null только если явно указать это в типе
// добавив знак вопроса (?). Это называется nullable тип.
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте обычную String переменную name = 'Иван'
// 2. Создайте nullable String? переменную nickname которая может быть null
// 3. Присвойте nickname значение null
// 4. Попробуйте присвоить name значение null (закомментируйте - будет ошибка)
// 5. Проверьте nickname на null используя == null
// 6. Присвойте nickname значение 'Ваня'
// 7. Снова проверьте на null
// 8. Выведите обе переменные
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Обычная переменная: Иван
// Nullable переменная: null
// nickname равен null: true
//
// Присвоено значение nickname...
// nickname равен null: false
// nickname: Ваня
//
// Попытка присвоить null обычной переменной:
// // name = null; // ОШИБКА! String не может быть null
//
void main() {
   String name = 'Leila';
  String? nickname = null;
  print('Normal variable: $name');
  print('Nullable variavle: $nickname');
  print('Does nickname equals null? ${nickname == null}');


  // Попробуйте раскомментировать:
  // name = null; // Что произойдет?
}
