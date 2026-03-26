class VisaModel {
  bool? isSuccess;
  var message;
  List<Data>? data;

  VisaModel({this.isSuccess, this.message, this.data});

  VisaModel.fromJson(Map<String, dynamic> json) {
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
  var id;
  var branchId;
  var countryId;
  var status;
  var embassyRequest;
  Country? country;
  Branch? branch;
  VisaDetail? visaDetail;
  List<VisaCheckouts>? visaCheckouts;
  List<Coupons>? coupons;
  List<VisaTypes>? visaTypes;
  List<VisaFingerprint>? visaFingerprint;

  Data(
      {this.id,
        this.branchId,
        this.countryId,
        this.status,
        this.embassyRequest,
        this.country,
        this.branch,
        this.visaDetail,
        this.visaCheckouts,
        this.coupons,
        this.visaTypes,
        this.visaFingerprint});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    countryId = json['country_id'];
    status = json['status'];
    embassyRequest = json['embassy_request'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    visaDetail = json['visa_detail'] != null
        ? new VisaDetail.fromJson(json['visa_detail'])
        : null;
    if (json['visa_checkouts'] != null) {
      visaCheckouts = <VisaCheckouts>[];
      json['visa_checkouts'].forEach((v) {
        visaCheckouts!.add(new VisaCheckouts.fromJson(v));
      });
    }
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
    if (json['visa_types'] != null) {
      visaTypes = <VisaTypes>[];
      json['visa_types'].forEach((v) {
        visaTypes!.add(new VisaTypes.fromJson(v));
      });
    }
    if (json['visa_fingerprint'] != null) {
      visaFingerprint = <VisaFingerprint>[];
      json['visa_fingerprint'].forEach((v) {
        visaFingerprint!.add(new VisaFingerprint.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    data['country_id'] = this.countryId;
    data['status'] = this.status;
    data['embassy_request'] = this.embassyRequest;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.visaDetail != null) {
      data['visa_detail'] = this.visaDetail!.toJson();
    }
    if (this.visaCheckouts != null) {
      data['visa_checkouts'] =
          this.visaCheckouts!.map((v) => v.toJson()).toList();
    }
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    if (this.visaTypes != null) {
      data['visa_types'] = this.visaTypes!.map((v) => v.toJson()).toList();
    }
    if (this.visaFingerprint != null) {
      data['visa_fingerprint'] =
          this.visaFingerprint!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  var id;
  var continentId;
  Name? name;
  Name? description;
  var logoPath;
  var imagePath;
  var status;

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
  var en;
  var ar;

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

class Branch {
  var id;
  var countryId;
  var userId;
  Name? name;
  var email;
  var phone;
  var address;
  var link;
  var description;
  var logoPath;
  var imagePath;
  var status;

  Branch(
      {this.id,
        this.countryId,
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.link,
        this.description,
        this.logoPath,
        this.imagePath,
        this.status});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    userId = json['user_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    link = json['link'];
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
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['link'] = this.link;
    data['description'] = this.description;
    data['logo_path'] = this.logoPath;
    data['image_path'] = this.imagePath;
    data['status'] = this.status;
    return data;
  }
}

class VisaDetail {
  var id;
  Name? title;
  Name? imageDescription;
  Name? salaryDescription;
  Name? accountStatementDescription;
  Name? studyVisaStatus;
  Name? interviewAtEmbassy;
  Name? fingerprintDescription;
  Name? durationDescription;
  Name? medicalInsuranceDescription;
  Name? secure;
  Name? translate;
  Name? weCareAboutYourJourney;
  Name? description;
  var visaId;

  VisaDetail(
      {this.id,
        this.title,
        this.imageDescription,
        this.salaryDescription,
        this.accountStatementDescription,
        this.studyVisaStatus,
        this.interviewAtEmbassy,
        this.fingerprintDescription,
        this.durationDescription,
        this.medicalInsuranceDescription,
        this.secure,
        this.translate,
        this.weCareAboutYourJourney,
        this.description,
        this.visaId});

  VisaDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    imageDescription = json['image_description'] != null
        ? new Name.fromJson(json['image_description'])
        : null;
    salaryDescription = json['salary_description'] != null
        ? new Name.fromJson(json['salary_description'])
        : null;
    accountStatementDescription = json['account_statement_description'] != null
        ? new Name.fromJson(json['account_statement_description'])
        : null;
    studyVisaStatus = json['study_visa_status'] != null
        ? new Name.fromJson(json['study_visa_status'])
        : null;
    interviewAtEmbassy = json['interview_at_embassy'] != null
        ? new Name.fromJson(json['interview_at_embassy'])
        : null;
    fingerprintDescription = json['fingerprint_description'] != null
        ? new Name.fromJson(json['fingerprint_description'])
        : null;
    durationDescription = json['duration_description'] != null
        ? new Name.fromJson(json['duration_description'])
        : null;
    medicalInsuranceDescription = json['medical_insurance_description'] != null
        ? new Name.fromJson(json['medical_insurance_description'])
        : null;
    secure = json['secure'] != null ? new Name.fromJson(json['secure']) : null;
    translate =
    json['translate'] != null ? new Name.fromJson(json['translate']) : null;
    weCareAboutYourJourney = json['we_care_about_your_journey'] != null
        ? new Name.fromJson(json['we_care_about_your_journey'])
        : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    visaId = json['visa_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.imageDescription != null) {
      data['image_description'] = this.imageDescription!.toJson();
    }
    if (this.salaryDescription != null) {
      data['salary_description'] = this.salaryDescription!.toJson();
    }
    if (this.accountStatementDescription != null) {
      data['account_statement_description'] =
          this.accountStatementDescription!.toJson();
    }
    if (this.studyVisaStatus != null) {
      data['study_visa_status'] = this.studyVisaStatus!.toJson();
    }
    if (this.interviewAtEmbassy != null) {
      data['interview_at_embassy'] = this.interviewAtEmbassy!.toJson();
    }
    if (this.fingerprintDescription != null) {
      data['fingerprint_description'] = this.fingerprintDescription!.toJson();
    }
    if (this.durationDescription != null) {
      data['duration_description'] = this.durationDescription!.toJson();
    }
    if (this.medicalInsuranceDescription != null) {
      data['medical_insurance_description'] =
          this.medicalInsuranceDescription!.toJson();
    }
    if (this.secure != null) {
      data['secure'] = this.secure!.toJson();
    }
    if (this.translate != null) {
      data['translate'] = this.translate!.toJson();
    }
    if (this.weCareAboutYourJourney != null) {
      data['we_care_about_your_journey'] =
          this.weCareAboutYourJourney!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['visa_id'] = this.visaId;
    return data;
  }
}

class VisaCheckouts {
  var id;
  var visaId;
  var visaTypeId;
  var fingerPrintId;
  var cityId;
  var startDate;
  var endDate;
  var coupon;
  var status;
  var quantityAdult;
  var quantityChild;
  var couponPrice;
  var totalPrice;
  var typeRelationshipTravelers;
  var userId;
  User? user;

  VisaCheckouts(
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
        this.user});

  VisaCheckouts.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var id;
  Name? name;
  var username;
  var email;
  var phone;
  var imagePath;
  var address;
  var rolesName;
  var status;
  var type;

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

class Coupons {
  var id;
  var title;
  var ratio;
  var status;
  var visaId;
  var type;

  Coupons(
      {this.id, this.title, this.ratio, this.status, this.visaId, this.type});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    ratio = json['ratio'];
    status = json['status'];
    visaId = json['visa_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ratio'] = this.ratio;
    data['status'] = this.status;
    data['visa_id'] = this.visaId;
    data['type'] = this.type;
    return data;
  }
}

class VisaTypes {
  var id;
  Name? title;
  var status;
  Pivot? pivot;

  VisaTypes({this.id, this.title, this.status, this.pivot});

  VisaTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    status = json['status'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['status'] = this.status;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  var visaId;
  var visaTypeId;
  var priceAdult;
  var priceChild;

  Pivot({this.visaId, this.visaTypeId, this.priceAdult, this.priceChild});

  Pivot.fromJson(Map<String, dynamic> json) {
    visaId = json['visa_id'];
    visaTypeId = json['visa_type_id'];
    priceAdult = json['price_adult'];
    priceChild = json['price_child'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visa_id'] = this.visaId;
    data['visa_type_id'] = this.visaTypeId;
    data['price_adult'] = this.priceAdult;
    data['price_child'] = this.priceChild;
    return data;
  }
}

class VisaFingerprint {
  var id;
  var visaId;
  Name? cityName;

  VisaFingerprint({this.id, this.visaId, this.cityName});

  VisaFingerprint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    visaId = json['visa_id'];
    cityName =
    json['city_name'] != null ? new Name.fromJson(json['city_name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['visa_id'] = this.visaId;
    if (this.cityName != null) {
      data['city_name'] = this.cityName!.toJson();
    }
    return data;
  }
}
