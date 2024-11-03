import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class SearchShippingMethodUseCase {
  final ShippingMethodRepository repository;

  SearchShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
