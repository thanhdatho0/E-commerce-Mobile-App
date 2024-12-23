class PopularProducts {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<Products> _products;
  List<Products> get products => _products;

  PopularProducts({required totalSize, required typeId, required offset, required products}){
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  PopularProducts.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = _totalSize;
    data['type_id'] = _typeId;
    data['offset'] = _offset;
    data['products'] = _products.map((v) => v.toJson()).toList();
    return data;
  }
}

class Products {
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _stars;
  String? _img;
  String? _location;
  String? _createdAt;
  String? _updatedAt;
  int? _typeId;

  String? get img => _img;
  String? get name => _name;
  int? get star => _stars;
  String? get description => _description;
  int? get price => _price;

  Products(
      {int? id,
        String? name,
        String? description,
        int? price,
        int? stars,
        String? img,
        String? location,
        String? createdAt,
        String? updatedAt,
        int? typeId}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (stars != null) {
      this._stars = stars;
    }
    if (img != null) {
      this._img = img;
    }
    if (location != null) {
      this._location = location;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
  }

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _img = json['img'];
    _location = json['location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _typeId = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['price'] = _price;
    data['stars'] = _stars;
    data['img'] = _img;
    data['location'] = _location;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['type_id'] = _typeId;
    return data;
  }
}