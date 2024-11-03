import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class DeleteOnBoardUseCase {
  final OnBoardRepository repository;

  DeleteOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required int id,
  }) async {
    return await repository.delete(
      id: id,
    );
  }
}
