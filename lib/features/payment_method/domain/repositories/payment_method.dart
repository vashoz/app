import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

typedef PaymentMethodEntityPaginatedResponse = ({
  List<PaymentMethodEntity> items,
  int total,
});

abstract class PaymentMethodRepository {
  FutureOr<Either<Failure, void>> create({
    required PaymentMethodEntity paymentMethod,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, PaymentMethodEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> read();

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> refresh();

  FutureOr<Either<Failure, List<PaymentMethodEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required PaymentMethodEntity paymentMethod,
  });
}
