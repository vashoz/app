import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class RefreshProfileUseCase {
  final ProfileRepository repository;

  RefreshProfileUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProfileEntity>>> call() async {
    return await repository.refresh();
  }
}
