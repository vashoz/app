import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class CreateOnBoardUseCase {
  final OnBoardRepository repository;

  CreateOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required OnBoardEntity onBoard,
  }) async {
    return await repository.create(
      onBoard: onBoard,
    );
  }
}
