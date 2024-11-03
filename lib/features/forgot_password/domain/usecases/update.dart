import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class UpdateForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  UpdateForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ForgotPasswordEntity forgotPassword,
  }) async {
    return await repository.update(
      forgotPassword: forgotPassword,
    );
  }
}
