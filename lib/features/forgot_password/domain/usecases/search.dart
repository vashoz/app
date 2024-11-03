import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class SearchForgotPasswordUseCase {
  final ForgotPasswordRepository repository;

  SearchForgotPasswordUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
