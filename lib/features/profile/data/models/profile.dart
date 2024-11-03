import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ProfileModel extends ProfileEntity {
  // TODO: implement model properties
  const ProfileModel({
    required super.guid,
  });

  factory ProfileModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ProfileModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
