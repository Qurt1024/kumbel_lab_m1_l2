# Подсказки к Задаче 10: Кэширование и мемоизация с Map

## Подсказка 1: Концепция кэширования
Кэш сохраняет результаты вычислений для повторного использования:
```dart
var cache = <int, int>{};

int expensiveCalculation(int n) {
  // Проверяем кэш
  if (cache.containsKey(n)) {
    print('Взято из кэша');
    return cache[n]!;
  }

  // Вычисляем
  var result = n * n;  // Например

  // Сохраняем в кэш
  cache[n] = result;
  print('Вычислено и добавлено в кэш');
  return result;
}
```

## Подсказка 2: Числа Фибоначчи с кэшированием
```dart
var fibCache = <int, int>{};

int fibonacci(int n) {
  // Базовые случаи
  if (n == 0) return 0;
  if (n == 1) return 1;

  // Проверяем кэш
  if (fibCache.containsKey(n)) {
    return fibCache[n]!;
  }

  // Вычисляем рекурсивно
  var result = fibonacci(n - 1) + fibonacci(n - 2);

  // Сохраняем в кэш
  fibCache[n] = result;
  return result;
}
```

## Подсказка 3: Факториал с кэшированием
```dart
var factorialCache = <int, int>{};

int factorial(int n) {
  if (n <= 1) return 1;

  if (factorialCache.containsKey(n)) {
    return factorialCache[n]!;
  }

  var result = n * factorial(n - 1);
  factorialCache[n] = result;
  return result;
}
```

## Подсказка 4: Составные ключи для кэша
Для функций с несколькими параметрами используйте строковые ключи:
```dart
var powerCache = <String, int>{};

int power(int base, int exp) {
  var key = '${base}_$exp';  // Составной ключ

  if (powerCache.containsKey(key)) {
    return powerCache[key]!;
  }

  var result = 1;
  for (var i = 0; i < exp; i++) {
    result *= base;
  }

  powerCache[key] = result;
  return result;
}
```

## Подсказка 5: Счетчики попаданий и промахов
```dart
int cacheHits = 0;      // Взято из кэша
int cacheMisses = 0;    // Вычислено заново

int fibonacci(int n) {
  if (n <= 1) return n;

  if (fibCache.containsKey(n)) {
    cacheHits++;
    print('fibonacci($n) = ${fibCache[n]} (взято из кэша)');
    return fibCache[n]!;
  }

  cacheMisses++;
  var result = fibonacci(n - 1) + fibonacci(n - 2);
  fibCache[n] = result;
  print('fibonacci($n) = $result (вычислено)');
  return result;
}
```

## Подсказка 6: Общая статистика
```dart
void printStatistics() {
  var totalOps = cacheHits + cacheMisses;
  var hitRate = (cacheHits / totalOps * 100).toStringAsFixed(1);
  var missRate = (cacheMisses / totalOps * 100).toStringAsFixed(1);

  print('\nОбщая статистика:');
  print('Всего операций: $totalOps');
  print('Кэш-попаданий: $cacheHits ($hitRate%)');
  print('Новых вычислений: $cacheMisses ($missRate%)');
  print('Размер кэша: ${fibCache.length} элементов');
}
```

## Пример работы с кэшем
```dart
var squareCache = <int, int>{};
int hits = 0;
int misses = 0;

int square(int n) {
  if (squareCache.containsKey(n)) {
    hits++;
    print('square($n) = ${squareCache[n]} (кэш)');
    return squareCache[n]!;
  }

  misses++;
  var result = n * n;
  squareCache[n] = result;
  print('square($n) = $result (вычислено)');
  return result;
}

void main() {
  square(5);   // Вычислено
  square(5);   // Из кэша
  square(10);  // Вычислено
  square(5);   // Из кэша
  square(10);  // Из кэша

  print('\nСтатистика:');
  print('Попаданий: $hits');
  print('Промахов: $misses');
  print('Эффективность: ${(hits / (hits + misses) * 100).toStringAsFixed(1)}%');
}
```

## Порядок действий
1. Создайте глобальные Map для кэшей разных функций
2. Создайте счетчики попаданий и промахов
3. Реализуйте fibonacci() с кэшированием
4. Реализуйте factorial() с кэшированием
5. Реализуйте power() с кэшированием и составным ключом
6. Выполните несколько вычислений, включая повторные
7. Выведите детальную статистику с процентами

## Частые ошибки
- Забыть базовые случаи для рекурсии (n=0, n=1 для Фибоначчи)
- Не обновить счетчики попаданий/промахов
- Использовать только один общий кэш для разных функций - лучше разделить
- Забыть восклицательный знак при возврате из кэша
- Не показать эффект кэширования - вызовите функции несколько раз с одинаковыми параметрами
- Делить на ноль при вычислении процентов - проверяйте totalOps > 0
