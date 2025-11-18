// Задача 4: Неизменяемые переменные с final (Легкая)
//
// ОПИСАНИЕ:
// Ключевое слово final используется для переменных, которые устанавливаются один раз
// и не могут быть изменены. В отличие от const, значение final может быть определено
// во время выполнения программы.
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте final переменную currentYear с текущим годом (2025)
// 2. Создайте final переменную birthYear с годом вашего рождения
// 3. Вычислите ваш возраст: currentYear - birthYear
// 4. Сохраните результат в переменную age
// 5. Выведите: "Год рождения: [birthYear]"
// 6. Выведите: "Текущий год: [currentYear]"
// 7. Выведите: "Возраст: [age]"
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Год рождения: 2005
// Текущий год: 2025
// Возраст: 20

void main() {
  final currentYear = 2025;
  final birthYear = 2007;
  var myAge = currentYear - birthYear;

  print('The current year is $currentYear,my year of birth is $birthYear,so it makes me $myAge years old');

}
