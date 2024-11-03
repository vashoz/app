import '../../../../core/shared/shared.dart';
import '../../banner.dart';

abstract class BannerRemoteDataSource {
  FutureOr<List<BannerModel>> find();
}
