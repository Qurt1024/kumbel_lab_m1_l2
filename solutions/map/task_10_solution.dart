// Задача 10: Кэширование и мемоизация с Map (Сложная) - РЕШЕНИЕ

// Глобальные переменные для кэширования
// Они должны быть вне main(), чтобы функции могли к ним обращаться
Map<int, int> fibonacciCache = {};
Map<String, int> operationCache = {};

// Счетчики для статистики
int fibComputations = 0;
int fibCacheHits = 0;
int factComputations = 0;
int factCacheHits = 0;
int powerComputations = 0;
int powerCacheHits = 0;

// Функция для вычисления чисел Фибоначчи с кэшированием
int fibonacci(int n) {
  // Проверяем, есть ли результат в кэше
  if (fibonacciCache.containsKey(n)) {
    // Если есть - возвращаем кэшированное значение
    fibCacheHits++;
    return fibonacciCache[n]!;
  }

  // Если нет в кэше - вычисляем
  fibComputations++;

  // Базовые случаи для Фибоначчи
  if (n <= 1) {
    fibonacciCache[n] = n;
    return n;
  }

  // Для больших чисел вычисляем вручную (без рекурсии)
  // Используем уже вычисленные значения из кэша или вычисляем заново
  var result = 0;
  var a = 0;
  var b = 1;

  // Вычисляем последовательность до n-го числа
  for (var i = 2; i <= n; i++) {
    result = a + b;
    a = b;
    b = result;
  }

  // Сохраняем результат в кэш
  fibonacciCache[n] = result;
  return result;
}

// Функция для вычисления факториала с кэшированием
int factorial(int n) {
  var key = 'fact_$n';

  // Проверяем кэш
  if (operationCache.containsKey(key)) {
    factCacheHits++;
    return operationCache[key]!;
  }

  // Вычисляем факториал
  factComputations++;
  var result = 1;
  for (var i = 2; i <= n; i++) {
    result = result * i;
  }

  // Сохраняем в кэш
  operationCache[key] = result;
  return result;
}

// Функция для возведения в степень с кэшированием
int power(int base, int exp) {
  var key = 'pow_${base}_$exp';

  // Проверяем кэш
  if (operationCache.containsKey(key)) {
    powerCacheHits++;
    return operationCache[key]!;
  }

  // Вычисляем степень
  powerComputations++;
  var result = 1;
  for (var i = 0; i < exp; i++) {
    result = result * base;
  }

  // Сохраняем в кэш
  operationCache[key] = result;
  return result;
}

void main() {
  print('Вычисление чисел Фибоначчи:');

  // Вычисляем fibonacci(10) первый раз
  var fib10_1 = fibonacci(10);
  print('fibonacci(10) = $fib10_1 (вычислено, добавлено в кэш)');

  // Вычисляем fibonacci(10) второй раз - будет из кэша
  var fib10_2 = fibonacci(10);
  print('fibonacci(10) = $fib10_2 (взято из кэша)');

  // Вычисляем fibonacci(15) первый раз
  var fib15 = fibonacci(15);
  print('fibonacci(15) = $fib15 (вычислено, добавлено в кэш)');

  // Вычисляем fibonacci(10) третий раз - опять из кэша
  var fib10_3 = fibonacci(10);
  print('fibonacci(10) = $fib10_3 (взято из кэша)');
  print('');

  // Статистика кэша Фибоначчи
  print('Статистика кэша Фибоначчи:');
  print('Вычислений: $fibComputations');
  print('Попаданий в кэш: $fibCacheHits');
  print('Размер кэша: ${fibonacciCache.length} элемента');
  print('');

  // Вычисление факториалов
  print('Вычисление факториалов:');

  var fact5_1 = factorial(5);
  print('factorial(5) = $fact5_1 (вычислено)');

  var fact5_2 = factorial(5);
  print('factorial(5) = $fact5_2 (взято из кэша)');

  var fact6 = factorial(6);
  print('factorial(6) = $fact6 (вычислено)');
  print('');

  // Вычисление степеней
  print('Вычисление степеней:');

  var pow1 = power(2, 10);
  print('power(2, 10) = $pow1 (вычислено)');

  var pow2 = power(2, 10);
  print('power(2, 10) = $pow2 (взято из кэша)');
  print('');

  // Общая статистика
  var totalOperations = fibComputations + fibCacheHits +
                        factComputations + factCacheHits +
                        powerComputations + powerCacheHits;
  var totalCacheHits = fibCacheHits + factCacheHits + powerCacheHits;
  var totalComputations = fibComputations + factComputations + powerComputations;

  var hitPercentage = (totalCacheHits / totalOperations * 100).toStringAsFixed(1);
  var compPercentage = (totalComputations / totalOperations * 100).toStringAsFixed(1);

  print('Общая статистика:');
  print('Всего операций: $totalOperations');
  print('Кэш-попаданий: $totalCacheHits ($hitPercentage%)');
  print('Новых вычислений: $totalComputations ($compPercentage%)');
}
