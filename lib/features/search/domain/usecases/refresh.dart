import '../../../../core/shared/shared.dart';
import '../../search.dart';

class RefreshSearchUseCase {
  final SearchRepository repository;

  RefreshSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<SearchEntity>>> call() async {
    return await repository.refresh();
  }
}
