// Задача 1: Основные типы данных (Легкая)
//
// ОПИСАНИЕ:
// В Dart существуют основные типы данных для хранения разной информации:
// - String: текст (строки)
// - int: целые числа
// - double: числа с дробной частью
// - bool: логические значения (true/false)
//
// ЧТО НУЖНО СДЕЛАТЬ:
// 1. Создайте String переменную с названием любимой книги
// 2. Создайте int переменную с количеством страниц в этой книге
// 3. Создайте double переменную с рейтингом книги (от 0.0 до 5.0)
// 4. Создайте bool переменную - прочитана ли книга
// 5. Выведите информацию о книге в красивом формате
//
// ЧТО МЫ ДОЛЖНЫ ПОЛУЧИТЬ:
// 📖 Информация о книге
// Название: Гарри Поттер
// Страниц: 350
// Рейтинг: 4.8 из 5
// Прочитано: да

void main() {
  String bookName = 'How to Talk to Your Cat About Gun Safety: And Abstinence, Drugs, Satanism, and Other Dangers That Threaten Their Nine Lives';
  int pageAmount = 144;
  double bookRating = 4.7;
  bool isItRead = true;
  

  print('Name:$bookName\n' + 'Page amount:$pageAmount\n' + 'Book rating:$bookRating\n'  + 'Read finished:$isItRead\n');

}
