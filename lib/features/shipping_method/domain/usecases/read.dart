import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class ReadShippingMethodUseCase {
  final ShippingMethodRepository repository;

  ReadShippingMethodUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ShippingMethodEntity>>> call() async {
    return await repository.read();
  }
}
