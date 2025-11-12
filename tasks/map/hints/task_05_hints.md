# Подсказки к Задаче 5: Перебор элементов Map

## Подсказка 1: Получение ключей и значений
Map предоставляет коллекции ключей и значений:
```dart
var productNames = products.keys;      // Все ключи
var prices = products.values;          // Все значения

print('Товары: $productNames');
print('Цены: $prices');
```

## Подсказка 2: Доступ к элементам по ключу
Перебор через коллекцию ключей:
```dart
for (var key in products.keys) {
  print('$key: ${products[key]} руб.');
}
```

## Подсказка 3: Работа с коллекцией значений
Для вычислений используйте коллекцию .values:
```dart
var pricesList = products.values.toList();  // Преобразуем в список

// Максимум и минимум
var maxPrice = pricesList.reduce((a, b) => a > b ? a : b);
var minPrice = pricesList.reduce((a, b) => a < b ? a : b);

// Сумма
var total = pricesList.reduce((sum, price) => sum + price);

// Среднее
var average = total / products.length;
```

## Подсказка 4: Альтернативный способ суммирования
Более простой способ подсчета суммы:
```dart
double total = 0;
for (var price in products.values) {
  total += price;
}
```

## Подсказка 5: Порядок действий
1. Создайте Map с 5 товарами и ценами
2. Переберите все товары и выведите каждую пару
3. Получите и сохраните коллекцию ключей
4. Получите и сохраните коллекцию значений
5. Найдите максимальную цену в коллекции значений
6. Найдите минимальную цену в коллекции значений
7. Вычислите общую сумму всех цен
8. Вычислите среднюю цену

## Пример работы с коллекциями
```dart
var scores = {
  'Иван': 85.0,
  'Мария': 92.0,
  'Петр': 78.0
};

// Получаем коллекции
var names = scores.keys.toList();
var points = scores.values.toList();

print('Студенты: $names');
print('Баллы: $points');

// Находим максимум и минимум
var maxScore = points.reduce((a, b) => a > b ? a : b);
var minScore = points.reduce((a, b) => a < b ? a : b);

print('Максимум: $maxScore');
print('Минимум: $minScore');

// Вычисляем среднее
var sum = points.reduce((total, score) => total + score);
var avg = sum / scores.length;

print('Среднее: $avg');
```

## Частые ошибки
- Забыть преобразовать .values в список для reduce: используйте .toList()
- Путать reduce для максимума/минимума - в reduce нужна функция сравнения
- Не округлить среднее значение при выводе: используйте .toStringAsFixed(2)
- Попытаться изменить Map во время перебора - создавайте копии!

## Ответ на вопрос
Чтобы получить список всех ключей из Map, используйте свойство `.keys`:
```dart
var allKeys = products.keys;
// Или сразу в список:
var keysList = products.keys.toList();
```
