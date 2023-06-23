import 'package:surf_dart_courses_template/06_task/06_task.dart';

void main(){

  final List<Product> products = [
    Product(id: 1, category: 'хлеб', name: 'Бородинский', price: 500, count: 5),
    Product(id: 2, category: 'хлеб', name: 'Белый', price: 200, count: 15),
    Product(id: 3, category: 'молоко', name: 'Полосатый кот', price: 50, count: 53),
    Product(id: 4, category: 'молоко', name: 'Коровка', price: 50, count: 53),
    Product(id: 5, category: 'вода', name: 'Апельсин', price: 25, count: 100),
    Product(id: 6, category: 'вода', name: 'Бородинский', price: 500, count: 5),
  ];

  final priceLessThan200 = FilterByPrice();
  final filterByCategory = FilterByCategory();
  final filterByCount = FilterByCount();
  List<Product> filteredProductsByPrice = applyFilter(products, priceLessThan200);
  List<Product> filteredProductsByCount = applyFilter(products, filterByCount);
  List<Product> filteredProductsByCategory = applyFilter(products, filterByCategory);
  filteredProductsByPrice.forEach((product) {
    print("${product.id}  ${product.category} ${product.name}  ${product.price} рублей ${product.count} шт");
  });

}