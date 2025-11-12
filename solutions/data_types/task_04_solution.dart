// Задача 4: Логический тип bool (Легкая) - РЕШЕНИЕ

void main() {
  // 1-3. Создаем bool переменные для условий
  bool isSunny = true;    // Солнечная погода
  bool isWarm = true;     // Тепло
  bool isWeekend = false; // Выходной день

  // 4. Проверяем можно ли идти на пляж
  // Оператор && (логическое И) - true только если ВСЕ условия true
  // true && true && false = false
  bool canGoToBeach = isSunny && isWarm && isWeekend;

  // 5. Проверяем нужно ли взять зонт
  // Оператор ! (логическое НЕ) - инвертирует значение
  // !true = false, !false = true
  bool shouldTakeUmbrella = !isSunny;

  // 6. Выводим результаты с объяснениями
  print('Погода:');
  print('☀️ Солнечно: $isSunny');
  print('🌡️ Тепло: $isWarm');
  print('📅 Выходной: $isWeekend');
  print('');
  print('Решения:');
  print('🏖️ Можно на пляж: $canGoToBeach (потому что не выходной)');
  print('☂️ Взять зонт: $shouldTakeUmbrella (потому что солнечно)');

  // ЛОГИЧЕСКИЕ ОПЕРАТОРЫ:
  // && (И) - true если ОБА условия true
  //   true && true = true
  //   true && false = false
  //   false && false = false
  //
  // || (ИЛИ) - true если ХОТЯ БЫ ОДНО условие true
  //   true || false = true
  //   false || false = false
  //
  // ! (НЕ) - инвертирует значение
  //   !true = false
  //   !false = true

  // ПРИМЕРЫ:
  // bool hasUmbrella = true;
  // bool isRaining = false;
  // bool stayDry = hasUmbrella || !isRaining; // true (есть зонт ИЛИ не дождь)
}
