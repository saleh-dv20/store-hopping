import 'package:equatable/equatable.dart';

class ProductsEntitie extends Equatable {
  final int id;
  final double price;
  final double rate;
  final String title, image, description;

  const ProductsEntitie({
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.description,
    required this.rate,
  });

  @override
  List<Object?> get props => [id, price, title, image, description, rate];
}
