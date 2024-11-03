import '../../../../core/shared/shared.dart';
import '../../domain/entities/status.dart';
import '../../orders.dart';

class OrdersModel extends TrackOrderEntity {
  const OrdersModel({
    required super.orderId,
    required super.orderDate,
    required super.itemsCount,
    required super.totalPrice,
    required super.status,
  });
  factory OrdersModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      var statusList = map['status'] as List;
      List<OrderStatus> statusItems =
          statusList.map((i) => OrderStatus.fromJson(i)).toList();
      return OrdersModel(
        orderId: map['order_id'] as String,
        orderDate: map['order_date'] as String,
        itemsCount: map['items_count'] as int,
        totalPrice: map['total_price'] as double,
        status: statusItems,
      );
    } catch (e, stackTrace) {
      throw OrdersModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
