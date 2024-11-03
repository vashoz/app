import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class AuthModel extends AuthEntity {
  // TODO: implement model properties
  const AuthModel({
    required super.guid,
  });

  factory AuthModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw AuthModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
