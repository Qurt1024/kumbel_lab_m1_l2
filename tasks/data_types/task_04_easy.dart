// Задача 4: Логический тип bool (Легкая)
//
// ОПИСАНИЕ:
// bool (boolean) - тип данных, который может иметь только два значения: true или false.
// Используется для проверок условий, флагов состояния и логических операций.
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте bool переменную isSunny = true (солнечная погода)
// 2. Создайте bool переменную isWarm = true (тепло)
// 3. Создайте bool переменную isWeekend = false (выходной)
// 4. Создайте переменную canGoToBeach = isSunny && isWarm && isWeekend
//    (можно идти на пляж, если солнечно И тепло И выходной)
// 5. Создайте переменную shouldTakeUmbrella = !isSunny
//    (взять зонт, если НЕ солнечно)
// 6. Выведите все переменные и объясните результат
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Погода:
// ☀️ Солнечно: true
// 🌡️ Тепло: true
// 📅 Выходной: false
//
// Решения:
// 🏖️ Можно на пляж: false (потому что не выходной)
// ☂️ Взять зонт: false (потому что солнечно)

void main() {
  bool isSunny = true;
  bool isWarm = true;
  bool isWeekend = false;

  var canGoToBeach = isSunny && isWarm && isWeekend;
  var shouldTakeUmbrella = !isSunny;

  print('Sunny:$isSunny \nWarm:$isWarm \nIs it weekend:$isWeekend \n\nCan we go to the beach? $canGoToBeach \nShould we take umbrella? $shouldTakeUmbrella');


}
