# Подсказки к Задаче 10: Работа с late переменными

## Подсказка 1: Что такое late

`late` позволяет отложить инициализацию переменной:
```dart
late String name;  // Объявляем, но НЕ инициализируем

// Позже...
name = 'Иван';    // Инициализируем

print(name);      // Теперь можно использовать
```

## Подсказка 2: Синтаксис late

```dart
late ТипПеременной имя;
```

Примеры:
```dart
late String userInput;
late int calculatedValue;
late double result;
```

## Подсказка 3: Правила использования late

✅ **Можно:**
```dart
late String text;
text = 'Привет';
print(text);  // Работает
```

❌ **Нельзя:**
```dart
late String text;
print(text);  // ОШИБКА! Переменная не инициализирована!
```

## Подсказка 4: Преобразование String в int

Используйте `int.parse()`:
```dart
String text = "42";
int number = int.parse(text);  // number = 42
```

## Подсказка 5: late final

`late final` - комбинация отложенной инициализации и неизменяемости:
```dart
late final String config;

// Позже...
config = 'production';  // ✅ Можно установить один раз

// config = 'development';  // ❌ ОШИБКА! Нельзя изменить
```

## Подсказка 6: Разница между late и final

| Тип | Отложенная инициализация | Можно изменять |
|-----|--------------------------|----------------|
| `var` | ❌ Нет | ✅ Да |
| `late` | ✅ Да | ✅ Да |
| `final` | ❌ Нет | ❌ Нет |
| `late final` | ✅ Да | ❌ Нет |

## Подсказка 7: Пример решения

```dart
void main() {
  // Объявляем без инициализации
  late String userInput;
  late int calculatedValue;

  // Инициализируем позже
  userInput = "42";
  calculatedValue = int.parse(userInput) * 2;

  // Теперь можем использовать
  print('Ввод: $userInput');
  print('Результат: $calculatedValue');

  // late final - один раз
  late final String result;
  result = "Обработано: $calculatedValue";
  print(result);
}
```

## Когда использовать late

- Когда значение зависит от других вычислений
- Когда значение придет позже (например, из сети)
- Когда нужно отложить инициализацию до определенного момента
