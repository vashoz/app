import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo network;
  final AuthLocalDataSource local;

  final AuthRemoteDataSource remote;

  AuthRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required AuthEntity auth,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(auth: auth);

        await local.add(auth: auth);

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
  FutureOr<Either<Failure, AuthEntity>> find({
    required String guid,
  }) async {
    try {
      final result = await local.find(
        guid: guid,
      );
      return Right(result);
    } on AuthNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );
        await local.add(auth: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<AuthEntity>>> read() async {
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
  FutureOr<Either<Failure, List<AuthEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<AuthEntity>>> search({
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
    required AuthEntity auth,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(auth: auth);

        await local.update(auth: auth);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
