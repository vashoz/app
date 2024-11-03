class ProductPhotos {
  final String url;

  ProductPhotos({
    required this.url,
  });

  // Factory method to create a ProductImage object from JSON
  factory ProductPhotos.fromJson(Map<String, dynamic> json) {
    return ProductPhotos(
      url: json['image_url'],
    );
  }

  // Method to convert a ProductImage object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'image_url': url,
    };
  }
}
