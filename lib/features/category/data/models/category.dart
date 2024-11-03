import '../../../../core/shared/shared.dart';
import '../../category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.guid,
    required super.name,
    required super.icon,
    required super.url,
  });

  factory CategoryModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return CategoryModel(
        guid: map['guid'] as String,
        name: map['name'] as String,
        icon: IconData(
          int.tryParse(map['icon']) ?? Icons.category.codePoint,
          fontFamily: 'MaterialIcons',
        ),
        url: map['url'] as String,
      );
    } catch (e, stackTrace) {
      throw CategoriesModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
