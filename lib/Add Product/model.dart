class AddProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? image;
  String? category;

  AddProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.image,
        this.category});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }
}
