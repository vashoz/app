import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class RefreshShippingMethodUseCase {
  final ShippingMethodRepository repository;

  RefreshShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> call() async {
    return await repository.refresh();
  }
}
