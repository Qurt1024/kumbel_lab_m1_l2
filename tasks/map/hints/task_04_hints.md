# Подсказки к Задаче 4: Проверка наличия ключей и значений

## Подсказка 1: Метод containsKey()
Проверяет наличие ключа в Map:
```dart
bool hasApple = inventory.containsKey('яблоко');
print('Есть яблоко: $hasApple');  // true или false
```

## Подсказка 2: Метод containsValue()
Проверяет наличие значения в Map:
```dart
bool hasThree = inventory.containsValue(3);
print('Есть количество 3: $hasThree');  // true или false
```

## Подсказка 3: Свойства isEmpty и isNotEmpty
Проверяют, пустой ли Map:
```dart
print('Пустой: ${inventory.isEmpty}');        // false если есть элементы
print('Не пустой: ${inventory.isNotEmpty}');  // true если есть элементы
```

## Подсказка 4: Свойство length
Возвращает количество пар ключ-значение:
```dart
print('Всего позиций: ${inventory.length}');
```

## Подсказка 5: Порядок действий
1. Создайте Map с 4 предметами и количеством
2. Проверьте наличие двух ключей (один есть, другого нет)
3. Проверьте наличие двух значений (одно есть, другого нет)
4. Проверьте пустоту Map (isEmpty и isNotEmpty)
5. Выведите количество элементов
6. Все результаты выводите с пояснениями

## Пример всех проверок
```dart
var storage = {
  'ключ1': 10,
  'ключ2': 20,
  'ключ3': 30
};

// Проверка ключей
print('Есть ключ1: ${storage.containsKey('ключ1')}');      // true
print('Есть ключ4: ${storage.containsKey('ключ4')}');      // false

// Проверка значений
print('Есть значение 20: ${storage.containsValue(20)}');   // true
print('Есть значение 99: ${storage.containsValue(99)}');   // false

// Проверка пустоты
print('Пустой: ${storage.isEmpty}');                       // false
print('Не пустой: ${storage.isNotEmpty}');                 // true

// Размер
print('Элементов: ${storage.length}');                     // 3
```

## Частые ошибки
- Путать containsKey и containsValue: ключ != значение
- Забыть кавычки при проверке строковых ключей
- Не выводить результат проверки, просто вызвать метод
- Использовать hasKey вместо containsKey - такого метода нет!
