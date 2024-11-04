import '../../../../core/shared/shared.dart';
import '../../business.dart';

class BusinessInformationRemoteDataSourceImpl
    extends BusinessInformationRemoteDataSource {
  final Client client;

  BusinessInformationRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<BusinessInformationModel> read() async {
    try {
      final payload =
          await rootBundle.loadString('assets/mock/business_informations.json');
      final response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final BusinessInformationModel result =
            BusinessInformationModel.parse(map: (json.decode(response.body)));
        return result;
      } else {
        throw RemoteFailure(
            message: response.reasonPhrase ?? "Api call failed");
      }
    } catch (e) {
      rethrow;
    }
  }
}
