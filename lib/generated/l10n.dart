// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Course Duration`
  String get courseDuration {
    return Intl.message(
      'Course Duration',
      name: 'courseDuration',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message('Course', name: 'course', desc: '', args: []);
  }

  /// `Booking`
  String get booking {
    return Intl.message('Booking', name: 'booking', desc: '', args: []);
  }

  /// `SAR`
  String get sar {
    return Intl.message('SAR', name: 'sar', desc: '', args: []);
  }

  /// `Chatting`
  String get chatting {
    return Intl.message('Chatting', name: 'chatting', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `No Internet`
  String get noInternet {
    return Intl.message('No Internet', name: 'noInternet', desc: '', args: []);
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `All our branches are ready to provide you with all services professionally. All our branch information will be provided below.`
  String get allOurBranchesAreYeadyFor {
    return Intl.message(
      'All our branches are ready to provide you with all services professionally. All our branch information will be provided below.',
      name: 'allOurBranchesAreYeadyFor',
      desc: '',
      args: [],
    );
  }

  /// `branches`
  String get branches {
    return Intl.message('branches', name: 'branches', desc: '', args: []);
  }

  /// `Government mission or at the expense of the employer`
  String get governmentMissionOrAtTheExpenseOfTheEmployer {
    return Intl.message(
      'Government mission or at the expense of the employer',
      name: 'governmentMissionOrAtTheExpenseOfTheEmployer',
      desc: '',
      args: [],
    );
  }

  /// `On the private account`
  String get onThePrivateAccount {
    return Intl.message(
      'On the private account',
      name: 'onThePrivateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Required specialization`
  String get requiredSpecialization {
    return Intl.message(
      'Required specialization',
      name: 'requiredSpecialization',
      desc: '',
      args: [],
    );
  }

  /// `What is your academic average for the last certificate you obtained?`
  String get whatIsYourAcademicAverage {
    return Intl.message(
      'What is your academic average for the last certificate you obtained?',
      name: 'whatIsYourAcademicAverage',
      desc: '',
      args: [],
    );
  }

  /// `weak`
  String get weak {
    return Intl.message('weak', name: 'weak', desc: '', args: []);
  }

  /// `Acceptable`
  String get acceptable {
    return Intl.message('Acceptable', name: 'acceptable', desc: '', args: []);
  }

  /// `very good`
  String get veryGood {
    return Intl.message('very good', name: 'veryGood', desc: '', args: []);
  }

  /// `good`
  String get good {
    return Intl.message('good', name: 'good', desc: '', args: []);
  }

  /// `Excellent`
  String get excellent {
    return Intl.message('Excellent', name: 'excellent', desc: '', args: []);
  }

  /// `Your academic average`
  String get academicAverage {
    return Intl.message(
      'Your academic average',
      name: 'academicAverage',
      desc: '',
      args: [],
    );
  }

  /// `No reservations`
  String get noReservations {
    return Intl.message(
      'No reservations',
      name: 'noReservations',
      desc: '',
      args: [],
    );
  }

  /// `pm`
  String get pm {
    return Intl.message('pm', name: 'pm', desc: '', args: []);
  }

  /// `am`
  String get am {
    return Intl.message('am', name: 'am', desc: '', args: []);
  }

  /// `What is your preferred call time?`
  String get whatIsYourPreferredCallTime {
    return Intl.message(
      'What is your preferred call time?',
      name: 'whatIsYourPreferredCallTime',
      desc: '',
      args: [],
    );
  }

  /// `How to pay tuition fees`
  String get howtoPayTuitionFees {
    return Intl.message(
      'How to pay tuition fees',
      name: 'howtoPayTuitionFees',
      desc: '',
      args: [],
    );
  }

  /// `nationality`
  String get nationality {
    return Intl.message('nationality', name: 'nationality', desc: '', args: []);
  }

  /// `Choose the country you want to study in`
  String get chooseTheCountryYouWantToStudy {
    return Intl.message(
      'Choose the country you want to study in',
      name: 'chooseTheCountryYouWantToStudy',
      desc: '',
      args: [],
    );
  }

  /// `Book Flight`
  String get bookFlight {
    return Intl.message('Book Flight', name: 'bookFlight', desc: '', args: []);
  }

  /// `Book Hotel & Flight`
  String get bookHotelAndFlight {
    return Intl.message(
      'Book Hotel & Flight',
      name: 'bookHotelAndFlight',
      desc: '',
      args: [],
    );
  }

  /// `Book a hotel`
  String get bookHotel {
    return Intl.message('Book a hotel', name: 'bookHotel', desc: '', args: []);
  }

  /// `Embassy Form`
  String get embassyForm {
    return Intl.message(
      'Embassy Form',
      name: 'embassyForm',
      desc: '',
      args: [],
    );
  }

  /// `Type of form to be filled?`
  String get typeOfFormToBeFilled {
    return Intl.message(
      'Type of form to be filled?',
      name: 'typeOfFormToBeFilled',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thankYou {
    return Intl.message('Thank you', name: 'thankYou', desc: '', args: []);
  }

  /// `Your request has been submitted successfully, you will be contacted soon`
  String get submitSuccess {
    return Intl.message(
      'Your request has been submitted successfully, you will be contacted soon',
      name: 'submitSuccess',
      desc: '',
      args: [],
    );
  }

  /// `By Submitting, you agree to our Terms & Conditions. Submit Now !`
  String get bySubmitService {
    return Intl.message(
      'By Submitting, you agree to our Terms & Conditions. Submit Now !',
      name: 'bySubmitService',
      desc: '',
      args: [],
    );
  }

  /// `Cost will be decided after one of our travel consultants contacts you`
  String get costWillBeDecided {
    return Intl.message(
      'Cost will be decided after one of our travel consultants contacts you',
      name: 'costWillBeDecided',
      desc: '',
      args: [],
    );
  }

  /// `Service Cost`
  String get serviceCost {
    return Intl.message(
      'Service Cost',
      name: 'serviceCost',
      desc: '',
      args: [],
    );
  }

  /// `Select the country for the worker`
  String get selectTheCountryForTheWorker {
    return Intl.message(
      'Select the country for the worker',
      name: 'selectTheCountryForTheWorker',
      desc: '',
      args: [],
    );
  }

  /// `Select Country for Resident`
  String get selectCountryForResident {
    return Intl.message(
      'Select Country for Resident',
      name: 'selectCountryForResident',
      desc: '',
      args: [],
    );
  }

  /// `How would you like to receive the license?`
  String get howWouldYouLikeToReceiveTheLicense {
    return Intl.message(
      'How would you like to receive the license?',
      name: 'howWouldYouLikeToReceiveTheLicense',
      desc: '',
      args: [],
    );
  }

  /// `Number of international license cards required`
  String get numberInternationalLicenseCardsRequired {
    return Intl.message(
      'Number of international license cards required',
      name: 'numberInternationalLicenseCardsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Where you want to take the test (select a city)`
  String get whereyouWantTest {
    return Intl.message(
      'Where you want to take the test (select a city)',
      name: 'whereyouWantTest',
      desc: '',
      args: [],
    );
  }

  /// `Reception Date`
  String get receptionDate {
    return Intl.message(
      'Reception Date',
      name: 'receptionDate',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message('Day', name: 'day', desc: '', args: []);
  }

  /// `Flight duration in days`
  String get flightDurationDays {
    return Intl.message(
      'Flight duration in days',
      name: 'flightDurationDays',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `General Course`
  String get generalCourse {
    return Intl.message(
      'General Course',
      name: 'generalCourse',
      desc: '',
      args: [],
    );
  }

  /// `Registration fees`
  String get registrationFees {
    return Intl.message(
      'Registration fees',
      name: 'registrationFees',
      desc: '',
      args: [],
    );
  }

  /// `Total costs`
  String get totalCosts {
    return Intl.message('Total costs', name: 'totalCosts', desc: '', args: []);
  }

  /// `Send Now`
  String get sendNow {
    return Intl.message('Send Now', name: 'sendNow', desc: '', args: []);
  }

  /// `country`
  String get country {
    return Intl.message('country', name: 'country', desc: '', args: []);
  }

  /// `Official papers (birth certificate, marriage contract ...)`
  String get officialPapers {
    return Intl.message(
      'Official papers (birth certificate, marriage contract ...)',
      name: 'officialPapers',
      desc: '',
      args: [],
    );
  }

  /// `University Research`
  String get universityResearch {
    return Intl.message(
      'University Research',
      name: 'universityResearch',
      desc: '',
      args: [],
    );
  }

  /// `Legal Documents`
  String get legalDocuments {
    return Intl.message(
      'Legal Documents',
      name: 'legalDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Medical report`
  String get medicalReport {
    return Intl.message(
      'Medical report',
      name: 'medicalReport',
      desc: '',
      args: [],
    );
  }

  /// `Salary definition`
  String get salaryDefinition {
    return Intl.message(
      'Salary definition',
      name: 'salaryDefinition',
      desc: '',
      args: [],
    );
  }

  /// `Content to be translated`
  String get contentToBeTranslated {
    return Intl.message(
      'Content to be translated',
      name: 'contentToBeTranslated',
      desc: '',
      args: [],
    );
  }

  /// `Type of content to translate`
  String get typeOfContentToTranslate {
    return Intl.message(
      'Type of content to translate',
      name: 'typeOfContentToTranslate',
      desc: '',
      args: [],
    );
  }

  /// `Attach the file to be translated (optional)`
  String get attachTheFileToBeTranslated {
    return Intl.message(
      'Attach the file to be translated (optional)',
      name: 'attachTheFileToBeTranslated',
      desc: '',
      args: [],
    );
  }

  /// `Approximate number of pages`
  String get approximateNumberOfPages {
    return Intl.message(
      'Approximate number of pages',
      name: 'approximateNumberOfPages',
      desc: '',
      args: [],
    );
  }

  /// `Number of Passports`
  String get numberOfPassports {
    return Intl.message(
      'Number of Passports',
      name: 'numberOfPassports',
      desc: '',
      args: [],
    );
  }

  /// `Valid vehicle license (form)`
  String get validVehicleLicense {
    return Intl.message(
      'Valid vehicle license (form)',
      name: 'validVehicleLicense',
      desc: '',
      args: [],
    );
  }

  /// `Click here to select the file`
  String get selectFile {
    return Intl.message(
      'Click here to select the file',
      name: 'selectFile',
      desc: '',
      args: [],
    );
  }

  /// `Valid driver's license`
  String get validDriverLicense {
    return Intl.message(
      'Valid driver\'s license',
      name: 'validDriverLicense',
      desc: '',
      args: [],
    );
  }

  /// `I don't have a certificate`
  String get iDonotHaveACertificate {
    return Intl.message(
      'I don\'t have a certificate',
      name: 'iDonotHaveACertificate',
      desc: '',
      args: [],
    );
  }

  /// `do You Have?`
  String get doYouHave {
    return Intl.message('do You Have?', name: 'doYouHave', desc: '', args: []);
  }

  /// `Do you have a TOEFL or IELTS certificate?`
  String get doYouHaveATOEFLOrIELTSCertificate {
    return Intl.message(
      'Do you have a TOEFL or IELTS certificate?',
      name: 'doYouHaveATOEFLOrIELTSCertificate',
      desc: '',
      args: [],
    );
  }

  /// `secondary`
  String get secondary {
    return Intl.message('secondary', name: 'secondary', desc: '', args: []);
  }

  /// `Bachelor`
  String get bachelor {
    return Intl.message('Bachelor', name: 'bachelor', desc: '', args: []);
  }

  /// `Master`
  String get master {
    return Intl.message('Master', name: 'master', desc: '', args: []);
  }

  /// `qualification`
  String get qualification {
    return Intl.message(
      'qualification',
      name: 'qualification',
      desc: '',
      args: [],
    );
  }

  /// `What is your current qualification?`
  String get currentQualification {
    return Intl.message(
      'What is your current qualification?',
      name: 'currentQualification',
      desc: '',
      args: [],
    );
  }

  /// `Provider Name`
  String get providerName {
    return Intl.message(
      'Provider Name',
      name: 'providerName',
      desc: '',
      args: [],
    );
  }

  /// `Pick-up date`
  String get pickupDate {
    return Intl.message('Pick-up date', name: 'pickupDate', desc: '', args: []);
  }

  /// `Place of delivery`
  String get placeOfDelivery {
    return Intl.message(
      'Place of delivery',
      name: 'placeOfDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Place of pick-up`
  String get placeOfPickup {
    return Intl.message(
      'Place of pick-up',
      name: 'placeOfPickup',
      desc: '',
      args: [],
    );
  }

  /// `Reception only`
  String get receptionOnly {
    return Intl.message(
      'Reception only',
      name: 'receptionOnly',
      desc: '',
      args: [],
    );
  }

  /// `Reception and farewell`
  String get receptionAndFarewell {
    return Intl.message(
      'Reception and farewell',
      name: 'receptionAndFarewell',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message('Service', name: 'service', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `rated`
  String get rated {
    return Intl.message('rated', name: 'rated', desc: '', args: []);
  }

  /// `Agents of the most prestigious international hotelsn Your journey to learn English starts here`
  String get agentsOfTheMostPrestigious {
    return Intl.message(
      'Agents of the most prestigious international hotelsn Your journey to learn English starts here',
      name: 'agentsOfTheMostPrestigious',
      desc: '',
      args: [],
    );
  }

  /// `payment way`
  String get paymentWay {
    return Intl.message('payment way', name: 'paymentWay', desc: '', args: []);
  }

  /// `top Rated`
  String get topRated {
    return Intl.message('top Rated', name: 'topRated', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Rooms`
  String get rooms {
    return Intl.message('Rooms', name: 'rooms', desc: '', args: []);
  }

  /// `Accommodation Policy`
  String get accommodationPolicy {
    return Intl.message(
      'Accommodation Policy',
      name: 'accommodationPolicy',
      desc: '',
      args: [],
    );
  }

  /// `All Information`
  String get allInfo {
    return Intl.message('All Information', name: 'allInfo', desc: '', args: []);
  }

  /// `Utilities`
  String get utilities {
    return Intl.message('Utilities', name: 'utilities', desc: '', args: []);
  }

  /// `Accommodation Photos`
  String get accommodationPhotos {
    return Intl.message(
      'Accommodation Photos',
      name: 'accommodationPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Number of rooms`
  String get numberOfRooms {
    return Intl.message(
      'Number of rooms',
      name: 'numberOfRooms',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date`
  String get departureDate {
    return Intl.message(
      'Departure Date',
      name: 'departureDate',
      desc: '',
      args: [],
    );
  }

  /// `Arrived Date`
  String get arrivedDate {
    return Intl.message(
      'Arrived Date',
      name: 'arrivedDate',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete`
  String get areYouSureToDelete {
    return Intl.message(
      'Are you sure to delete',
      name: 'areYouSureToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure`
  String get areYouSure {
    return Intl.message('Are you sure', name: 'areYouSure', desc: '', args: []);
  }

  /// `address`
  String get address {
    return Intl.message('address', name: 'address', desc: '', args: []);
  }

  /// `edit`
  String get edit {
    return Intl.message('edit', name: 'edit', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `ME`
  String get me {
    return Intl.message('ME', name: 'me', desc: '', args: []);
  }

  /// `message`
  String get message {
    return Intl.message('message', name: 'message', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `About App`
  String get aboutApp {
    return Intl.message('About App', name: 'aboutApp', desc: '', args: []);
  }

  /// `Update App`
  String get updateApp {
    return Intl.message('Update App', name: 'updateApp', desc: '', args: []);
  }

  /// `Terms Of Usage`
  String get termsOfUsage {
    return Intl.message(
      'Terms Of Usage',
      name: 'termsOfUsage',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message('Legal', name: 'legal', desc: '', args: []);
  }

  /// `Send message`
  String get sendMessage {
    return Intl.message(
      'Send message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `My Booking`
  String get myBooking {
    return Intl.message('My Booking', name: 'myBooking', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `notifications`
  String get notifications {
    return Intl.message(
      'notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message('language', name: 'language', desc: '', args: []);
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `credits`
  String get credits {
    return Intl.message('credits', name: 'credits', desc: '', args: []);
  }

  /// `my Account`
  String get myAccount {
    return Intl.message('my Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Hello, `
  String get hello {
    return Intl.message('Hello, ', name: 'hello', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `1. Definitions and Key Terms\n\nAffiliated Companies: Any person or entity which directly or indirectly controls, is controlled by, or is under common control with Rehlatyuae, whether by ownership or otherwise.\n\nCookie(s): Small amount of data generated by a website and saved by your browser that enables us to identify your browser, use analytics, and remember information about you such as your language preferences or login information.\n\nCompany: The entity responsible for your information under this privacy policy, Rehlatyuae, may be referenced in this document as “company”, “we”, “us”, or “our”. It refers to TRIPXTOURS DMCC, Mazaya Business Avenue BB2, Jumeirah Lake Towers, Dubai, United Arab Emirates.\n\nDevice: Phones, tablets, computers, or any other internet-connected device that is or can be used to visit and use the Rehlatyuae website or the services it provides.\n\nIP Address: Every device connected to the Internet is assigned a number known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet.\n\nPersonnel: Individuals employed by or under contract with Rehlatyuae to perform a service on behalf of one of the parties.\n\nPersonal Data: Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.\n\nService(s): The provision of information, recommendations, and services related to travel and leisure, including tools for researching and/or booking attractions, experiences, dining, tours, and cruises, among other leisure-related services.\n\nService Providers: The sellers listed on Thrillark's Platform including affiliates and other business partners.\n\nThird Parties: Advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.\n\nWebsite: www.thrillark.com\n\nYou/Your: The end-user.`
  String get termScreenContain {
    return Intl.message(
      '1. Definitions and Key Terms\n\nAffiliated Companies: Any person or entity which directly or indirectly controls, is controlled by, or is under common control with Rehlatyuae, whether by ownership or otherwise.\n\nCookie(s): Small amount of data generated by a website and saved by your browser that enables us to identify your browser, use analytics, and remember information about you such as your language preferences or login information.\n\nCompany: The entity responsible for your information under this privacy policy, Rehlatyuae, may be referenced in this document as “company”, “we”, “us”, or “our”. It refers to TRIPXTOURS DMCC, Mazaya Business Avenue BB2, Jumeirah Lake Towers, Dubai, United Arab Emirates.\n\nDevice: Phones, tablets, computers, or any other internet-connected device that is or can be used to visit and use the Rehlatyuae website or the services it provides.\n\nIP Address: Every device connected to the Internet is assigned a number known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet.\n\nPersonnel: Individuals employed by or under contract with Rehlatyuae to perform a service on behalf of one of the parties.\n\nPersonal Data: Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.\n\nService(s): The provision of information, recommendations, and services related to travel and leisure, including tools for researching and/or booking attractions, experiences, dining, tours, and cruises, among other leisure-related services.\n\nService Providers: The sellers listed on Thrillark\'s Platform including affiliates and other business partners.\n\nThird Parties: Advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.\n\nWebsite: www.thrillark.com\n\nYou/Your: The end-user.',
      name: 'termScreenContain',
      desc: '',
      args: [],
    );
  }

  /// `1. Definitions and Key Terms\n\nAffiliated Companies: Any person or entity which directly or indirectly controls, is controlled by, or is under common control with Rehlatyuae, whether by ownership or otherwise.\n\nCookie(s): Small amount of data generated by a website and saved by your browser that enables us to identify your browser, use analytics, and remember information about you such as your language preferences or login information.\n\nCompany: The entity responsible for your information under this privacy policy, Rehlatyuae, may be referenced in this document as “company”, “we”, “us”, or “our”. It refers to TRIPXTOURS DMCC, Mazaya Business Avenue BB2, Jumeirah Lake Towers, Dubai, United Arab Emirates.\n\nDevice: Phones, tablets, computers, or any other internet-connected device that is or can be used to visit and use the Rehlatyuae website or the services it provides.\n\nIP Address: Every device connected to the Internet is assigned a number known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet.\n\nPersonnel: Individuals employed by or under contract with Rehlatyuae to perform a service on behalf of one of the parties.\n\nPersonal Data: Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.\n\nService(s): The provision of information, recommendations, and services related to travel and leisure, including tools for researching and/or booking attractions, experiences, dining, tours, and cruises, among other leisure-related services.\n\nService Providers: The sellers listed on Thrillark's Platform including affiliates and other business partners.\n\nThird Parties: Advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.\n\nWebsite: www.thrillark.com\n\nYou/Your: The end-user.`
  String get privacyScreenContain {
    return Intl.message(
      '1. Definitions and Key Terms\n\nAffiliated Companies: Any person or entity which directly or indirectly controls, is controlled by, or is under common control with Rehlatyuae, whether by ownership or otherwise.\n\nCookie(s): Small amount of data generated by a website and saved by your browser that enables us to identify your browser, use analytics, and remember information about you such as your language preferences or login information.\n\nCompany: The entity responsible for your information under this privacy policy, Rehlatyuae, may be referenced in this document as “company”, “we”, “us”, or “our”. It refers to TRIPXTOURS DMCC, Mazaya Business Avenue BB2, Jumeirah Lake Towers, Dubai, United Arab Emirates.\n\nDevice: Phones, tablets, computers, or any other internet-connected device that is or can be used to visit and use the Rehlatyuae website or the services it provides.\n\nIP Address: Every device connected to the Internet is assigned a number known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks. An IP address can often be used to identify the location from which a device is connecting to the Internet.\n\nPersonnel: Individuals employed by or under contract with Rehlatyuae to perform a service on behalf of one of the parties.\n\nPersonal Data: Any information that directly, indirectly, or in connection with other information — including a personal identification number — allows for the identification or identifiability of a natural person.\n\nService(s): The provision of information, recommendations, and services related to travel and leisure, including tools for researching and/or booking attractions, experiences, dining, tours, and cruises, among other leisure-related services.\n\nService Providers: The sellers listed on Thrillark\'s Platform including affiliates and other business partners.\n\nThird Parties: Advertisers, contest sponsors, promotional and marketing partners, and others who provide our content or whose products or services we think may interest you.\n\nWebsite: www.thrillark.com\n\nYou/Your: The end-user.',
      name: 'privacyScreenContain',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message('Cost', name: 'cost', desc: '', args: []);
  }

  /// `3 Hours`
  String get threeHours {
    return Intl.message('3 Hours', name: 'threeHours', desc: '', args: []);
  }

  /// `Travel Duration`
  String get travelDuration {
    return Intl.message(
      'Travel Duration',
      name: 'travelDuration',
      desc: '',
      args: [],
    );
  }

  /// `The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to`
  String get mightlyRenjani {
    return Intl.message(
      'The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to',
      name: 'mightlyRenjani',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message('FAQ', name: 'faq', desc: '', args: []);
  }

  /// `Here you will find all the most frequently asked questions that roam your mind! We are glad to serve you our valued customer.`
  String get hereYouWillFindAllTheMostFrequently {
    return Intl.message(
      'Here you will find all the most frequently asked questions that roam your mind! We are glad to serve you our valued customer.',
      name: 'hereYouWillFindAllTheMostFrequently',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Did you get a driver's license?`
  String get didYouGetADriverLicense {
    return Intl.message(
      'Did you get a driver\'s license?',
      name: 'didYouGetADriverLicense',
      desc: '',
      args: [],
    );
  }

  /// `Period Stay`
  String get periodStay {
    return Intl.message('Period Stay', name: 'periodStay', desc: '', args: []);
  }

  /// `Have you ever traveled to America?`
  String get haveYouEverTraveledToAmerica {
    return Intl.message(
      'Have you ever traveled to America?',
      name: 'haveYouEverTraveledToAmerica',
      desc: '',
      args: [],
    );
  }

  /// `Country Visa Image`
  String get countryVisaImage {
    return Intl.message(
      'Country Visa Image',
      name: 'countryVisaImage',
      desc: '',
      args: [],
    );
  }

  /// `Have you ever obtained a visa to America before?`
  String get haveYouEverObtainedAVisaToAmericaBefore {
    return Intl.message(
      'Have you ever obtained a visa to America before?',
      name: 'haveYouEverObtainedAVisaToAmericaBefore',
      desc: '',
      args: [],
    );
  }

  /// `Attach a personal photo (as specified in the visa requirements)*`
  String get attachAPersonalPhoto {
    return Intl.message(
      'Attach a personal photo (as specified in the visa requirements)*',
      name: 'attachAPersonalPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Add Attachment`
  String get addAttachment {
    return Intl.message(
      'Add Attachment',
      name: 'addAttachment',
      desc: '',
      args: [],
    );
  }

  /// `Attach a photo of the traveler's passport*`
  String get attachAPhotoOfPasport {
    return Intl.message(
      'Attach a photo of the traveler\'s passport*',
      name: 'attachAPhotoOfPasport',
      desc: '',
      args: [],
    );
  }

  /// `Mother Nationality`
  String get motherNationality {
    return Intl.message(
      'Mother Nationality',
      name: 'motherNationality',
      desc: '',
      args: [],
    );
  }

  /// `Mother's data`
  String get motherData {
    return Intl.message(
      'Mother\'s data',
      name: 'motherData',
      desc: '',
      args: [],
    );
  }

  /// `First Mother Name`
  String get firstMotherName {
    return Intl.message(
      'First Mother Name',
      name: 'firstMotherName',
      desc: '',
      args: [],
    );
  }

  /// `Last Mother Name`
  String get lastMotherName {
    return Intl.message(
      'Last Mother Name',
      name: 'lastMotherName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Personal Information (Arabic or English)`
  String get personalInfo {
    return Intl.message(
      'Personal Information (Arabic or English)',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all information as stated in the legal documents.`
  String get pleaseFillDocument {
    return Intl.message(
      'Please fill in all information as stated in the legal documents.',
      name: 'pleaseFillDocument',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Attach a Salary Image photo (as specified in the visa requirements)*`
  String get attachASalary {
    return Intl.message(
      'Attach a Salary Image photo (as specified in the visa requirements)*',
      name: 'attachASalary',
      desc: '',
      args: [],
    );
  }

  /// `Salary Image`
  String get salaryImage {
    return Intl.message(
      'Salary Image',
      name: 'salaryImage',
      desc: '',
      args: [],
    );
  }

  /// `Attach a Account Statement photo (as specified in the visa requirements`
  String get attachAAccountStatement {
    return Intl.message(
      'Attach a Account Statement photo (as specified in the visa requirements',
      name: 'attachAAccountStatement',
      desc: '',
      args: [],
    );
  }

  /// `Account Statement`
  String get accountStatement {
    return Intl.message(
      'Account Statement',
      name: 'accountStatement',
      desc: '',
      args: [],
    );
  }

  /// `owner of the account statement`
  String get ownerOfTheAccountStatement {
    return Intl.message(
      'owner of the account statement',
      name: 'ownerOfTheAccountStatement',
      desc: '',
      args: [],
    );
  }

  /// `From the owner of the account statement and the definition of expenses?`
  String get fromTheOwnerOfTheAccount {
    return Intl.message(
      'From the owner of the account statement and the definition of expenses?',
      name: 'fromTheOwnerOfTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct information for Sponsor Data.`
  String get pleaseEnterCorrectInformationForSponsorData {
    return Intl.message(
      'Please enter correct information for Sponsor Data.',
      name: 'pleaseEnterCorrectInformationForSponsorData',
      desc: '',
      args: [],
    );
  }

  /// `Expenses Sponsor Data`
  String get expensesSponsorData {
    return Intl.message(
      'Expenses Sponsor Data',
      name: 'expensesSponsorData',
      desc: '',
      args: [],
    );
  }

  /// `father`
  String get father {
    return Intl.message('father', name: 'father', desc: '', args: []);
  }

  /// `mother`
  String get mother {
    return Intl.message('mother', name: 'mother', desc: '', args: []);
  }

  /// `son`
  String get son {
    return Intl.message('son', name: 'son', desc: '', args: []);
  }

  /// `daughter`
  String get daughter {
    return Intl.message('daughter', name: 'daughter', desc: '', args: []);
  }

  /// `brother`
  String get brother {
    return Intl.message('brother', name: 'brother', desc: '', args: []);
  }

  /// `sister`
  String get sister {
    return Intl.message('sister', name: 'sister', desc: '', args: []);
  }

  /// `relatives`
  String get relatives {
    return Intl.message('relatives', name: 'relatives', desc: '', args: []);
  }

  /// `relatives living in country`
  String get relativesLivingInCountry {
    return Intl.message(
      'relatives living in country',
      name: 'relativesLivingInCountry',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get singleOr {
    return Intl.message('Single', name: 'singleOr', desc: '', args: []);
  }

  /// `Married`
  String get marriedOr {
    return Intl.message('Married', name: 'marriedOr', desc: '', args: []);
  }

  /// `marital status`
  String get maritalStatus {
    return Intl.message(
      'marital status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Add Country`
  String get addCountry {
    return Intl.message('Add Country', name: 'addCountry', desc: '', args: []);
  }

  /// `the year`
  String get year {
    return Intl.message('the year', name: 'year', desc: '', args: []);
  }

  /// `Select the Country`
  String get selectCountry {
    return Intl.message(
      'Select the Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Enter Reason`
  String get enterReason {
    return Intl.message(
      'Enter Reason',
      name: 'enterReason',
      desc: '',
      args: [],
    );
  }

  /// `Explain`
  String get explain {
    return Intl.message('Explain', name: 'explain', desc: '', args: []);
  }

  /// `denied or cancelled?`
  String get deniedOrCancelled {
    return Intl.message(
      'denied or cancelled?',
      name: 'deniedOrCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Have you ever had your US visa denied or cancelled?`
  String get haveYouEverHadYourUSVisaDeniedOrCancelled {
    return Intl.message(
      'Have you ever had your US visa denied or cancelled?',
      name: 'haveYouEverHadYourUSVisaDeniedOrCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct information for all passengers.`
  String get pleaseEnterCorrectInformationForAllPassengers {
    return Intl.message(
      'Please enter correct information for all passengers.',
      name: 'pleaseEnterCorrectInformationForAllPassengers',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Information`
  String get passengerInformation {
    return Intl.message(
      'Passenger Information',
      name: 'passengerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Saved Successfully`
  String get saveSuccessfully {
    return Intl.message(
      'Saved Successfully',
      name: 'saveSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get totalPrice {
    return Intl.message('Total Price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Travel history and number of passengers`
  String get travelHistoryAndNumberOfPassengers {
    return Intl.message(
      'Travel history and number of passengers',
      name: 'travelHistoryAndNumberOfPassengers',
      desc: '',
      args: [],
    );
  }

  /// `Country and type of visa`
  String get countryAndTypeOfVisa {
    return Intl.message(
      'Country and type of visa',
      name: 'countryAndTypeOfVisa',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `No Data Found`
  String get noDataFound {
    return Intl.message(
      'No Data Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Price includes: Embassy fees, appointment, service and tax.`
  String get priceIncludes {
    return Intl.message(
      'Price includes: Embassy fees, appointment, service and tax.',
      name: 'priceIncludes',
      desc: '',
      args: [],
    );
  }

  /// `Next Step`
  String get nextStep {
    return Intl.message('Next Step', name: 'nextStep', desc: '', args: []);
  }

  /// `Your Coupon!`
  String get coupon {
    return Intl.message('Your Coupon!', name: 'coupon', desc: '', args: []);
  }

  /// `You Have Coupon!`
  String get haveCoupon {
    return Intl.message(
      'You Have Coupon!',
      name: 'haveCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get adult {
    return Intl.message('Adult', name: 'adult', desc: '', args: []);
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Under 6 yrs`
  String get underyrs {
    return Intl.message('Under 6 yrs', name: 'underyrs', desc: '', args: []);
  }

  /// `Above 6 yrs`
  String get aboveyrs {
    return Intl.message('Above 6 yrs', name: 'aboveyrs', desc: '', args: []);
  }

  /// `Select Number of ticket`
  String get numberOfTickets {
    return Intl.message(
      'Select Number of ticket',
      name: 'numberOfTickets',
      desc: '',
      args: [],
    );
  }

  /// `The desired city`
  String get neededCity {
    return Intl.message(
      'The desired city',
      name: 'neededCity',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want the interview place?`
  String get interviewPlace {
    return Intl.message(
      'Where do you want the interview place?',
      name: 'interviewPlace',
      desc: '',
      args: [],
    );
  }

  /// `travel date`
  String get travelDate {
    return Intl.message('travel date', name: 'travelDate', desc: '', args: []);
  }

  /// `What is your expected travel date?`
  String get whatIsYourExpectedTravelDate {
    return Intl.message(
      'What is your expected travel date?',
      name: 'whatIsYourExpectedTravelDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Visa Type`
  String get selectVisaType {
    return Intl.message(
      'Select Visa Type',
      name: 'selectVisaType',
      desc: '',
      args: [],
    );
  }

  /// `Embassy requires an interview with all travelers.`
  String get empassyRequire {
    return Intl.message(
      'Embassy requires an interview with all travelers.',
      name: 'empassyRequire',
      desc: '',
      args: [],
    );
  }

  /// `You can submit your visa application now. The required documents must be prepared two or three days before the fingerprint appointment.`
  String get youCanSubmitVisa {
    return Intl.message(
      'You can submit your visa application now. The required documents must be prepared two or three days before the fingerprint appointment.',
      name: 'youCanSubmitVisa',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Visa Type`
  String get visaType {
    return Intl.message('Visa Type', name: 'visaType', desc: '', args: []);
  }

  /// `Required Service`
  String get requiredService {
    return Intl.message(
      'Required Service',
      name: 'requiredService',
      desc: '',
      args: [],
    );
  }

  /// `Saudi`
  String get saudi {
    return Intl.message('Saudi', name: 'saudi', desc: '', args: []);
  }

  /// `What really distinguishes us is that you will be followed by the experts organizing us in order to help you with everything Don't worry, tell us where your next destination is and leave the rest of the things to us. We will guide you to our best innovative solutions.`
  String get reallyDistinguishes {
    return Intl.message(
      'What really distinguishes us is that you will be followed by the experts organizing us in order to help you with everything Don\'t worry, tell us where your next destination is and leave the rest of the things to us. We will guide you to our best innovative solutions.',
      name: 'reallyDistinguishes',
      desc: '',
      args: [],
    );
  }

  /// `Distinguished experts with you`
  String get distinguishedExperts {
    return Intl.message(
      'Distinguished experts with you',
      name: 'distinguishedExperts',
      desc: '',
      args: [],
    );
  }

  /// `Choose from a range of leading airlines of over 490 airlines, from low-cost to luxury aviation. Whatever your needs, we have you covered.`
  String get chooseFromRangeOfLeading {
    return Intl.message(
      'Choose from a range of leading airlines of over 490 airlines, from low-cost to luxury aviation. Whatever your needs, we have you covered.',
      name: 'chooseFromRangeOfLeading',
      desc: '',
      args: [],
    );
  }

  /// `Variety of airlines`
  String get varietyOfAirlines {
    return Intl.message(
      'Variety of airlines',
      name: 'varietyOfAirlines',
      desc: '',
      args: [],
    );
  }

  /// `Booking is easier than ever! Enjoy multiple payment options and the ability to easily amend or cancel your booking. Let us make your next trip an unforgettable experience.`
  String get bookIsEasy {
    return Intl.message(
      'Booking is easier than ever! Enjoy multiple payment options and the ability to easily amend or cancel your booking. Let us make your next trip an unforgettable experience.',
      name: 'bookIsEasy',
      desc: '',
      args: [],
    );
  }

  /// `Easy booking, quick confirmation`
  String get easyBookingQuickConfirmation {
    return Intl.message(
      'Easy booking, quick confirmation',
      name: 'easyBookingQuickConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `A very unique and innovative way to inquire about the best bookings and services. Don't forget that our prices won't change in the coming days.`
  String get unique {
    return Intl.message(
      'A very unique and innovative way to inquire about the best bookings and services. Don\'t forget that our prices won\'t change in the coming days.',
      name: 'unique',
      desc: '',
      args: [],
    );
  }

  /// `Lowest prices and bookings`
  String get lowestPricesAndBookings {
    return Intl.message(
      'Lowest prices and bookings',
      name: 'lowestPricesAndBookings',
      desc: '',
      args: [],
    );
  }

  /// `Why Choose Us`
  String get whyChooseUs {
    return Intl.message(
      'Why Choose Us',
      name: 'whyChooseUs',
      desc: '',
      args: [],
    );
  }

  /// `Trust We`
  String get trustWe {
    return Intl.message('Trust We', name: 'trustWe', desc: '', args: []);
  }

  /// `Save Money`
  String get saveMoney {
    return Intl.message('Save Money', name: 'saveMoney', desc: '', args: []);
  }

  /// `Quick booking`
  String get quickBooking {
    return Intl.message(
      'Quick booking',
      name: 'quickBooking',
      desc: '',
      args: [],
    );
  }

  /// `Safety We`
  String get safetyWe {
    return Intl.message('Safety We', name: 'safetyWe', desc: '', args: []);
  }

  /// `When we say that`
  String get whenWeSayThat {
    return Intl.message(
      'When we say that',
      name: 'whenWeSayThat',
      desc: '',
      args: [],
    );
  }

  /// `We Help You Make Best Trip`
  String get weHelpYouMakeBestTrip {
    return Intl.message(
      'We Help You Make Best Trip',
      name: 'weHelpYouMakeBestTrip',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint Description`
  String get fingerDescription {
    return Intl.message(
      'Fingerprint Description',
      name: 'fingerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get notFount {
    return Intl.message('Not Found', name: 'notFount', desc: '', args: []);
  }

  /// `Duration Description`
  String get durationDescription {
    return Intl.message(
      'Duration Description',
      name: 'durationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance Description`
  String get medicalInsuranceDescription {
    return Intl.message(
      'Medical Insurance Description',
      name: 'medicalInsuranceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Visas Requirments`
  String get visasRequirments {
    return Intl.message(
      'Visas Requirments',
      name: 'visasRequirments',
      desc: '',
      args: [],
    );
  }

  /// `Copyright ©2024. All Rights Reserved. —  by visa`
  String get copyRight {
    return Intl.message(
      'Copyright ©2024. All Rights Reserved. —  by visa',
      name: 'copyRight',
      desc: '',
      args: [],
    );
  }

  /// `Free Visa Consultation`
  String get freeVisaConsultation {
    return Intl.message(
      'Free Visa Consultation',
      name: 'freeVisaConsultation',
      desc: '',
      args: [],
    );
  }

  /// `CREATE SUCCESSFULLY`
  String get createSuccessfully {
    return Intl.message(
      'CREATE SUCCESSFULLY',
      name: 'createSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `IMG Worlds of Adventure`
  String get imgWorldsOfAdventure {
    return Intl.message(
      'IMG Worlds of Adventure',
      name: 'imgWorldsOfAdventure',
      desc: '',
      args: [],
    );
  }

  /// `Discover The Best Hotels`
  String get discoverTheBestHotels {
    return Intl.message(
      'Discover The Best Hotels',
      name: 'discoverTheBestHotels',
      desc: '',
      args: [],
    );
  }

  /// `Discover The Best Visas`
  String get discoverTheBestVisas {
    return Intl.message(
      'Discover The Best Visas',
      name: 'discoverTheBestVisas',
      desc: '',
      args: [],
    );
  }

  /// `Discover The Best Services`
  String get discoverTheBestServices {
    return Intl.message(
      'Discover The Best Services',
      name: 'discoverTheBestServices',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Visas`
  String get visas {
    return Intl.message('Visas', name: 'visas', desc: '', args: []);
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `Academics`
  String get academics {
    return Intl.message('Academics', name: 'academics', desc: '', args: []);
  }

  /// `Discover the best Packege`
  String get discoverTheBestPackage {
    return Intl.message(
      'Discover the best Packege',
      name: 'discoverTheBestPackage',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get person {
    return Intl.message('Person', name: 'person', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Description Statement`
  String get accountDescription {
    return Intl.message(
      'Description Statement',
      name: 'accountDescription',
      desc: '',
      args: [],
    );
  }

  /// `Image Description`
  String get imageDescription {
    return Intl.message(
      'Image Description',
      name: 'imageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Salary Description`
  String get salaryDescription {
    return Intl.message(
      'Salary Description',
      name: 'salaryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cairo`
  String get cairo {
    return Intl.message('Cairo', name: 'cairo', desc: '', args: []);
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `Best Offer`
  String get bestOffer {
    return Intl.message('Best Offer', name: 'bestOffer', desc: '', args: []);
  }

  /// `Discover The Best Flights`
  String get discoverTheBestFlights {
    return Intl.message(
      'Discover The Best Flights',
      name: 'discoverTheBestFlights',
      desc: '',
      args: [],
    );
  }

  /// `Discover The Best Institutes`
  String get discoverTheBestInstitutes {
    return Intl.message(
      'Discover The Best Institutes',
      name: 'discoverTheBestInstitutes',
      desc: '',
      args: [],
    );
  }

  /// `Explore More`
  String get exploreMore {
    return Intl.message(
      'Explore More',
      name: 'exploreMore',
      desc: '',
      args: [],
    );
  }

  /// `Create excitement`
  String get createExcitement {
    return Intl.message(
      'Create excitement',
      name: 'createExcitement',
      desc: '',
      args: [],
    );
  }

  /// `are you ready`
  String get areYouReady {
    return Intl.message(
      'are you ready',
      name: 'areYouReady',
      desc: '',
      args: [],
    );
  }

  /// `Choose your experiences`
  String get chooseYourExperiences {
    return Intl.message(
      'Choose your experiences',
      name: 'chooseYourExperiences',
      desc: '',
      args: [],
    );
  }

  /// `Distinctive and exciting activities`
  String get distinctiveAndExcitingActivities {
    return Intl.message(
      'Distinctive and exciting activities',
      name: 'distinctiveAndExcitingActivities',
      desc: '',
      args: [],
    );
  }

  /// `Start planning your events`
  String get startPlanningYourEvents {
    return Intl.message(
      'Start planning your events',
      name: 'startPlanningYourEvents',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Experiences Worldwide`
  String get experiencesWorldwide {
    return Intl.message(
      'Experiences Worldwide',
      name: 'experiencesWorldwide',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Did you receive any code`
  String get didYouReceiveAnyCode {
    return Intl.message(
      'Did you receive any code',
      name: 'didYouReceiveAnyCode',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkYourEmail {
    return Intl.message(
      'Check your email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `enter password`
  String get enterPassword {
    return Intl.message(
      'enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `You can now update your password`
  String get youCanNowUpdateYourPassword {
    return Intl.message(
      'You can now update your password',
      name: 'youCanNowUpdateYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Back to Homepage`
  String get backToHomepage {
    return Intl.message(
      'Back to Homepage',
      name: 'backToHomepage',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Change Password Success`
  String get changePasswordSuccess {
    return Intl.message(
      'Change Password Success',
      name: 'changePasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get and {
    return Intl.message('And', name: 'and', desc: '', args: []);
  }

  /// `Discover Incredible`
  String get discoverIncredible {
    return Intl.message(
      'Discover Incredible',
      name: 'discoverIncredible',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message('Terms', name: 'terms', desc: '', args: []);
  }

  /// `By clicking Sing up`
  String get byClickingSingUp {
    return Intl.message(
      'By clicking Sing up',
      name: 'byClickingSingUp',
      desc: '',
      args: [],
    );
  }

  /// `If you have an account`
  String get ifYouHaveAnAccount {
    return Intl.message(
      'If you have an account',
      name: 'ifYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Didnt have any account`
  String get didntAccount {
    return Intl.message(
      'Didnt have any account',
      name: 'didntAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `your name ar`
  String get yourNameAr {
    return Intl.message('your name ar', name: 'yourNameAr', desc: '', args: []);
  }

  /// `your name en`
  String get yourNameEn {
    return Intl.message('your name en', name: 'yourNameEn', desc: '', args: []);
  }

  /// `your name`
  String get yourName {
    return Intl.message('your name', name: 'yourName', desc: '', args: []);
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up here`
  String get signupHere {
    return Intl.message('Sign Up here', name: 'signupHere', desc: '', args: []);
  }

  /// `Sign In here`
  String get signinHere {
    return Intl.message('Sign In here', name: 'signinHere', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `LogIn`
  String get loginToday {
    return Intl.message('LogIn', name: 'loginToday', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Enter informations`
  String get enterInformations {
    return Intl.message(
      'Enter informations',
      name: 'enterInformations',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Week`
  String get week {
    return Intl.message('Week', name: 'week', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Sorry`
  String get sorry {
    return Intl.message('Sorry', name: 'sorry', desc: '', args: []);
  }

  /// `Submit Now !`
  String get submitNow {
    return Intl.message('Submit Now !', name: 'submitNow', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `I need accommodation`
  String get needAccommodation {
    return Intl.message(
      'I need accommodation',
      name: 'needAccommodation',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message('Start Date', name: 'startDate', desc: '', args: []);
  }

  /// `Study weeks`
  String get studyWeeks {
    return Intl.message('Study weeks', name: 'studyWeeks', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Advanced Search`
  String get advancedSearch {
    return Intl.message(
      'Advanced Search',
      name: 'advancedSearch',
      desc: '',
      args: [],
    );
  }

  /// `Agents of the most prestigious international institutesn Your journey to learn English starts here`
  String get agentOfMost {
    return Intl.message(
      'Agents of the most prestigious international institutesn Your journey to learn English starts here',
      name: 'agentOfMost',
      desc: '',
      args: [],
    );
  }

  /// `No Name`
  String get noName {
    return Intl.message('No Name', name: 'noName', desc: '', args: []);
  }

  /// `Features`
  String get features {
    return Intl.message('Features', name: 'features', desc: '', args: []);
  }

  /// `Certified by`
  String get certifiedBy {
    return Intl.message(
      'Certified by',
      name: 'certifiedBy',
      desc: '',
      args: [],
    );
  }

  /// `Books Now`
  String get bookNow {
    return Intl.message('Books Now', name: 'bookNow', desc: '', args: []);
  }

  /// `By registering you agree to the terms and conditions.`
  String get byRegister {
    return Intl.message(
      'By registering you agree to the terms and conditions.',
      name: 'byRegister',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `update`
  String get update {
    return Intl.message('update', name: 'update', desc: '', args: []);
  }

  /// `Family`
  String get family {
    return Intl.message('Family', name: 'family', desc: '', args: []);
  }

  /// `Friends`
  String get friends {
    return Intl.message('Friends', name: 'friends', desc: '', args: []);
  }

  /// `One Person Of Quantity`
  String get onePersonOfQuantity {
    return Intl.message(
      'One Person Of Quantity',
      name: 'onePersonOfQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Type Relationship Travelers`
  String get typeRelationshipTravelers {
    return Intl.message(
      'Type Relationship Travelers',
      name: 'typeRelationshipTravelers',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Booking Details`
  String get bookingDetails {
    return Intl.message(
      'Booking Details',
      name: 'bookingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Select the right course to study`
  String get selectTheRightCourseToStudy {
    return Intl.message(
      'Select the right course to study',
      name: 'selectTheRightCourseToStudy',
      desc: '',
      args: [],
    );
  }

  /// `Lodging`
  String get lodging {
    return Intl.message('Lodging', name: 'lodging', desc: '', args: []);
  }

  /// `Select optional housing`
  String get selectOptionalHousing {
    return Intl.message(
      'Select optional housing',
      name: 'selectOptionalHousing',
      desc: '',
      args: [],
    );
  }

  /// `Duration of residence`
  String get durationOfResidence {
    return Intl.message(
      'Duration of residence',
      name: 'durationOfResidence',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message('Preview', name: 'preview', desc: '', args: []);
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Insurance`
  String get insurance {
    return Intl.message('Insurance', name: 'insurance', desc: '', args: []);
  }

  /// `Booked Suceessfully`
  String get booked {
    return Intl.message(
      'Booked Suceessfully',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Please fill data`
  String get fill_data {
    return Intl.message(
      'Please fill data',
      name: 'fill_data',
      desc: '',
      args: [],
    );
  }

  /// `The service has been registered successfully.`
  String get service_register_sucess {
    return Intl.message(
      'The service has been registered successfully.',
      name: 'service_register_sucess',
      desc: '',
      args: [],
    );
  }

  /// `the phone number is used during account creation to send booking details within the app.`
  String get phone_required {
    return Intl.message(
      'the phone number is used during account creation to send booking details within the app.',
      name: 'phone_required',
      desc: '',
      args: [],
    );
  }

  /// `continue As Guest`
  String get guest {
    return Intl.message('continue As Guest', name: 'guest', desc: '', args: []);
  }

  /// `Guest Page`
  String get guest_page {
    return Intl.message('Guest Page', name: 'guest_page', desc: '', args: []);
  }

  /// `Login Required`
  String get login_required_title {
    return Intl.message(
      'Login Required',
      name: 'login_required_title',
      desc: '',
      args: [],
    );
  }

  /// `To see the service details, please log in to your account`
  String get login_required_msg {
    return Intl.message(
      'To see the service details, please log in to your account',
      name: 'login_required_msg',
      desc: '',
      args: [],
    );
  }

  /// `+966`
  String get code {
    return Intl.message('+966', name: 'code', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
