import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class SearchAuthUseCase {
  final AuthRepository repository;

  SearchAuthUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<AuthEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
