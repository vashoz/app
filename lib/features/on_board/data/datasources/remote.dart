import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

abstract class OnBoardRemoteDataSource {
  FutureOr<void> create({
    required OnBoardEntity onBoard,
  });

  FutureOr<void> delete({
    required int id,
  });

  FutureOr<OnBoardModel> find({
    required int id,
  });

  FutureOr<List<OnBoardModel>> read();

  FutureOr<List<OnBoardModel>> refresh();

  FutureOr<List<OnBoardModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required OnBoardEntity onBoard,
  });
}
