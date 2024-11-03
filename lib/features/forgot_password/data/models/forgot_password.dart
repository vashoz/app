import '../../../../core/shared/shared.dart';
import '../../forgot_password.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  // TODO: implement model properties
  const ForgotPasswordModel({
    required super.guid,
  });

  factory ForgotPasswordModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ForgotPasswordModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
