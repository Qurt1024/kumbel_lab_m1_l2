# Подсказки к Задаче 5: Операции с множествами - union, intersection, difference

## Подсказка 1: Математические операции с множествами
Set поддерживает классические операции теории множеств:
- **union** (объединение) - все элементы из обоих множеств
- **intersection** (пересечение) - только общие элементы
- **difference** (разность) - элементы из первого, которых нет во втором

## Подсказка 2: Операция union (объединение)
Объединяет два множества, создавая новое со всеми уникальными элементами:
```dart
var setA = {1, 2, 3};
var setB = {3, 4, 5};
var result = setA.union(setB);
print(result); // {1, 2, 3, 4, 5}
```

Математическая нотация: A ∪ B (A объединение B)

## Подсказка 3: Операция intersection (пересечение)
Находит элементы, которые есть в обоих множествах:
```dart
var setA = {1, 2, 3, 4, 5};
var setB = {4, 5, 6, 7, 8};
var result = setA.intersection(setB);
print(result); // {4, 5}
```

Математическая нотация: A ∩ B (A пересечение B)

## Подсказка 4: Операция difference (разность)
Находит элементы первого множества, которых нет во втором:
```dart
var setA = {1, 2, 3, 4, 5};
var setB = {4, 5, 6, 7, 8};
var result = setA.difference(setB);
print(result); // {1, 2, 3}
```

Математическая нотация: A - B (A минус B)

**ВАЖНО:** Порядок имеет значение!
```dart
setA.difference(setB) // элементы из A, которых нет в B
setB.difference(setA) // элементы из B, которых нет в A
```

## Подсказка 5: Визуализация операций
Представьте два круга (диаграмма Венна):
```
    A: {1, 2, 3, 4, 5}
    B: {4, 5, 6, 7, 8}

union (A ∪ B):        {1, 2, 3, 4, 5, 6, 7, 8}  - весь круг A + весь круг B
intersection (A ∩ B): {4, 5}                    - только пересечение кругов
difference (A - B):   {1, 2, 3}                 - только круг A без пересечения
difference (B - A):   {6, 7, 8}                 - только круг B без пересечения
```

## Частые ошибки

### Ошибка 1: Думать, что union добавляет дубликаты
```dart
var setA = {1, 2, 3};
var setB = {2, 3, 4};
var result = setA.union(setB);
// НЕ {1, 2, 3, 2, 3, 4}
// А {1, 2, 3, 4} - дубликаты удаляются
```

### Ошибка 2: Путать порядок в difference
```dart
var setA = {1, 2, 3};
var setB = {3, 4, 5};

setA.difference(setB); // {1, 2} - из A убрали элементы B
setB.difference(setA); // {4, 5} - из B убрали элементы A
// Результаты РАЗНЫЕ!
```

### Ошибка 3: Изменять исходные множества
```dart
var setA = {1, 2, 3};
var setB = {3, 4, 5};
var union = setA.union(setB);

// setA и setB НЕ изменились!
print(setA); // {1, 2, 3} - оригинал
print(setB); // {3, 4, 5} - оригинал
print(union); // {1, 2, 3, 4, 5} - новое множество
```

## Дополнительные примеры

### Пример 1: Анализ групп студентов
```dart
var groupMath = {'Иван', 'Мария', 'Петр', 'Анна'};
var groupPhysics = {'Мария', 'Анна', 'Олег', 'Катя'};

// Все студенты
var allStudents = groupMath.union(groupPhysics);
print('Всего студентов: ${allStudents.length}');

// Студенты на обоих курсах
var bothCourses = groupMath.intersection(groupPhysics);
print('На обоих курсах: $bothCourses');

// Только математика
var onlyMath = groupMath.difference(groupPhysics);
print('Только математика: $onlyMath');

// Только физика
var onlyPhysics = groupPhysics.difference(groupMath);
print('Только физика: $onlyPhysics');
```

### Пример 2: Анализ товаров в магазинах
```dart
var shop1 = {'хлеб', 'молоко', 'яйца', 'сыр'};
var shop2 = {'молоко', 'яйца', 'масло', 'йогурт'};

print('Товары в обоих магазинах: ${shop1.intersection(shop2)}');
print('Только в первом: ${shop1.difference(shop2)}');
print('Только во втором: ${shop2.difference(shop1)}');
print('Весь ассортимент: ${shop1.union(shop2)}');
```

### Пример 3: Работа с числовыми диапазонами
```dart
var range1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
var evenNumbers = {2, 4, 6, 8, 10, 12, 14};

// Четные числа из первого диапазона
var commonEven = range1.intersection(evenNumbers);
print('Четные в диапазоне: $commonEven');

// Нечетные числа из первого диапазона
var oddInRange = range1.difference(evenNumbers);
print('Нечетные в диапазоне: $oddInRange');
```

### Пример 4: Сложные комбинации
```dart
var a = {1, 2, 3, 4};
var b = {3, 4, 5, 6};
var c = {5, 6, 7, 8};

// Элементы хотя бы в двух множествах
var inAB = a.intersection(b);
var inBC = b.intersection(c);
var inAC = a.intersection(c);
var inAtLeastTwo = inAB.union(inBC).union(inAC);
print('Хотя бы в двух: $inAtLeastTwo');

// Элементы только в одном множестве
var allElements = a.union(b).union(c);
var inMultiple = inAtLeastTwo;
var inOnlyOne = allElements.difference(inMultiple);
print('Только в одном: $inOnlyOne');
```
