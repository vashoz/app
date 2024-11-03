import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class BannerRepositoryImpl extends BannerRepository {
  final NetworkInfo network;
  final BannerLocalDataSource local;
  final BannerRemoteDataSource remote;

  BannerRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, List<BannerEntity>>> find() async {
    try {
      final banners = await local.find();
      return Right(banners);
    } on BannerNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final banners = await remote.find();
        await local.add(banners: banners);
        return Right(banners);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<BannerEntity>>> refresh() async {
    try {
      await local.removeAll();
      if (await network.online) {
        final banners = await remote.find();
        await local.add(banners: banners);
        return Right(banners);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
