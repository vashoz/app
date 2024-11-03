import '../../../../core/shared/shared.dart';
import '../../orders.dart';

abstract class OrdersRemoteDataSource {
  FutureOr<OrdersModel> find({
    required String guid,
  });

  FutureOr<List<OrdersModel>> findAll({
    required String guid,
  });

  FutureOr<List<OrdersModel>> refresh();
}
