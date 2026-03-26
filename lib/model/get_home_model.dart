class ViewHomeModel {
  bool? isSuccess;
  var message;
  Data? data;

  ViewHomeModel({this.isSuccess, this.message, this.data});

  ViewHomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Categories>? categories;
  List<Services>? services;
  List<Visas>? visas;
  List<Hotels>? hotels;
  List<Academys>? academys;
  List<Airports>? airports;
  List<Packages>? packages;

  Data(
      {this.categories,
        this.services,
        this.visas,
        this.hotels,
        this.academys,
        this.airports,
        this.packages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['visas'] != null) {
      visas = <Visas>[];
      json['visas'].forEach((v) {
        visas!.add(new Visas.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        hotels!.add(new Hotels.fromJson(v));
      });
    }
    if (json['academys'] != null) {
      academys = <Academys>[];
      json['academys'].forEach((v) {
        academys!.add(new Academys.fromJson(v));
      });
    }
    if (json['airports'] != null) {
      airports = <Airports>[];
      json['airports'].forEach((v) {
        airports!.add(new Airports.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.visas != null) {
      data['visas'] = this.visas!.map((v) => v.toJson()).toList();
    }
    if (this.hotels != null) {
      data['hotels'] = this.hotels!.map((v) => v.toJson()).toList();
    }
    if (this.academys != null) {
      data['academys'] = this.academys!.map((v) => v.toJson()).toList();
    }
    if (this.airports != null) {
      data['airports'] = this.airports!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  var id;
  Title? title;
  var logoPath;
  var status;

  Categories({this.id, this.title, this.logoPath, this.status});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    logoPath = json['logo_path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['logo_path'] = this.logoPath;
    data['status'] = this.status;
    return data;
  }
}

class Title {
  var en;
  var ar;

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

class Services {
  var id;
  var travelModelType;
  var name;
  var email;
  var phone;
  var airportType;
  var airportPlaceOfDelivery;
  var airportDate;
  var driverCountry;
  var driverTripDurationInDays;
  var driverReceiptDate;
  var licenceCount;
  var licence2Count;
  var licenceReceiptLocation;
  var licence2ReceiptLocation;
  var universityCountry;
  var universityNationality;
  var universityPaymentMethod;
  var universitySpecialization;
  var universityEducationalQualification;
  var universityAcademicLastCertificate;
  var universityIELTSTOEFL;
  var universityPreferredCallTime;
  var translationCount;
  var translationTypePreferred;
  var translationFile;
  var passportsCount;
  var passportsCountry;
  var uaeVisaCount;
  var bVisaCount;
  var qVisaCount;
  var iELTSTestCityId;
  var pTETestCityId;
  var insuranceLicenceDriverFile;
  var visaChildrenCount;
  var visaChildrenCountryId;
  var serviceTypeId;
  var status;
  ServiceType? serviceType;

  Services(
      {this.id,
        this.travelModelType,
        this.name,
        this.email,
        this.phone,
        this.airportType,
        this.airportPlaceOfDelivery,
        this.airportDate,
        this.driverCountry,
        this.driverTripDurationInDays,
        this.driverReceiptDate,
        this.licenceCount,
        this.licence2Count,
        this.licenceReceiptLocation,
        this.licence2ReceiptLocation,
        this.universityCountry,
        this.universityNationality,
        this.universityPaymentMethod,
        this.universitySpecialization,
        this.universityEducationalQualification,
        this.universityAcademicLastCertificate,
        this.universityIELTSTOEFL,
        this.universityPreferredCallTime,
        this.translationCount,
        this.translationTypePreferred,
        this.translationFile,
        this.passportsCount,
        this.passportsCountry,
        this.uaeVisaCount,
        this.bVisaCount,
        this.qVisaCount,
        this.iELTSTestCityId,
        this.pTETestCityId,
        this.insuranceLicenceDriverFile,
        this.visaChildrenCount,
        this.visaChildrenCountryId,
        this.serviceTypeId,
        this.status,
        this.serviceType});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travelModelType = json['travel_model_type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    airportType = json['airport_type'];
    airportPlaceOfDelivery = json['airport_place_of_delivery'];
    airportDate = json['airport_date'];
    driverCountry = json['driver_country'];
    driverTripDurationInDays = json['driver_trip_duration_in_days'];
    driverReceiptDate = json['driver_receipt_date'];
    licenceCount = json['licence_count'];
    licence2Count = json['licence2_count'];
    licenceReceiptLocation = json['licence_receipt_location'];
    licence2ReceiptLocation = json['licence2_receipt_location'];
    universityCountry = json['university_country'];
    universityNationality = json['university_nationality'];
    universityPaymentMethod = json['university_payment_method'];
    universitySpecialization = json['university_specialization'];
    universityEducationalQualification =
    json['university_educational_qualification'];
    universityAcademicLastCertificate =
    json['university_academic_last_certificate'];
    universityIELTSTOEFL = json['university_IELTS_TOEFL'];
    universityPreferredCallTime = json['university_preferred_call_time'];
    translationCount = json['translation_count'];
    translationTypePreferred = json['translation_type_preferred'];
    translationFile = json['translation_file'];
    passportsCount = json['passports_count'];
    passportsCountry = json['passports_country'];
    uaeVisaCount = json['uae_visa_count'];
    bVisaCount = json['b_visa_count'];
    qVisaCount = json['q_visa_count'];
    iELTSTestCityId = json['IELTS_test_city_id'];
    pTETestCityId = json['PTE_test_city_id'];
    insuranceLicenceDriverFile = json['insurance_licence_driver_file'];
    visaChildrenCount = json['visa_children_count'];
    visaChildrenCountryId = json['visa_children_country_id'];
    serviceTypeId = json['service_type_id'];
    status = json['status'];
    serviceType = json['service_type'] != null
        ? new ServiceType.fromJson(json['service_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['travel_model_type'] = this.travelModelType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['airport_type'] = this.airportType;
    data['airport_place_of_delivery'] = this.airportPlaceOfDelivery;
    data['airport_date'] = this.airportDate;
    data['driver_country'] = this.driverCountry;
    data['driver_trip_duration_in_days'] = this.driverTripDurationInDays;
    data['driver_receipt_date'] = this.driverReceiptDate;
    data['licence_count'] = this.licenceCount;
    data['licence2_count'] = this.licence2Count;
    data['licence_receipt_location'] = this.licenceReceiptLocation;
    data['licence2_receipt_location'] = this.licence2ReceiptLocation;
    data['university_country'] = this.universityCountry;
    data['university_nationality'] = this.universityNationality;
    data['university_payment_method'] = this.universityPaymentMethod;
    data['university_specialization'] = this.universitySpecialization;
    data['university_educational_qualification'] =
        this.universityEducationalQualification;
    data['university_academic_last_certificate'] =
        this.universityAcademicLastCertificate;
    data['university_IELTS_TOEFL'] = this.universityIELTSTOEFL;
    data['university_preferred_call_time'] = this.universityPreferredCallTime;
    data['translation_count'] = this.translationCount;
    data['translation_type_preferred'] = this.translationTypePreferred;
    data['translation_file'] = this.translationFile;
    data['passports_count'] = this.passportsCount;
    data['passports_country'] = this.passportsCountry;
    data['uae_visa_count'] = this.uaeVisaCount;
    data['b_visa_count'] = this.bVisaCount;
    data['q_visa_count'] = this.qVisaCount;
    data['IELTS_test_city_id'] = this.iELTSTestCityId;
    data['PTE_test_city_id'] = this.pTETestCityId;
    data['insurance_licence_driver_file'] = this.insuranceLicenceDriverFile;
    data['visa_children_count'] = this.visaChildrenCount;
    data['visa_children_country_id'] = this.visaChildrenCountryId;
    data['service_type_id'] = this.serviceTypeId;
    data['status'] = this.status;
    if (this.serviceType != null) {
      data['service_type'] = this.serviceType!.toJson();
    }
    return data;
  }
}

class ServiceType {
  var id;
  Title? type;
  var price;
  var imagePath;

  ServiceType({this.id, this.type, this.price, this.imagePath});

  ServiceType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'] != null ? new Title.fromJson(json['type']) : null;
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

class Visas {
  var id;
  var branchId;
  var countryId;
  var status;
  var tourismPriceAdult;
  var tourismPriceChild;
  var studyPriceAdult;
  var studyPriceChild;
  var coupon;
  Country? country;
  Branch? branch;
  var visaDetail;

  Visas(
      {this.id,
        this.branchId,
        this.countryId,
        this.status,
        this.tourismPriceAdult,
        this.tourismPriceChild,
        this.studyPriceAdult,
        this.studyPriceChild,
        this.coupon,
        this.country,
        this.branch,
        this.visaDetail});

  Visas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    countryId = json['country_id'];
    status = json['status'];
    tourismPriceAdult = json['tourism_price_adult'];
    tourismPriceChild = json['tourism_price_child'];
    studyPriceAdult = json['study_price_adult'];
    studyPriceChild = json['study_price_child'];
    coupon = json['coupon'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    visaDetail = json['visa_detail'];
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
    data['coupon'] = this.coupon;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['visa_detail'] = this.visaDetail;
    return data;
  }
}

class Country {
  var id;
  var continentId;
  Title? name;
  var description;
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
  var id;
  var countryId;
  var userId;
  Title? name;
  var description;
  var logoPath;
  var imagePath;
  var status;

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

class Hotels {
  var id;
  Title? title;
  var email;
  var phone;
  var late;
  var long;
  var imagePath;
  Title? description;
  Title? descriptionTwo;
  Title? accommodationPolicy;
  var branchId;
  var countryId;
  var cityId;
  var status;
  var isFavoriteCount;
  Country? country;
  Branch? branch;
  City? city;
  List<Rooms>? rooms;

  Hotels(
      {this.id,
        this.title,
        this.email,
        this.phone,
        this.late,
        this.long,
        this.imagePath,
        this.description,
        this.descriptionTwo,
        this.accommodationPolicy,
        this.branchId,
        this.countryId,
        this.cityId,
        this.status,
        this.isFavoriteCount,
        this.country,
        this.branch,
        this.city,
        this.rooms});

  Hotels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    email = json['email'];
    phone = json['phone'];
    late = json['late'];
    long = json['long'];
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
    isFavoriteCount = json['is_favorite_count'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
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
    data['long'] = this.long;
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
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  var id;
  var countryId;
  var branchId;
  Title? name;
  var description;
  var imagePath;
  var status;

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

class Rooms {
  var id;
  Title? title;
  var numberPerson;
  Title? description;
  var type;
  var price;
  var roomNumber;
  var imagePath;
  var status;
  var hotelId;

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
        this.hotelId});

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
    return data;
  }
}

class Academys {
  var id;
  var branchId;
  var countryId;
  var cityId;
  Title? title;
  Title? description;
  Title? descriptionTwo;
  var imagePath;
  var videoPath;
  var logoPath;
  var late;
  var lang;
  var status;
  Country? country;
  Branch? branch;
  City? city;

  Academys(
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
        this.branch,
        this.city});

  Academys.fromJson(Map<String, dynamic> json) {
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
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
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
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class Airports {
  var id;
  Title? title;
  var late;
  var lang;
  var status;
  var imagePath;
  var branchId;
  var countryId;
  var cityId;
  Country? country;
  Branch? branch;
  City? city;
  List<Tickets>? tickets;

  Airports(
      {this.id,
        this.title,
        this.late,
        this.lang,
        this.status,
        this.imagePath,
        this.branchId,
        this.countryId,
        this.cityId,
        this.country,
        this.branch,
        this.city,
        this.tickets});

  Airports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    late = json['late'];
    lang = json['lang'];
    status = json['status'];
    imagePath = json['image_path'];
    branchId = json['branch_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['late'] = this.late;
    data['lang'] = this.lang;
    data['status'] = this.status;
    data['image_path'] = this.imagePath;
    data['branch_id'] = this.branchId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickets {
  var id;
  Title? title;
  Title? description;
  var startDate;
  var endDate;
  var type;
  var startTime;
  var endTime;
  var price;
  var numberPerson;
  var status;
  var airportId;
  var userId;

  Tickets(
      {this.id,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.type,
        this.startTime,
        this.endTime,
        this.price,
        this.numberPerson,
        this.status,
        this.airportId,
        this.userId});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    type = json['type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    price = json['price'];
    numberPerson = json['number_person'];
    status = json['status'];
    airportId = json['airport_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['type'] = this.type;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['price'] = this.price;
    data['number_person'] = this.numberPerson;
    data['status'] = this.status;
    data['airport_id'] = this.airportId;
    data['user_id'] = this.userId;
    return data;
  }
}

class Packages {
  var id;
  var branchId;
  Title? title;
  var logoPath;
  var categoryId;
  var startDate;
  var endDate;
  Title? description;
  var price;
  var lat;
  var lang;
  var countryId;
  var cityId;
  var videoPath;
  var status;
  var createdAt;
  var updatedAt;
  Country? country;
  Branch? branch;
  City? city;

  Packages(
      {this.id,
        this.branchId,
        this.title,
        this.logoPath,
        this.categoryId,
        this.startDate,
        this.endDate,
        this.description,
        this.price,
        this.lat,
        this.lang,
        this.countryId,
        this.cityId,
        this.videoPath,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.country,
        this.branch,
        this.city});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchId = json['branch_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    logoPath = json['logo_path'];
    categoryId = json['category_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    price = json['price'];
    lat = json['lat'];
    lang = json['lang'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    videoPath = json['video_path'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    branch =
    json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_id'] = this.branchId;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['logo_path'] = this.logoPath;
    data['category_id'] = this.categoryId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['price'] = this.price;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['video_path'] = this.videoPath;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}
