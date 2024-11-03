import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class UpdateFilterUseCase {
  final FilterRepository repository;

  UpdateFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required FilterEntity filter,
  }) async {
    return await repository.update(
      filter: filter,
    );
  }
}
