import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class CreateProfileUseCase {
  final ProfileRepository repository;

  CreateProfileUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ProfileEntity profile,
  }) async {
    return await repository.create(
      profile: profile,
    );
  }
}
