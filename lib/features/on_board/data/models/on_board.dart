import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class OnBoardModel extends OnBoardEntity {
  // TODO: implement model properties
  const OnBoardModel({
    required super.id,
  });

  factory OnBoardModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw OnBoardModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
