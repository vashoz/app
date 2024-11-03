import '../../../../core/shared/shared.dart';

class CategoryEntity extends Equatable {
  final String name;
  final String guid;
  final IconData icon;
  final String url;

  const CategoryEntity({
    required this.guid,
    required this.name,
    required this.icon,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        icon,
        guid,
        url,
      ];
}
