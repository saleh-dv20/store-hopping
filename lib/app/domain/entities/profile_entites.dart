import 'package:equatable/equatable.dart';

class ProfileEntitie extends Equatable{

  final String name;
  final String email;
  final String phone;
  final String usId;

 const ProfileEntitie({required this.name, required this.email, required this.phone, required this.usId});

  @override
  List<Object?> get props => [
    name,email,phone,usId,
  ];

}