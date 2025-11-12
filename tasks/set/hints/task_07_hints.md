# Подсказки к Задаче 7: Проверка подмножеств

## Подсказка 1: Метод containsAll()
Проверяет, содержит ли одно множество все элементы другого:
```dart
var allFruits = {'яблоко', 'банан', 'апельсин', 'груша'};
var basket = {'яблоко', 'банан'};

var hasAll = allFruits.containsAll(basket);
print(hasAll); // true - все фрукты из корзины есть в магазине
```

## Подсказка 2: Понятие подмножества
Множество B является подмножеством A, если все элементы B содержатся в A:
```dart
var A = {1, 2, 3, 4, 5};
var B = {2, 3, 4};

if (A.containsAll(B)) {
  print('B является подмножеством A');
}
```

Математическая нотация: B ⊆ A (B подмножество A)

## Подсказка 3: Поиск отсутствующих элементов
Используйте difference для нахождения элементов, которых нет в другом множестве:
```dart
var available = {'яблоко', 'банан', 'груша'};
var wanted = {'яблоко', 'киви', 'манго'};

var missing = wanted.difference(available);
print('Отсутствующие товары: $missing'); // {киви, манго}
```

## Подсказка 4: Комбинации множеств
Объединение и разность для сложного анализа:
```dart
var basket1 = {'яблоко', 'банан'};
var basket2 = {'апельсин', 'груша'};

// Все купленные фрукты
var allBought = basket1.union(basket2);

// Что купил первый, но не купил второй
var unique1 = basket1.difference(basket2);

// Что купил второй, но не купил первый
var unique2 = basket2.difference(basket1);
```

## Подсказка 5: Нахождение остатка
Что осталось в магазине после покупок:
```dart
var inStore = {'яблоко', 'банан', 'апельсин', 'груша', 'киви'};
var sold = {'яблоко', 'апельсин'};

var remaining = inStore.difference(sold);
print('Остались: $remaining'); // {банан, груша, киви}
```

## Частые ошибки

### Ошибка 1: Путать порядок в containsAll
```dart
var big = {1, 2, 3, 4, 5};
var small = {3, 4};

// ПРАВИЛЬНО
big.containsAll(small); // true - большое содержит маленькое

// НЕПРАВИЛЬНО
small.containsAll(big); // false - маленькое не содержит большое
```

### Ошибка 2: Думать, что containsAll изменяет множество
```dart
var setA = {1, 2, 3};
var setB = {2, 3, 4};

var result = setA.containsAll(setB); // false
// setA и setB НЕ изменились!
```

### Ошибка 3: Неправильно считать остаток при нескольких покупателях
```dart
var store = {'яблоко', 'банан', 'апельсин', 'груша'};
var buyer1 = {'яблоко'};
var buyer2 = {'банан'};

// НЕПРАВИЛЬНО
var remaining = store.difference(buyer1).difference(buyer2);
// Это работает, но сложно

// ПРАВИЛЬНО
var allSold = buyer1.union(buyer2);
var remaining = store.difference(allSold);
```

## Дополнительные примеры

### Пример 1: Система контроля доступа
```dart
var requiredPermissions = {'read', 'write'};
var userPermissions = {'read', 'write', 'delete'};

if (userPermissions.containsAll(requiredPermissions)) {
  print('Доступ разрешен - все необходимые права есть');
} else {
  var missing = requiredPermissions.difference(userPermissions);
  print('Недостающие права: $missing');
}
```

### Пример 2: Проверка ингредиентов для рецепта
```dart
var recipe = {'мука', 'яйца', 'молоко', 'сахар'};
var available = {'мука', 'яйца', 'соль', 'масло'};

if (available.containsAll(recipe)) {
  print('Можно готовить!');
} else {
  var needToBuy = recipe.difference(available);
  print('Нужно купить: $needToBuy'); // {молоко, сахар}
}
```

### Пример 3: Анализ покупок в магазине
```dart
var allProducts = {'хлеб', 'молоко', 'яйца', 'сыр', 'масло', 'мясо'};
var customer1 = {'хлеб', 'молоко'};
var customer2 = {'яйца', 'сыр', 'йогурт'}; // йогурта нет в магазине!

print('Проверка корзины 1:');
if (allProducts.containsAll(customer1)) {
  print('Все товары в наличии');
}

print('\nПроверка корзины 2:');
if (allProducts.containsAll(customer2)) {
  print('Все товары в наличии');
} else {
  var notAvailable = customer2.difference(allProducts);
  print('Нет в наличии: $notAvailable'); // {йогурт}
}

// Что купили оба покупателя
var soldToday = customer1.union(customer2);
print('\nПродано сегодня: $soldToday');

// Что осталось в магазине (не учитывая недоступные товары)
var actuallySold = soldToday.intersection(allProducts);
var remaining = allProducts.difference(actuallySold);
print('Остаток в магазине: $remaining');
```

### Пример 4: Анализ навыков для вакансии
```dart
var requiredSkills = {'Dart', 'Flutter', 'Git'};
var optionalSkills = {'Firebase', 'REST API', 'UI/UX'};

var candidate1Skills = {'Dart', 'Flutter', 'Git', 'Firebase'};
var candidate2Skills = {'Dart', 'Git', 'JavaScript'};

void checkCandidate(String name, Set<String> skills) {
  print('\nКандидат: $name');

  if (skills.containsAll(requiredSkills)) {
    print('✓ Все обязательные навыки есть');

    var bonus = skills.intersection(optionalSkills);
    if (bonus.isNotEmpty) {
      print('✓ Дополнительные навыки: $bonus');
    }
  } else {
    var missing = requiredSkills.difference(skills);
    print('✗ Недостающие навыки: $missing');
  }
}

checkCandidate('Иван', candidate1Skills);
checkCandidate('Мария', candidate2Skills);
```

### Пример 5: Сравнение наборов функций
```dart
var basicFeatures = {'login', 'logout', 'profile'};
var premiumFeatures = {'login', 'logout', 'profile', 'export', 'analytics'};

print('Premium содержит все Basic: ${premiumFeatures.containsAll(basicFeatures)}');

var extraFeatures = premiumFeatures.difference(basicFeatures);
print('Дополнительно в Premium: $extraFeatures');
```
