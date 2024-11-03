import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class DeleteForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  DeleteForgotPasswordUseCase({
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
