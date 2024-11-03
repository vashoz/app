import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class SearchOnBoardUseCase {
  final OnBoardRepository repository;

  SearchOnBoardUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<OnBoardEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
