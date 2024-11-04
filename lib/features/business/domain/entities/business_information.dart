import '../../../../core/shared/shared.dart';

class BusinessInformationEntity extends Equatable {
  final String description;
  final String phone;
  final String support;
  final String email;
  final String address;
  final String logo;
  final String facebook;
  final String instagram;
  final String linkedIn;

  const BusinessInformationEntity({
    required this.description,
    required this.phone,
    required this.support,
    required this.email,
    required this.address,
    required this.logo,
    required this.facebook,
    required this.instagram,
    required this.linkedIn,
  });

  @override
  List<Object?> get props => [
        description,
        phone,
        support,
        email,
        address,
        logo,
        facebook,
        instagram,
        linkedIn,
      ];
}
