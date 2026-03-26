class VisaDetailsModel {
   int? id;
   Title? title;
   var imageDescription;
   var salaryDescription;
   var accountStatementDescription;
   var fingerprintDescription;
   var durationDescription;
   var medicalInsuranceDescription;
   Description? description;
   int? visaId;

  VisaDetailsModel({
    this.id,
    this.title,
    this.imageDescription,
    this.salaryDescription,
    this.accountStatementDescription,
    this.fingerprintDescription,
    this.durationDescription,
    this.medicalInsuranceDescription,
    this.description,
    this.visaId,
  });

  // Factory constructor for parsing JSON
   factory VisaDetailsModel.fromJson(Map<String, dynamic> json) {
     return VisaDetailsModel(
       id: json['id'] as int?,
       title: json['title'] != null ? Title.fromJson(json['title']) : null,
       imageDescription: json['image_description']!= null ?json['image_description'] : null,
       salaryDescription: json['salary_description'] != null ? json['salary_description'] : null,
       accountStatementDescription: json['account_statement_description'] != null ? json['account_statement_description'] :null,
       fingerprintDescription: json['fingerprint_description'] != null ? json['fingerprint_description']: null,
       durationDescription: json['duration_description'] != null ? json['duration_description'] : null,
       medicalInsuranceDescription: json['medical_insurance_description'] != null ? json['medical_insurance_description'] : null,
       description: json['description'] != null ? Description.fromJson(json['description']) : null,
       visaId: json['visa_id'] as int?,
     );
   }


  // Method to convert model to JSON
   Map<String, dynamic> toJson() {
     return {
       'id': id,
       'title': title?.toJson(),
       'image_description': imageDescription,
       'salary_description': salaryDescription,
       'account_statement_description': accountStatementDescription,
       'fingerprint_description': fingerprintDescription,
       'duration_description': durationDescription,
       'medical_insurance_description': medicalInsuranceDescription,
       'description': description?.toJson(),
       'visa_id': visaId,
     };
   }

}

class Title {
   var en;
   var ar;

  Title({this.en, this.ar});

  // Factory constructor for parsing JSON
  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      en: json['en'] ,
      ar: json['ar'] ,
    );
  }

  // Method to convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
    };
  }
}
class Description {
   var en;
   var ar;

   Description({this.en, this.ar});

  // Factory constructor for parsing JSON
  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      en: json['en'],
      ar: json['ar'],
    );
  }

  // Method to convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'en': en,
      'ar': ar,
    };
  }
}
