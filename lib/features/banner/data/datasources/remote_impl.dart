import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class BannerRemoteDataSourceImpl extends BannerRemoteDataSource {
  final Client client;

  BannerRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<List<BannerModel>> find() async {
    final payload = await rootBundle.loadString('assets/mock/banners.json');

    final response = Response(payload, HttpStatus.ok);

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> result =
          List<dynamic>.from(json.decode(response.body));
      return result.map((e) => BannerModel.parse(map: e)).toList();
    } else {
      throw RemoteFailure(message: response.body);
    }
  }
}
