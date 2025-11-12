// Задача 10: Работа с late переменными (Сложная) - РЕШЕНИЕ

void main() {
  // 1-2. Создаем late переменные БЕЗ инициализации
  late String userInput;
  late int calculatedValue;

  // 4. Попробуйте раскомментировать следующую строку (ДО присваивания значения):
  // print('До инициализации: $userInput'); // Что произойдет?
  // ОШИБКА! LateInitializationError: Local 'userInput' has not been initialized

  print('Инициализация данных...\n');

  // 5. Присваиваем значения late переменным
  userInput = "42";
  calculatedValue = int.parse(userInput) * 2;

  // 6. Теперь можем безопасно использовать переменные
  print('Пользовательский ввод: $userInput');
  print('Вычисленное значение: $calculatedValue');

  // 7-8. Создаем late final переменную
  late final String processedData;

  // Присваиваем значение
  processedData = "Обработано: $calculatedValue";

  // 9. Выводим результат
  print('Обработанные данные: $processedData');

  // 10. Попробуйте раскомментировать (попытка изменить late final):
  // processedData = "Новое значение"; // Что произойдет?
  // ОШИБКА! Can't assign to the final variable 'processedData'

  // Объяснение работы late
  print('\n=== ОБЪЯСНЕНИЕ LATE ===');
  print('late позволяет отложить инициализацию переменной');
  print('Переменная должна быть инициализирована ДО первого использования');
  print('Попытка использовать неинициализированную late переменную вызовет ошибку');

  // Дополнительный пример
  print('\n=== ДОПОЛНИТЕЛЬНЫЙ ПРИМЕР ===');

  late int delayedValue;

  // Моделируем ситуацию где значение зависит от условия
  bool condition = true;

  if (condition) {
    delayedValue = 100;
  } else {
    delayedValue = 200;
  }

  print('Отложенное значение: $delayedValue');

  // Пример с late final
  print('\n=== LATE FINAL ===');

  late final String configuration;

  // Значение вычисляется во время выполнения
  var isProduction = false;
  configuration = isProduction ? 'production' : 'development';

  print('Конфигурация: $configuration');

  // configuration = 'test'; // ОШИБКА! Нельзя изменить final

  // ОТВЕТ: В чем разница между late и final?
  print('\n💡 ОТВЕТ НА ВОПРОС:');
  print('late - позволяет отложить инициализацию переменной');
  print('      Переменную можно изменять после инициализации (если не final)');
  print('      Используется когда значение нельзя получить сразу при объявлении');
  print('');
  print('final - переменную можно установить только один раз');
  print('        Значение не может быть изменено после присваивания');
  print('        Используется для неизменяемых переменных');
  print('');
  print('late final - комбинация: отложенная инициализация + неизменяемость');
  print('             Инициализируется позже, но только один раз');

  // Демонстрация различий
  print('\n=== ДЕМОНСТРАЦИЯ РАЗЛИЧИЙ ===');

  late int lateVariable;
  lateVariable = 10;
  print('lateVariable: $lateVariable');
  lateVariable = 20; // Можно изменить
  print('lateVariable после изменения: $lateVariable');

  final int finalVariable = 30;
  print('finalVariable: $finalVariable');
  // finalVariable = 40; // ОШИБКА! Нельзя изменить

  late final int lateFinalVariable;
  lateFinalVariable = 50;
  print('lateFinalVariable: $lateFinalVariable');
  // lateFinalVariable = 60; // ОШИБКА! Нельзя изменить
}
