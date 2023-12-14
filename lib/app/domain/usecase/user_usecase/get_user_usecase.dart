import 'package:homy_desine/app/domain/entities/profile_entites.dart';
import 'package:homy_desine/app/domain/repository/base_user_rpository.dart';

class GetProfileUseCase {
  final BaseProfileRepository baseUsreRepository;

  GetProfileUseCase({required this.baseUsreRepository});

  // Methods
  Future<ProfileEntitie> excuse() async {
    return await baseUsreRepository.getUser();
  }
}
