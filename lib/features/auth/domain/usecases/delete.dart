import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class DeleteAuthUseCase {
  final AuthRepository repository;

  DeleteAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
