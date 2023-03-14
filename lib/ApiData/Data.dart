class Data {
  String? color;
  String? description;
  String? name;
  String? price;

  Data({this.color, this.description, this.name, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    description = json['description'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['description'] = this.description;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}