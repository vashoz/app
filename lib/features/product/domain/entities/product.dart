import '../../../../core/shared/shared.dart';
import '../../../discount/discount.dart';
import '../../../variant/variant.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String guid;
  final String productName;
  final String url;
  final List<String> productImages;
  final List<String> categories;
  final List<VariantEntity> variants;
  final String description;
  final DiscountEntity? discount;
  final int bundles;
  final List<String> relatedProducts;

  const ProductEntity({
    required this.guid,
    required this.productName,
    required this.productImages,
    required this.description,
    required this.bundles,
    required this.url,
    required this.categories,
    required this.variants,
    required this.discount,
    required this.relatedProducts,
  });

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
        relatedProducts,
      ];

  ProductEntity copyWith({
    String? productId,
    String? productName,
    int? categoryId,
    List<String>? productImages,
    String? description,
    int? stockIn,
    String? url,
    List<String>? categories,
    List<VariantEntity>? variants,
    DiscountEntity? discount,
    List<String>? relatedProducts,
  }) {
    return ProductEntity(
      guid: productId ?? guid,
      productName: productName ?? this.productName,
      productImages: productImages ?? this.productImages,
      description: description ?? this.description,
      bundles: stockIn ?? bundles,
      url: url ?? this.url,
      categories: categories ?? this.categories,
      variants: variants ?? this.variants,
      discount: discount ?? this.discount,
      relatedProducts: relatedProducts ?? this.relatedProducts,
    );
  }

  toMap() {
    return {
      'guid': guid,
      'productName': productName,
      'productImages': productImages,
      'description': description,
      'bundles': bundles,
      'url': url,
      'categories': categories,
      'variants': variants,
      'discount': discount,
      'related_products': relatedProducts,
    };
  }
}
