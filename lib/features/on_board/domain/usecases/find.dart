import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class FindOnBoardUseCase {
  final OnBoardRepository repository;

  FindOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, OnBoardEntity>> call({
    required int id,
  }) async {
    return await repository.find(
      id: id,
    );
  }
}
