import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final NetworkInfo network;
  final ForgotPasswordRemoteDataSource remote;

  ForgotPasswordRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required ForgotPasswordEntity forgotPassword,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(forgotPassword: forgotPassword);

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

        return const Right(null);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, ForgotPasswordEntity>> find({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on ForgotPasswordNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> refresh() async {
    try {
      if (await network.online) {
        final result = await remote.refresh();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ForgotPasswordEntity>>> search({
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          query: query,
        );

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
    required ForgotPasswordEntity forgotPassword,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(forgotPassword: forgotPassword);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
