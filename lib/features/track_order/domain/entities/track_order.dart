import '../../../../core/shared/shared.dart';
import '../../../orders/domain/entities/status.dart';

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

  factory TrackOrderEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        orderDate,
        itemsCount,
        totalPrice,
        status,
        orderId,
      ];
}
