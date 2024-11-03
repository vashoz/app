import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FindFilterUseCase {
  final FilterRepository repository;

  FindFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, FilterEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
