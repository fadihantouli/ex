class GetOneAcademyModel {
  bool? isSuccess;
  String? message;
  Data? data;

  GetOneAcademyModel({this.isSuccess, this.message, this.data});

  GetOneAcademyModel.fromJson(Map<String, dynamic> json) {
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
  int? branchId;
  int? countryId;
  int? cityId;
  Title? title;
  Title? description;
  Title? descriptionTwo;
  String? imagePath;
  String? videoPath;
  String? logoPath;
  String? late;
  String? lang;
  int? status;
  Country? country;
  City? city;
  List<Attachment>? attachment;
  List<Course>? course;
  List<Housing>? housing;
  List<Accreditation>? accreditation;
  List<Reception>? reception;
  List<Insurance>? insurance;
  List<AcademyServices>? academyServices;

  Data(
      {this.id,
        this.branchId,
        this.countryId,
        this.cityId,
        this.title,
        this.description,
        this.descriptionTwo,
        this.imagePath,
        this.videoPath,
        this.logoPath,
        this.late,
        this.lang,
        this.status,
        this.country,
        this.city,
        this.attachment,
        this.course,
        this.housing,
        this.accreditation,
        this.reception,
        this.insurance,
        this.academyServices});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    descriptionTwo = json['description_two'] != null
        ? new Title.fromJson(json['description_two'])
        : null;
    imagePath = json['image_path'];
    videoPath = json['video_path'];
    logoPath = json['logo_path'];
    late = json['late'];
    lang = json['lang'];
    status = json['status'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['attachment'] != null) {
      attachment = <Attachment>[];
      json['attachment'].forEach((v) {
        attachment!.add(new Attachment.fromJson(v));
      });
    }
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
    if (json['housing'] != null) {
      housing = <Housing>[];
      json['housing'].forEach((v) {
        housing!.add(new Housing.fromJson(v));
      });
    }
    if (json['accreditation'] != null) {
      accreditation = <Accreditation>[];
      json['accreditation'].forEach((v) {
        accreditation!.add(new Accreditation.fromJson(v));
      });
    }
    if (json['reception'] != null) {
      reception = <Reception>[];
      json['reception'].forEach((v) {
        reception!.add(new Reception.fromJson(v));
      });
    }
    if (json['insurance'] != null) {
      insurance = <Insurance>[];
      json['insurance'].forEach((v) {
        insurance!.add(new Insurance.fromJson(v));
      });
    }
    if (json['academy_services'] != null) {
      academyServices = <AcademyServices>[];
      json['academy_services'].forEach((v) {
        academyServices!.add(new AcademyServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.descriptionTwo != null) {
      data['description_two'] = this.descriptionTwo!.toJson();
    }
    data['image_path'] = this.imagePath;
    data['video_path'] = this.videoPath;
    data['logo_path'] = this.logoPath;
    data['late'] = this.late;
    data['lang'] = this.lang;
    data['status'] = this.status;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.map((v) => v.toJson()).toList();
    }
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }
    if (this.housing != null) {
      data['housing'] = this.housing!.map((v) => v.toJson()).toList();
    }
    if (this.accreditation != null) {
      data['accreditation'] =
          this.accreditation!.map((v) => v.toJson()).toList();
    }
    if (this.reception != null) {
      data['reception'] = this.reception!.map((v) => v.toJson()).toList();
    }
    if (this.insurance != null) {
      data['insurance'] = this.insurance!.map((v) => v.toJson()).toList();
    }
    if (this.academyServices != null) {
      data['academy_services'] =
          this.academyServices!.map((v) => v.toJson()).toList();
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
  Title? description;
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
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
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

class Description {
  var ar;

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
  Title? name;
  Title? description;
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
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
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

class Attachment {
  int? id;
  var invitationId;
  List<Images>? images;
  List<Videos>? videos;
  List<Documents>? documents;

  Attachment(
      {this.id, this.invitationId, this.images, this.videos, this.documents});

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invitationId = json['invitation_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invitation_id'] = this.invitationId;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Videos {
  int? id;
  int? attachmentId;
  String? path;
  String? type;
  int? status;

  Videos(
      {this.id, this.attachmentId, this.path, this.type, this.status});

  Videos.fromJson(Map<String, dynamic> json) {
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
class Documents {
  int? id;
  int? attachmentId;
  String? path;
  String? type;
  int? status;

  Documents(
      {this.id, this.attachmentId, this.path, this.type, this.status});

  Documents.fromJson(Map<String, dynamic> json) {
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

class Course {
  int? id;
  int? academyId;
  Title? title;
  Title? description;
  String? priceBefore;
  String? priceAfter;
  String? registrationFees;
  var tax;
  String? studyWeeks;
  String? startDate;
  int? status;

  Course(
      {this.id,
        this.academyId,
        this.title,
        this.description,
        this.priceBefore,
        this.priceAfter,
        this.registrationFees,
        this.tax,
        this.studyWeeks,
        this.startDate,
        this.status});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    academyId = json['academy_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    priceBefore = json['price_before'];
    priceAfter = json['price_after'];
    registrationFees = json['registration_fees'];
    tax = json['tax'];
    studyWeeks = json['study_weeks'];
    startDate = json['start_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['academy_id'] = this.academyId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price_before'] = this.priceBefore;
    data['price_after'] = this.priceAfter;
    data['registration_fees'] = this.registrationFees;
    data['tax'] = this.tax;
    data['study_weeks'] = this.studyWeeks;
    data['start_date'] = this.startDate;
    data['status'] = this.status;
    return data;
  }
}

class Housing {
  int? id;
  int? academyId;
  Title? title;
  Title? description;
  String? price;
  int? status;
  List<HousingServices>? housingServices;

  Housing(
      {this.id,
        this.academyId,
        this.title,
        this.description,
        this.price,
        this.status,
        this.housingServices});

  Housing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    academyId = json['academy_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    price = json['price'];
    status = json['status'];
    if (json['housing_services'] != null) {
      housingServices = <HousingServices>[];
      json['housing_services'].forEach((v) {
        housingServices!.add(new HousingServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['academy_id'] = this.academyId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['status'] = this.status;
    if (this.housingServices != null) {
      data['housing_services'] =
          this.housingServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HousingServices {
  int? id;
  Title? name;
  String? imagePath;
  int? status;
  Pivot? pivot;

  HousingServices(
      {this.id, this.name, this.imagePath, this.status, this.pivot});

  HousingServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Title.fromJson(json['name']) : null;
    imagePath = json['image_path'];
    status = json['status'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? housingId;
  int? housingServiceId;

  Pivot({this.housingId, this.housingServiceId});

  Pivot.fromJson(Map<String, dynamic> json) {
    housingId = json['housing_id'];
    housingServiceId = json['housing_service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['housing_id'] = this.housingId;
    data['housing_service_id'] = this.housingServiceId;
    return data;
  }
}

class Accreditation {
  int? id;
  Title? title;
  String? imagePath;
  String? certificationPath;
  var certificationNumber;
  int? status;
  Pivot? pivot;

  Accreditation(
      {this.id,
        this.title,
        this.imagePath,
        this.certificationPath,
        this.certificationNumber,
        this.status,
        this.pivot});

  Accreditation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    imagePath = json['image_path'];
    certificationPath = json['certification_path'];
    certificationNumber = json['certification_number'];
    status = json['status'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['image_path'] = this.imagePath;
    data['certification_path'] = this.certificationPath;
    data['certification_number'] = this.certificationNumber;
    data['status'] = this.status;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}



class Reception {
  int? id;
  int? academyId;
  Title? title;
  Title? description;
  String? price;
  int? status;

  Reception(
      {this.id,
        this.academyId,
        this.title,
        this.description,
        this.price,
        this.status});

  Reception.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    academyId = json['academy_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['academy_id'] = this.academyId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}

class Insurance {
  int? id;
  int? academyId;
  InsuranceTitleTitle? title;
  InsuranceTitleDescription? description;
  String? price;
  int? status;

  Insurance(
      {this.id,
        this.academyId,
        this.title,
        this.description,
        this.price,
        this.status});

  Insurance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    academyId = json['academy_id'];
    title = json['title'] != null ? new InsuranceTitleTitle.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new InsuranceTitleDescription.fromJson(json['description'])
        : null;
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['academy_id'] = this.academyId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}

class InsuranceTitleTitle {
  String? en;
  String? ar;

  InsuranceTitleTitle({this.en, this.ar});

  InsuranceTitleTitle.fromJson(Map<String, dynamic> json) {
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
class InsuranceTitleDescription {
  String? en;
  String? ar;

  InsuranceTitleDescription({this.en, this.ar});

  InsuranceTitleDescription.fromJson(Map<String, dynamic> json) {
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
class AcademyServices {
  int? id;
  Name? name;
  String? imagePath;
  int? status;
  PivotAcademyServices? pivot;

  AcademyServices({this.id, this.name, this.imagePath, this.status, this.pivot});

  AcademyServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    imagePath = json['image_path'];
    status = json['status'];
    pivot = json['pivot'] != null ? new PivotAcademyServices.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
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

class PivotAcademyServices {
  int? academyId;
  int? academyServiceId;

  PivotAcademyServices({this.academyId, this.academyServiceId});

  PivotAcademyServices.fromJson(Map<String, dynamic> json) {
    academyId = json['academy_id'];
    academyServiceId = json['academy_service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['academy_id'] = this.academyId;
    data['academy_service_id'] = this.academyServiceId;
    return data;
  }
}
