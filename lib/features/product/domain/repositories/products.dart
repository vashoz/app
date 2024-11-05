import '../../../../core/shared/shared.dart';
import '../../product.dart';

typedef ProductsEntityPaginatedResponse = ({
  List<ProductEntity> items,
  int total,
});

abstract class ProductsRepository {
  FutureOr<Either<Failure, ProductEntity>> find({
    required String slug,
  });

  FutureOr<Either<Failure, List<String>>> category({
    required String slug,
  });

  FutureOr<Either<Failure, List<String>>> newArrivals();

  FutureOr<Either<Failure, List<String>>> popular();
}
