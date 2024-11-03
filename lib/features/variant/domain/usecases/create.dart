import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class CreateVariantUseCase {
  final VariantRepository repository;

  CreateVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required VariantEntity variant,
  }) async {
    return await repository.create(
      variant: variant,
    );
  }
}
