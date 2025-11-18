// Задача 2: Оператор проверки на null (??) (Легкая)
//
// ОПИСАНИЕ:
// Оператор ?? (null-coalescing) возвращает правое значение, если левое равно null.
// Это удобный способ задать значение по умолчанию для nullable переменных.
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте nullable String? userName который равен null
// 2. Создайте переменную displayName которая использует userName ?? 'Гость'
// 3. Выведите displayName (должно быть 'Гость')
// 4. Присвойте userName значение 'Иван'
// 5. Снова создайте displayName с тем же оператором ??
// 6. Выведите displayName (должно быть 'Иван')
// 7. Создайте nullable int? age = null
// 8. Выведите возраст с значением по умолчанию 18
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// userName: null
// Отображаемое имя: Гость
// (использовано значение по умолчанию)
//
// userName: Иван
// Отображаемое имя: Иван
// (использовано реальное значение)
//
// Возраст: null
// Отображаемый возраст: 18
// (использовано значение по умолчанию)
//
void main() {
  String? userName = null;
  var displayName = userName ?? 'Guest';
  print('displayName:$displayName');
  userName = 'Ivan';
  displayName = userName ?? 'Ivan';
  print('displayName:$displayName');

  int? age = null;
  var defaultAge = age ?? 18;
  print('defaultAge: $defaultAge');

}
