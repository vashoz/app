import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class ReadDiscountUseCase {
  final DiscountRepository repository;

  ReadDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DiscountEntity>>> call() async {
    return await repository.read();
  }
}
