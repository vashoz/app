import '../../../../core/shared/shared.dart';
import 'status.dart';

class TrackOrderEntity extends Equatable {
  final String orderId;
  final String orderDate;
  final int itemsCount;
  final double totalPrice;
  final List<OrderStatus> status;

  const TrackOrderEntity({
    required this.orderId,
    required this.orderDate,
    required this.itemsCount,
    required this.totalPrice,
    required this.status,
  });

  @override
  List<Object?> get props => [
        orderId,
        orderDate,
        itemsCount,
        totalPrice,
        status,
      ];
}
