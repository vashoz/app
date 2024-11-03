import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class ReadAuthUseCase {
  final AuthRepository repository;

  ReadAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<AuthEntity>>> call() async {
    return await repository.read();
  }
}
