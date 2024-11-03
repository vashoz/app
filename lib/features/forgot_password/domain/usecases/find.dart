import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class FindForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  FindForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, ForgotPasswordEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
