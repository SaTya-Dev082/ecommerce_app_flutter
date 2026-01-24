class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  int? quantity;
  String? discount;
  int? categoryId;
  String? status;
  String? stock;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.discount,
    this.categoryId,
    this.status,
    this.stock,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
      discount: json['discount'],
      categoryId: json['category_id'],
      status: json['status'],
      stock: json['stock'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
