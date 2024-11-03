import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class CreateForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  CreateForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ForgotPasswordEntity forgotPassword,
  }) async {
    return await repository.create(
      forgotPassword: forgotPassword,
    );
  }
}
