import '../../../../core/shared/shared.dart';
import 'product_images.dart';

// ignore: must_be_immutable
class ProductsEntity extends Equatable {
  final String productId;
  final String productName;
  final int categoryId;
  final List<ProductPhotos> productImages;
  final bool isFavorite;
  final bool isNew;
  final double productPrice;
  final int stockIn;
  int quantity;

  ProductsEntity({
    required this.productId,
    required this.productName,
    required this.categoryId,
    required this.productImages,
    required this.isFavorite,
    required this.isNew,
    required this.productPrice,
    required this.stockIn,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        categoryId,
        productImages,
        isFavorite,
        isNew,
        productPrice,
        stockIn,
      ];

  ProductsEntity copyWith({
    String? productId,
    String? productName,
    int? categoryId,
    List<ProductPhotos>? productImages,
    bool? isFavorite,
    bool? isNew,
    double? productPrice,
    int? stockIn,
    int? quantity,
  }) {
    return ProductsEntity(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      categoryId: categoryId ?? this.categoryId,
      productImages: productImages ?? this.productImages,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
      productPrice: productPrice ?? this.productPrice,
      stockIn: stockIn ?? this.stockIn,
      quantity: quantity ?? this.quantity,
    );
  }
}
