class ProductModel {
  bool? status;
  String? message;
  List<Products>? products;

  ProductModel({this.status, this.message, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
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

  Products({
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    discount = json['discount'];
    categoryId = json['category_id'];
    status = json['status'];
    stock = json['stock'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['stock'] = this.stock;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
