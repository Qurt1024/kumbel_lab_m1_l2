# Подсказки к Задаче 6: Присваивание с проверкой на null (??=)

## Подсказка 1: Оператор ??=
Оператор ??= присваивает значение ТОЛЬКО если переменная равна null:
```dart
variable ??= defaultValue;
```

## Подсказка 2: Как работает ??=
- Если переменная null, присваивается новое значение
- Если переменная УЖЕ имеет значение, ничего не происходит

```dart
String? name;
name ??= 'Гость';  // name станет 'Гость'
name ??= 'Иван';   // name останется 'Гость'
```

## Подсказка 3: Эквивалентный код
Оператор ??= это короткая запись:
```dart
// Длинная запись
if (value == null) {
  value = defaultValue;
}

// Короткая запись
value ??= defaultValue;
```

## Подсказка 4: Использование с Map
Оператор ??= часто используется для установки значений по умолчанию в Map:
```dart
Map<String, String?> settings = {};
settings['theme'] ??= 'light';    // Установит 'light'
settings['theme'] ??= 'dark';     // НЕ изменит, останется 'light'
```

## Подсказка 5: Функция для настроек
Можно создать функцию для установки значений по умолчанию:
```dart
void setDefaults(Map<String, String?> map) {
  map['key1'] ??= 'default1';
  map['key2'] ??= 'default2';
}
```

## Подсказка 6: Пример с настройками
```dart
void applyDefaults(Map<String, String?> config) {
  config['language'] ??= 'ru';
  config['theme'] ??= 'light';
  config['fontSize'] ??= '14';
}

void main() {
  // Пустой Map
  Map<String, String?> settings1 = {};
  print('До: $settings1');
  applyDefaults(settings1);
  print('После: $settings1');

  // Частично заполненный Map
  Map<String, String?> settings2 = {
    'language': 'en',
    'theme': null
  };
  print('До: $settings2');
  applyDefaults(settings2);
  print('После: $settings2');  // language останется 'en'
}
```
