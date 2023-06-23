//  описание класса товара
class Product {
  final int id;
  final String category;
  final String name;
  final int price;
  final int count;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.count,
  });
}

abstract class Filter<T> {
  bool apply(T product);
}

List<Product> applyFilter(
  List<Product> products,
  Filter filter,
) {
  List<Product> filteredProduct = [];
  for (var product in products) {
    if (filter.apply(product)) {
      filteredProduct.add(product);
    }
  }
  return filteredProduct;
}

//реализация интерфейса Filter, которая фильтрует по категории
class FilterByCategory implements Filter<Product> {
  @override
  bool apply(Product product) => product.category.contains('хлеб');
}

//реализация интерфейса Filter, которая фильтрует по цене
class FilterByPrice implements Filter<Product> {
  @override
  bool apply(Product product) => product.price < 200;
}

//реализация интерфейса Filter, которая фильтрует по количеству товара в наличии
class FilterByCount implements Filter<Product> {
  @override
  bool apply(Product product) => product.count < 15;
}
