import 'package:equatable/equatable.dart';

class AllGategoriesEntitie extends Equatable {
  final List<String> name;

  const AllGategoriesEntitie({required this.name});

  @override
  List<Object?> get props => [name];
}
