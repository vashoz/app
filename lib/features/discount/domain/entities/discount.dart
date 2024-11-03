import '../../../../core/shared/shared.dart';

class DiscountEntity extends Equatable {
  final int amount;
  final String type;
  final String expireDate;

  const DiscountEntity({
    required this.amount,
    required this.type,
    required this.expireDate,
  });

  @override
  List<Object?> get props => [
        amount,
        type,
        expireDate,
      ];

  get toMap {
    return {
      'amount': amount,
      'type': type,
      'expire_date': expireDate,
    };
  }
}
