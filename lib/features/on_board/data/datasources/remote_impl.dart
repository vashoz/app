import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class OnBoardRemoteDataSourceImpl extends OnBoardRemoteDataSource {
  final Client client;

  OnBoardRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required OnBoardEntity onBoard,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<OnBoardModel> find({
    required int id,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OnBoardModel>> read() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OnBoardModel>> refresh() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OnBoardModel>> search({
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required OnBoardEntity onBoard,
  }) async {
    throw UnimplementedError();
  }
}
