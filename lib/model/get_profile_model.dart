class GetProfileModel {
  bool? isSuccess;
  String? message;
  Data? data;

  GetProfileModel({this.isSuccess, this.message, this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['is_success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_success'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Name? name;
  var username;
  String? email;
  String? phone;
  String? imagePath;
  var address;
  String? rolesName;
  String? status;
  String? type;

  Data(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.imagePath,
        this.address,
        this.rolesName,
        this.status,
        this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    imagePath = json['image_path'];
    address = json['address'];
    rolesName = json['roles_name'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image_path'] = this.imagePath;
    data['address'] = this.address;
    data['roles_name'] = this.rolesName;
    data['status'] = this.status;
    data['type'] = this.type;
    return data;
  }
}

class Name {
  String? en;
  String? ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
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
