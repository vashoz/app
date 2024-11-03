import '../../../../core/shared/shared.dart';
import '../../business_information.dart';

class BusinessInformationModel extends BusinessInformationEntity {
  const BusinessInformationModel({
    required super.description,
    required super.phone,
    required super.support,
    required super.email,
    required super.address,
    required super.logo,
    required super.facebook,
    required super.instagram,
    required super.linkedIn,
  });

  factory BusinessInformationModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return BusinessInformationModel(
        description: map['description'],
        phone: map['phone'],
        support: map['support'],
        email: map['email'],
        address: map['address'],
        logo: map['logo'],
        facebook: map['facebook'],
        instagram: map['instagram'],
        linkedIn: map['linkedIn'],
      );
    } catch (e, stackTrace) {
      throw BusinessInformationModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
