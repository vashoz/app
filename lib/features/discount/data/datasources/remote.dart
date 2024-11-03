import '../../../../core/shared/shared.dart';
import '../../discount.dart';

abstract class DiscountRemoteDataSource {
  FutureOr<void> create({
    required DiscountEntity discount,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<DiscountModel> find({
    required String guid,
  });

  FutureOr<List<DiscountModel>> read();

  FutureOr<List<DiscountModel>> refresh();

  FutureOr<List<DiscountModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required DiscountEntity discount,
  });
}
