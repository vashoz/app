import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class ReadForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  ReadForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> call() async {
    return await repository.read();
  }
}
