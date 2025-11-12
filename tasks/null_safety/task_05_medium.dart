// Задача 5: Проверка на null с if (Средняя)
//
// ОПИСАНИЕ:
// Самый безопасный способ работы с nullable значениями - проверка через if.
// После проверки if (value != null) компилятор понимает, что внутри блока
// значение гарантированно не null (type promotion).
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте nullable String? userInput
// 2. Создайте функцию processInput(String? input) которая:
//    - Проверяет, является ли input null
//    - Если null, выводит "Нет данных"
//    - Если не null, выводит длину и содержимое в верхнем регистре
// 3. Вызовите функцию с разными значениями:
//    - null
//    - 'hello'
//    - 'dart programming'
// 4. Создайте функцию calculateSquare(int? number) которая:
//    - Возвращает квадрат числа если оно не null
//    - Возвращает null если число null
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// Тест 1: processInput(null)
// Нет данных
//
// Тест 2: processInput('hello')
// Получен ввод: hello
// Длина: 5
// Верхний регистр: HELLO
//
// Тест 3: processInput('dart programming')
// Получен ввод: dart programming
// Длина: 16
// Верхний регистр: DART PROGRAMMING
//
// Вычисление квадратов:
// calculateSquare(null): null
// calculateSquare(5): 25
// calculateSquare(10): 100
//
void main() {
  // Напишите ваш код здесь

}

// Создайте функции здесь
