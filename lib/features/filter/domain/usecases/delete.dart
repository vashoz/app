import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class DeleteFilterUseCase {
  final FilterRepository repository;

  DeleteFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required int id,
  }) async {
    return await repository.delete(
      id: id,
    );
  }
}
