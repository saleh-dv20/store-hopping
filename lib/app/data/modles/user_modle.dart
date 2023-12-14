import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homy_desine/app/domain/entities/profile_entites.dart';

class ProfileModle extends ProfileEntitie {
  const ProfileModle(
      {required super.name,
      required super.email,
      required super.phone,
      required super.usId});

  factory ProfileModle.fromSnapshote(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProfileModle(
      name: data!['name'],
      email: document.data()!['email'],
      phone: document.data()!['phone'],
      usId: document.data()!['user id'],
    );
  }
}
