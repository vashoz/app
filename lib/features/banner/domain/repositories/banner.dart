import '../../../../core/shared/shared.dart';
import '../../banner.dart';

abstract class BannerRepository {
  FutureOr<Either<Failure, List<BannerEntity>>> find();
  FutureOr<Either<Failure, List<BannerEntity>>> refresh();
}
