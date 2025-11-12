# Подсказки к Задаче 7: Типизированные переменные

## Подсказка 1: Явное указание типа

Вместо `var` можно явно указать тип:
```dart
String name = 'Иван';
int age = 20;
double height = 1.75;
bool isStudent = true;
```

## Подсказка 2: Основные типы данных

| Тип | Описание | Примеры |
|-----|----------|---------|
| `String` | Текст | `'Привет'`, `"Мир"` |
| `int` | Целое число | `42`, `-10`, `0` |
| `double` | Дробное число | `3.14`, `0.5`, `-2.7` |
| `bool` | Логическое значение | `true`, `false` |

## Подсказка 3: Формула индекса массы тела (BMI)

BMI = вес (кг) / (рост (м))²

```dart
double weight = 70.0;
double height = 1.75;
double bmi = weight / (height * height);
```

## Подсказка 4: Тернарный оператор для bool

Используется для выбора одного из двух значений:
```dart
bool isStudent = true;
String status = isStudent ? 'да' : 'нет';
// Если isStudent == true, то 'да', иначе 'нет'
```

## Подсказка 5: Форматирование дробных чисел

Чтобы вывести число с определенным количеством знаков после запятой:
```dart
double bmi = 22.86753;
print(bmi.toStringAsFixed(2));  // Выведет: 22.87
```

## Подсказка 6: Пример профиля

```dart
String firstName = 'Иван';
String lastName = 'Иванов';
int age = 20;
double height = 1.75;
double weight = 70.0;
bool isStudent = true;

double bmi = weight / (height * height);

print('=== ПРОФИЛЬ ===');
print('ФИО: $firstName $lastName');
print('Возраст: $age лет');
print('Студент: ${isStudent ? "да" : "нет"}');
print('BMI: ${bmi.toStringAsFixed(2)}');
```
