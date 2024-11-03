import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class CreateAuthUseCase {
  final AuthRepository repository;

  CreateAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required AuthEntity auth,
  }) async {
    return await repository.create(
      auth: auth,
    );
  }
}
