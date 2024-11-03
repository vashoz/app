import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class RefreshVariantUseCase {
  final VariantRepository repository;

  RefreshVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<VariantEntity>>> call() async {
    return await repository.refresh();
  }
}
