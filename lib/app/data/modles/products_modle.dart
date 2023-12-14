import '../../domain/entities/products_entity.dart';

class ProductsyModle extends ProductsEntitie {
  const ProductsyModle({
    required super.id,
    required super.price,
    required super.title,
    required super.image,
    required super.description,
    required super.rate,
  });

  factory ProductsyModle.fromJson(Map<String, dynamic> json) {
    return ProductsyModle(
      id: json['id'],
      price: json['price'].toDouble(),
      title: json['title'],
      image: json['image'],
      description: json['description'],
      rate: json['rating']['rate'].toDouble(),
    );
  }
}
