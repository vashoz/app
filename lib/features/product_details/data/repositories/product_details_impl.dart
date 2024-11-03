import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final NetworkInfo network;
  final ProductDetailsLocalDataSource local;

  final ProductDetailsRemoteDataSource remote;

  ProductDetailsRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required ProductDetailsEntity productDetails,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(productDetails: productDetails);

        await local.add(productDetails: productDetails);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> delete({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        await remote.delete(
          guid: guid,
        );

        await local.remove(
          guid: guid,
        );

        return const Right(null);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, ProductDetailsEntity>> find({
    required String guid,
  }) async {
    try {
      final result = await local.find(
        guid: guid,
      );
      return Right(result);
    } on ProductDetailsNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );
        await local.add(productDetails: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ProductDetailsEntity>>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        await local.addAll(items: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ProductDetailsEntity>>> refresh() async {
    try {
      if (await network.online) {
        await local.removeAll();

        final result = await remote.refresh();

        await local.addAll(items: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ProductDetailsEntity>>> search({
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          query: query,
        );

        await local.addAll(items: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> update({
    required ProductDetailsEntity productDetails,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(productDetails: productDetails);

        await local.update(productDetails: productDetails);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
