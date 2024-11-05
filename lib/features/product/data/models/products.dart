import 'package:vashoz/features/discount/data/models/discount.dart';

import '../../../../core/shared/shared.dart';
import '../../../variant/variant.dart';
import '../../product.dart';

// ignore: must_be_immutable
class ProductsModel extends ProductEntity {
  const ProductsModel({
    required super.guid,
    required super.productName,
    required super.productImages,
    required super.description,
    required super.bundles,
    required super.url,
    required super.categories,
    required super.variants,
    required super.discount,
    required super.relatedProducts,
  });

  factory ProductsModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      final photos = List<String>.from(map['photos']).map((e) => e).toList();

      final categoriesList =
          List<String>.from(map['categories']).map((e) => e).toList();
      final relatedProducts =
          List<String>.from(map['related']).map((e) => e).toList();

      var variants = List<Map<String, dynamic>>.from(map['variants'])
          .map(
            (e) => VariantModel.parse(map: e),
          )
          .toList();
      return ProductsModel(
        guid: map['guid'],
        productName: map['name'],
        productImages: photos,
        description: map['description'],
        bundles: map['bundles'],
        url: map['url'],
        categories: categoriesList,
        variants: variants,
        discount: DiscountModel.parse(map: map['discount']),
        relatedProducts: relatedProducts,
      );
    } catch (e, stackTrace) {
      throw ProductsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  List<Object?> get props => [
        guid,
        productName,
        productImages,
        description,
        bundles,
        url,
        categories,
        variants,
        discount,
      ];

  @override
  toMap() {
    return {
      'guid': guid,
      'name': productName,
      'photos': productImages,
      'description': description,
      'bundles': bundles,
      'url': url,
      'categories': categories,
      'variants': variants.map((e) => e.toMap).toList(),
      'discount': discount.toMap,
    };
  }
}
