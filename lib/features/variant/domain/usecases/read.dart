import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class ReadVariantUseCase {
  final VariantRepository repository;

  ReadVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<VariantEntity>>> call() async {
    return await repository.read();
  }
}
