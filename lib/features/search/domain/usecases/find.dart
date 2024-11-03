import '../../../../core/shared/shared.dart';
import '../../search.dart';

class FindSearchUseCase {
  final SearchRepository repository;

  FindSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, SearchEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
