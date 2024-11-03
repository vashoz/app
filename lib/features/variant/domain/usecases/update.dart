import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class UpdateVariantUseCase {
  final VariantRepository repository;

  UpdateVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required VariantEntity variant,
  }) async {
    return await repository.update(
      variant: variant,
    );
  }
}
