import '../../../../core/shared/shared.dart';
import '../../products.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final NetworkInfo network;
  final ProductsLocalDataSource local;
  final ProductsRemoteDataSource remote;

  ProductsRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, ProductEntity>> find({
    required String slug,
  }) async {
    try {
      final result = await local.find(
        slug: slug,
      );
      return Right(result);
    } on ProductsNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          slug: slug,
        );
        await local.add(slug: slug, product: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> category({
    required String slug,
  }) async {
    try {
      final result = await local.findCategory(slug: slug);
      return Right(result);
    } on ProductsNotFoundInLocalCacheFailure {
      if (await network.online) {
        final result = await remote.category(
          slug: slug,
        );
        await local.addCategory(slug: slug, products: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> newArrivals() async {
    try {
      final result = await local.findNewArrivals();
      return Right(result);
    } on ProductsNotFoundInLocalCacheFailure {
      if (await network.online) {
        await local.removeAll();
        final result = await remote.newArrivals();
        await local.addNewArrivals(products: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> popular() async {
    try {
      final result = await local.findPopular();
      return Right(result);
    } on ProductsNotFoundInLocalCacheFailure {
      if (await network.online) {
        await local.removeAll();

        final result = await remote.popular();

        await local.addPopular(products: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
