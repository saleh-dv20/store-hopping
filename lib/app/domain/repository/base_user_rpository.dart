import 'package:homy_desine/app/domain/entities/profile_entites.dart';

abstract class BaseProfileRepository {
  Future<ProfileEntitie> getUser();
}
