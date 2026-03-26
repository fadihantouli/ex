class ServiseTypeModel {
  bool? isSuccess;
  String? message;
  List<Data>? data;

  ServiseTypeModel({this.isSuccess, this.message, this.data});

  ServiseTypeModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['is_success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_success'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Type? type;
  String? price;
  String? imagePath;

  Data({this.id, this.type, this.price, this.imagePath});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    price = json['price'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['price'] = this.price;
    data['image_path'] = this.imagePath;

    return data;
  }
}

class Type {
  String? en;
  String? ar;

  Type({this.en, this.ar});

  Type.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}
