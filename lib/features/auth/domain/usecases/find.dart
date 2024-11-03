import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class FindAuthUseCase {
  final AuthRepository repository;

  FindAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, AuthEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
