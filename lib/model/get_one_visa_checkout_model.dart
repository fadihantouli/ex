class GetOneVisaCheckoutModel {
  bool? isSuccess;
  String? message;
  Data? data;

  GetOneVisaCheckoutModel({this.isSuccess, this.message, this.data});

  GetOneVisaCheckoutModel.fromJson(Map<String, dynamic> json) {
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
  int? visaId;
  int? visaTypeId;
  int? fingerPrintId;
  int? cityId;
  String? startDate;
  String? endDate;
  Null? coupon;
  String? status;
  String? quantityAdult;
  String? quantityChild;
  Null? couponPrice;
  String? totalPrice;
  String? typeRelationshipTravelers;
  int? userId;
  Visa? visa;
  City? city;
  User? user;
  VisaType? visaType;

  Data(
      {this.id,
        this.visaId,
        this.visaTypeId,
        this.fingerPrintId,
        this.cityId,
        this.startDate,
        this.endDate,
        this.coupon,
        this.status,
        this.quantityAdult,
        this.quantityChild,
        this.couponPrice,
        this.totalPrice,
        this.typeRelationshipTravelers,
        this.userId,
        this.visa,
        this.city,
        this.user,
        this.visaType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    visaId = json['visa_id'];
    visaTypeId = json['visa_type_id'];
    fingerPrintId = json['finger_print_id'];
    cityId = json['city_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    coupon = json['coupon'];
    status = json['status'];
    quantityAdult = json['quantity_adult'];
    quantityChild = json['quantity_child'];
    couponPrice = json['coupon_price'];
    totalPrice = json['total_price'];
    typeRelationshipTravelers = json['type_relationship_travelers'];
    userId = json['user_id'];
    visa = json['visa'] != null ? new Visa.fromJson(json['visa']) : Visa();
    city = json['city'] != null ? new City.fromJson(json['city']) : City();
    // user = json['user'] != null ? new User.fromJson(json['user']) : User();
    visaType = json['visa_type'] != null
        ? new VisaType.fromJson(json['visa_type'])
        : VisaType();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['visa_id'] = this.visaId;
    data['visa_type_id'] = this.visaTypeId;
    data['finger_print_id'] = this.fingerPrintId;
    data['city_id'] = this.cityId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['coupon'] = this.coupon;
    data['status'] = this.status;
    data['quantity_adult'] = this.quantityAdult;
    data['quantity_child'] = this.quantityChild;
    data['coupon_price'] = this.couponPrice;
    data['total_price'] = this.totalPrice;
    data['type_relationship_travelers'] = this.typeRelationshipTravelers;
    data['user_id'] = this.userId;
    if (this.visa != null) {
      data['visa'] = this.visa!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.visaType != null) {
      data['visa_type'] = this.visaType!.toJson();
    }
    return data;
  }
}

class Visa {
  int? id;
  int? branchId;
  int? countryId;
  int? status;
  int? tourismPriceAdult;
  int? tourismPriceChild;
  int? studyPriceAdult;
  int? studyPriceChild;
  String? embassyRequest;
  Country? country;

  Visa(
      {this.id,
        this.branchId,
        this.countryId,
        this.status,
        this.tourismPriceAdult,
        this.tourismPriceChild,
        this.studyPriceAdult,
        this.studyPriceChild,
        this.embassyRequest,
        this.country});

  Visa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    countryId = json['country_id'];
    status = json['status'];
    tourismPriceAdult = json['tourism_price_adult'];
    tourismPriceChild = json['tourism_price_child'];
    studyPriceAdult = json['study_price_adult'];
    studyPriceChild = json['study_price_child'];
    embassyRequest = json['embassy_request'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['country_id'] = this.countryId;
    data['status'] = this.status;
    data['tourism_price_adult'] = this.tourismPriceAdult;
    data['tourism_price_child'] = this.tourismPriceChild;
    data['study_price_adult'] = this.studyPriceAdult;
    data['study_price_child'] = this.studyPriceChild;
    data['embassy_request'] = this.embassyRequest;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  int? continentId;
  Name? name;
  Name? description;
  String? logoPath;
  String? imagePath;
  int? status;

  Country(
      {this.id,
        this.continentId,
        this.name,
        this.description,
        this.logoPath,
        this.imagePath,
        this.status});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    continentId = json['continent_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    logoPath = json['logo_path'];
    imagePath = json['image_path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['continent_id'] = this.continentId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['logo_path'] = this.logoPath;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
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

class Description {
  Null? ar;

  Description({this.ar});

  Description.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    return data;
  }
}

class City {
  int? id;
  int? countryId;
  int? branchId;
  Name? name;
  Name? description;
  String? imagePath;
  int? status;

  City(
      {this.id,
        this.countryId,
        this.branchId,
        this.name,
        this.description,
        this.imagePath,
        this.status});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    branchId = json['branch_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : Name();
    imagePath = json['image_path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['branch_id'] = this.branchId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    return data;
  }
}

class User {
  int? id;
  Name? name;
  Null? username;
  String? email;
  String? phone;
  String? imagePath;
  String? address;
  String? rolesName;
  String? status;
  String? type;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : Name();
    username = json['username']??"";
    email = json['email']??"";
    phone = json['phone']??"";
    imagePath = json['image_path']??"";
    address = json['address']??"";
    rolesName = json['roles_name']??"";
    status = json['status']??"";
    type = json['type']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['username'] = this.username??"";
    data['email'] = this.email??"";
    data['phone'] = this.phone??"";
    data['image_path'] = this.imagePath??"";
    data['address'] = this.address??"";
    data['roles_name'] = this.rolesName??"";
    data['status'] = this.status??"";
    data['type'] = this.type??"";
    return data;
  }
}

class VisaType {
  int? id;
  Name? title;
  int? status;

  VisaType({this.id, this.title, this.status});

  VisaType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : Name();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}
