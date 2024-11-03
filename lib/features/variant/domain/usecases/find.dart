import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class FindVariantUseCase {
  final VariantRepository repository;

  FindVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, VariantEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
