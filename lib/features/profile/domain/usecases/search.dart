import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class SearchProfileUseCase {
  final ProfileRepository repository;

  SearchProfileUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProfileEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
