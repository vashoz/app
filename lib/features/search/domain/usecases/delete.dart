import '../../../../core/shared/shared.dart';
import '../../search.dart';

class DeleteSearchUseCase {
  final SearchRepository repository;

  DeleteSearchUseCase({
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
