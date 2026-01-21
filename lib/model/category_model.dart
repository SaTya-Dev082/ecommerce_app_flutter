class Categories {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Categories({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
