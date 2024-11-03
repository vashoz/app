import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class UpdateOnBoardUseCase {
  final OnBoardRepository repository;

  UpdateOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required OnBoardEntity onBoard,
  }) async {
    return await repository.update(
      onBoard: onBoard,
    );
  }
}
