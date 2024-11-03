import '../../../../core/shared/shared.dart';

class BannerEntity extends Equatable {
  final String url;
  final String? link;

  const BannerEntity({
    required this.url,
    required this.link,
  });

  @override
  List<Object?> get props => [
        url,
        link,
      ];
}
