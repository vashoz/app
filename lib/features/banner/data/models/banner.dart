import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.url,
    required super.link,
  });

  factory BannerModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return BannerModel(
        url: map['url'] as String,
        link: map['link'] as String?,
      );
    } catch (e, stackTrace) {
      throw BannerModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
