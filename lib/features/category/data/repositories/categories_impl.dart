import '../../../../core/shared/shared.dart';
import '../../category.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final NetworkInfo network;
  final CategoriesLocalDataSource local;
  final CategoriesRemoteDataSource remote;

  CategoriesRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, CategoryEntity>> find({
    required String slug,
  }) async {
    try {
      final result = await local.find(
        slug: slug,
      );
      return Right(result);
    } on CategoriesNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(slug: slug);
        await local.add(slug: slug, category: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> featured() async {
    try {
      final result = await local.findFeatured();
      return Right(result);
    } on CategoriesNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.featured();

        await local.addAll(categories: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> all() async {
    try {
      final result = await local.findAll();
      return Right(result);
    } on CategoriesNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.all();

        await local.addAll(categories: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> refresh() async {
    try {
      if (await network.online) {
        await local.removeAll();

        final result = await remote.all();

        await local.addAll(categories: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<String>>> search({
    required String query,
  }) async {
    try {
      final result = await local.findSearch(query: query);

      return Right(result);
    } on CategoriesNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.search(query: query);

        await local.addAll(categories: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
