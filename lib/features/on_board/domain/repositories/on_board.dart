import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

typedef OnBoardEntityPaginatedResponse = ({
  List<OnBoardEntity> items,
  int total,
});

abstract class OnBoardRepository {
  FutureOr<Either<Failure, void>> create({
    required OnBoardEntity onBoard,
  });

  FutureOr<Either<Failure, void>> delete({
    required int id,
  });

  FutureOr<Either<Failure, OnBoardEntity>> find({
    required int id,
  });

  FutureOr<Either<Failure, List<OnBoardEntity>>> read();

  FutureOr<Either<Failure, List<OnBoardEntity>>> refresh();

  FutureOr<Either<Failure, List<OnBoardEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required OnBoardEntity onBoard,
  });
}
