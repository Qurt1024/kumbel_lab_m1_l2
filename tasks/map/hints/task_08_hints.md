# Подсказки к Задаче 8: Преобразование Map

## Подсказка 1: Метод map() для Map
Map имеет метод map() для преобразования:
```dart
var newMap = oldMap.map((key, value) {
  return MapEntry(newKey, newValue);
});
```

## Подсказка 2: Преобразование значений
Чтобы преобразовать температуры в Фаренгейты:
```dart
var fahrenheit = temperatures.map((city, celsius) {
  var f = celsius * 9 / 5 + 32;
  return MapEntry(city, f);
});
```

## Подсказка 3: MapEntry
MapEntry создает новую пару ключ-значение:
```dart
// Сохраняем ключ, преобразуем значение
MapEntry(key, newValue)

// Преобразуем ключ, сохраняем значение
MapEntry(newKey, value)

// Меняем оба
MapEntry(newKey, newValue)
```

## Подсказка 4: Преобразование в строки
Для создания строковых описаний:
```dart
var descriptions = temperatures.map((city, temp) {
  return MapEntry(city, '$temp градусов Цельсия');
});
```

## Подсказка 5: Инверсия ключей и значений
Чтобы поменять ключи и значения местами:
```dart
var citiesByTemp = temperatures.map((city, temp) {
  return MapEntry(temp, city);
});
// Было: {'Москва': 20}
// Стало: {20: 'Москва'}
```

## Подсказка 6: Формула Цельсий -> Фаренгейт
```dart
double fahrenheit = celsius * 9 / 5 + 32;

// Примеры:
// 0°C = 32°F
// 20°C = 68°F
// 100°C = 212°F
```

## Пример преобразований
```dart
var prices = {
  'яблоко': 50,
  'банан': 30,
  'апельсин': 60
};

// Преобразование 1: Цены в долларах (курс 1:75)
var pricesUSD = prices.map((product, rubles) {
  var dollars = rubles / 75;
  return MapEntry(product, dollars);
});

// Преобразование 2: Цены как строки
var priceStrings = prices.map((product, price) {
  return MapEntry(product, '$price рублей');
});

// Преобразование 3: Инверсия
var productsByPrice = prices.map((product, price) {
  return MapEntry(price, product);
});

print('В долларах: $pricesUSD');
print('Строками: $priceStrings');
print('По цене: $productsByPrice');
```

## Порядок действий
1. Создайте Map с температурами городов в Цельсиях
2. Выведите исходные температуры
3. Преобразуйте в Фаренгейты используя map() и формулу
4. Выведите температуры в Фаренгейтах
5. Создайте Map с температурами в виде строк
6. Выведите строковые описания
7. Создайте инвертированный Map (температура -> город)
8. Выведите инвертированный Map

## Частые ошибки
- Забыть return в map(): `map((k, v) { MapEntry(k, v) }` - ОШИБКА
- Использовать стрелочную функцию неправильно: `=>` уже возвращает результат
- Не создать MapEntry: `map((k, v) => (k, v))` - ОШИБКА, нужно MapEntry
- Перепутать порядок в MapEntry: первый параметр - ключ, второй - значение
- Забыть что map() создает НОВЫЙ Map, не изменяет старый
