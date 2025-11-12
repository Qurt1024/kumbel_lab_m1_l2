# Подсказки к Задаче 3: Работа со строками

## Краткое описание
String (строка) - это тип данных для работы с текстом. Строки можно объединять, получать их длину и использовать интерполяцию для создания динамического текста.

## Пошаговое решение

| Шаг | Действие | Что использовать |
|-----|----------|------------------|
| 1 | Создать переменную с именем | `String firstName = 'Иван';` |
| 2 | Создать переменную с фамилией | `String lastName = 'Иванов';` |
| 3 | Объединить имя и фамилию | `String fullName = firstName + ' ' + lastName;` |
| 4 | Создать переменную с приветствием | `String greeting = 'Привет';` |
| 5 | Создать полное приветствие | Объединить строки |
| 6 | Получить длину строки | `fullName.length` |
| 7 | Вывести все результаты | Использовать `print()` |

## Синтаксис и примеры

### Объединение строк (конкатенация)

```dart
// Способ 1: использование оператора +
String firstName = 'Анна';
String lastName = 'Петрова';
String fullName = firstName + ' ' + lastName;
print(fullName);  // Анна Петрова

// Способ 2: использование интерполяции
String fullName2 = '$firstName $lastName';
print(fullName2);  // Анна Петрова
```

### Интерполяция строк

```dart
String name = 'Мария';
int age = 25;

// Простая интерполяция
print('Привет, $name!');

// Интерполяция с выражением
print('Через год мне будет ${age + 1}');
```

### Длина строки

```dart
String text = 'Привет';
int length = text.length;
print(length);  // 6

String name = 'Иван Иванов';
print('В имени $length символов');  // В имени 12 символов
```

## Частые ошибки

1. **Забыть пробелы при объединении**
   ```dart
   String full = firstName + lastName;  // ИванИванов - слито!
   String full = firstName + ' ' + lastName;  // Иван Иванов - правильно
   ```

2. **Путаница между + и ,**
   ```dart
   print('Имя: ' + name);  // Правильно (конкатенация)
   print('Имя: ', name);   // Выведет два отдельных элемента
   ```

3. **Забыть $ при интерполяции**
   ```dart
   print('Привет, name!');  // Выведет: Привет, name!
   print('Привет, $name!');  // Выведет: Привет, Иван!
   ```

4. **Использовать length как функцию**
   ```dart
   int len = text.length();  // ОШИБКА! length - это свойство
   int len = text.length;     // Правильно
   ```

## Дополнительные примеры

### Пример 1: Создание email

```dart
String username = 'ivan';
String domain = 'gmail.com';
String email = username + '@' + domain;
print(email);  // ivan@gmail.com
```

### Пример 2: Форматированный вывод

```dart
String title = 'Менеджер';
String company = 'Яндекс';
String name = 'Алексей';

String info = '$name работает в $company на должности $title';
print(info);  // Алексей работает в Яндекс на должности Менеджер
```

### Пример 3: Работа с длиной

```dart
String password = 'abc123';
int minLength = 8;

if (password.length < minLength) {
  print('Пароль слишком короткий: ${password.length} символов');
  print('Минимум нужно: $minLength символов');
}
```

## Подсказка по выводу

Для красивого вывода информации:

```dart
print('Имя: $firstName');
print('Фамилия: $lastName');
print('Полное имя: $fullName');
print('Количество символов в имени: ${fullName.length}');
print('Приветствие: $completeGreeting');
```
