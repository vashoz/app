import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class ReadFilterUseCase {
  final FilterRepository repository;

  ReadFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FilterEntity>>> call() async {
    return await repository.read();
  }
}
