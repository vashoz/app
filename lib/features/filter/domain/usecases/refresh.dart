import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class RefreshFilterUseCase {
  final FilterRepository repository;

  RefreshFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FilterEntity>>> call() async {
    return await repository.refresh();
  }
}
