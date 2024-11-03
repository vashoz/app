import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class RefreshAuthUseCase {
  final AuthRepository repository;

  RefreshAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<AuthEntity>>> call() async {
    return await repository.refresh();
  }
}
