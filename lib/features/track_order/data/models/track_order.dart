import '../../../../core/shared/shared.dart';
import '../../../orders/domain/entities/status.dart';
import '../../track_order.dart';

class TrackOrderModel extends TrackOrderEntity {
  const TrackOrderModel({
    required super.orderId,
    required super.orderDate,
    required super.itemsCount,
    required super.totalPrice,
    required super.status,
  });

  factory TrackOrderModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      var statusList = map['status'] as List;
      List<OrderStatus> statusItems =
          statusList.map((i) => OrderStatus.fromJson(i)).toList();
      return TrackOrderModel(
        orderId: map['order_id'] as String,
        orderDate: map['order_date'] as String,
        itemsCount: map['items_count'] as int,
        totalPrice: map['total_price'] as double,
        status: statusItems,
      );
    } catch (e, stackTrace) {
      throw TrackOrderModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
