import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class FavoriteModel extends FavoriteEntity {
  // TODO: implement model properties
  const FavoriteModel({
    required super.guid,
  });

  factory FavoriteModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw FavoriteModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
