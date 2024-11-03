import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class RefreshForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  RefreshForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> call() async {
    return await repository.refresh();
  }
}
