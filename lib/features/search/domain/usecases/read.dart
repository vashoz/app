import '../../../../core/shared/shared.dart';
import '../../search.dart';

class ReadSearchUseCase {
  final SearchRepository repository;

  ReadSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<SearchEntity>>> call() async {
    return await repository.read();
  }
}
