import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class DeleteVariantUseCase {
  final VariantRepository repository;

  DeleteVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
