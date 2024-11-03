import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class UpdateAuthUseCase {
  final AuthRepository repository;

  UpdateAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required AuthEntity auth,
  }) async {
    return await repository.update(
      auth: auth,
    );
  }
}
