class Data {
  String? color;
  String? description;
  String? name;
  String? image;
  String? price;
  int? stock;
  Data(
      {this.color,
      this.description,
      this.name,
      this.image,
      this.price,
      this.stock});

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stock'] = this.stock;
    return data;
  }
}
