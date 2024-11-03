import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

typedef ProductDetailsEntityPaginatedResponse = ({
  List<ProductDetailsEntity> items,
  int total,
});

abstract class ProductDetailsRepository {
  FutureOr<Either<Failure, void>> create({
    required ProductDetailsEntity productDetails,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, ProductDetailsEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> read();

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> refresh();

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required ProductDetailsEntity productDetails,
  });
}
