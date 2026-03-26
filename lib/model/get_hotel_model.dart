class GetHotelModel {
  bool? isSuccess;
  String? message;
  List<Data>? data;

  GetHotelModel({this.isSuccess, this.message, this.data});

  GetHotelModel.fromJson(Map<String, dynamic> json) {
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
  Title? title;
  String? email;
  String? phone;
  String? late;
  String? lang;
  String? imagePath;
  Title? description;
  Title? descriptionTwo;
  Title? accommodationPolicy;
  int? branchId;
  int? countryId;
  int? cityId;
  int? status;
  Null? paymentMethods;
  int? isFavoriteCount;
  Country? country;
  Branch? branch;
  City? city;
  Attachment? attachment;
  List<Rooms>? rooms;

  Data(
      {this.id,
        this.title,
        this.email,
        this.phone,
        this.late,
        this.lang,
        this.imagePath,
        this.description,
        this.descriptionTwo,
        this.accommodationPolicy,
        this.branchId,
        this.countryId,
        this.cityId,
        this.status,
        this.paymentMethods,
        this.isFavoriteCount,
        this.country,
        this.branch,
        this.city,
        this.attachment,
        this.rooms});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    email = json['email'];
    phone = json['phone'];
    late = json['late'];
    lang = json['lang'];
    imagePath = json['image_path'];
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    descriptionTwo = json['description_two'] != null
        ? new Title.fromJson(json['description_two'])
        : null;
    accommodationPolicy = json['accommodation_policy'] != null
        ? new Title.fromJson(json['accommodation_policy'])
        : null;
    branchId = json['branch_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    status = json['status'];
    paymentMethods = json['payment_methods'];
    isFavoriteCount = json['is_favorite_count'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['late'] = this.late;
    data['lang'] = this.lang;
    data['image_path'] = this.imagePath;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.descriptionTwo != null) {
      data['description_two'] = this.descriptionTwo!.toJson();
    }
    if (this.accommodationPolicy != null) {
      data['accommodation_policy'] = this.accommodationPolicy!.toJson();
    }
    data['branch_id'] = this.branchId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['status'] = this.status;
    data['payment_methods'] = this.paymentMethods;
    data['is_favorite_count'] = this.isFavoriteCount;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
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

class Country {
  int? id;
  int? continentId;
  Title? name;
  Null? description;
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
    name = json['name'] != null ? new Title.fromJson(json['name']) : null;
    description = json['description'];
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
    data['description'] = this.description;
    data['logo_path'] = this.logoPath;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    return data;
  }
}

class Branch {
  int? id;
  int? countryId;
  Null? userId;
  Title? name;
  Null? description;
  String? logoPath;
  String? imagePath;
  int? status;

  Branch(
      {this.id,
        this.countryId,
        this.userId,
        this.name,
        this.description,
        this.logoPath,
        this.imagePath,
        this.status});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    userId = json['user_id'];
    name = json['name'] != null ? new Title.fromJson(json['name']) : null;
    description = json['description'];
    logoPath = json['logo_path'];
    imagePath = json['image_path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['user_id'] = this.userId;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['description'] = this.description;
    data['logo_path'] = this.logoPath;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    return data;
  }
}

class City {
  int? id;
  int? countryId;
  int? branchId;
  Title? name;
  Null? description;
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
    name = json['name'] != null ? new Title.fromJson(json['name']) : null;
    description = json['description'];
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
    data['description'] = this.description;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    return data;
  }
}

class Attachment {
  int? id;
  List<Images>? images;

  Attachment({this.id, this.images});

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  int? attachmentId;
  String? path;
  String? type;
  int? status;

  Images({this.id, this.attachmentId, this.path, this.type, this.status});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attachmentId = json['attachment_id'];
    path = json['path'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attachment_id'] = this.attachmentId;
    data['path'] = this.path;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}

class Rooms {
  int? id;
  Title? title;
  String? numberPerson;
  Title? description;
  String? type;
  String? price;
  String? roomNumber;
  String? imagePath;
  int? status;
  int? hotelId;
  String? startDate;
  String? endDate;

  Rooms(
      {this.id,
        this.title,
        this.numberPerson,
        this.description,
        this.type,
        this.price,
        this.roomNumber,
        this.imagePath,
        this.status,
        this.hotelId,
        this.startDate,
        this.endDate});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    numberPerson = json['number_person'];
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    type = json['type'];
    price = json['price'];
    roomNumber = json['room_number'];
    imagePath = json['image_path'];
    status = json['status'];
    hotelId = json['hotel_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['number_person'] = this.numberPerson;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['type'] = this.type;
    data['price'] = this.price;
    data['room_number'] = this.roomNumber;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    data['hotel_id'] = this.hotelId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
