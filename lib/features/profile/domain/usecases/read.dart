import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ReadProfileUseCase {
  final ProfileRepository repository;

  ReadProfileUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProfileEntity>>> call() async {
    return await repository.read();
  }
}
