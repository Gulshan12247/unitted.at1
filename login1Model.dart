class Login1model{
  String? message;
  int? status;
  bool? success;
  Data? data;
  String? token;


   Login1model(
      {this.message, this.status, this.success, this.data, this.token});

   Login1model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  Location? location;
  String? stripeCustomerId;
  String? zipCode;
  String? profilePic;
  String? dob;
  String? profileManagedBy;
  String? countryCode;
  String? phone;
  String? gender;
  String? address;
  String? country;
  String? state;
  String? city;
  bool? isSubscribe;
  bool? isIntroFinished;
  bool? isSubscribedToFirstPlan;
  bool? isFirstHospitalAdded;
  bool? isRegFromApp;
  bool? isVerifed;
  bool? islogin;
  bool? isdocVerifed;
  int? isdocStatus;
  int? docVerification;
  bool? forgotPassword;
  bool? isBlocked;
  bool? isClientBlocked;
  bool? isAdminBlocked;
  bool? isUserBlocked;
  bool? isPatientBlocked;
  bool? discharge;
  bool? died;
  bool? isNotificationBlocked;
  bool? isProfileUpdated;
  bool? isPasswordSet;
  bool? isOtpVerified;
  String? scheduleDate;
  String? otp;
  String? accessToken;
  int? lat;
  int? lng;
  String? lastLoggedInAs;
  bool? isAddedByAdmin;
  bool? isDeleted;
  bool? isHealthCareApp;
  int? isDocumentVerifed;
  String? lastLoginType;
  bool? isAvailable;
  int? healthProfessionalAvailability;
  String? subscriptionStatus;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? usertype;
  String? lang;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;
  bool? isCardAdded;

  Data(
      {this.location,
        this.stripeCustomerId,
        this.zipCode,
        this.profilePic,
        this.dob,
        this.profileManagedBy,
        this.countryCode,
        this.phone,
        this.gender,
        this.address,
        this.country,
        this.state,
        this.city,
        this.isSubscribe,
        this.isIntroFinished,
        this.isSubscribedToFirstPlan,
        this.isFirstHospitalAdded,
        this.isRegFromApp,
        this.isVerifed,
        this.islogin,
        this.isdocVerifed,
        this.isdocStatus,
        this.docVerification,
        this.forgotPassword,
        this.isBlocked,
        this.isClientBlocked,
        this.isAdminBlocked,
        this.isUserBlocked,
        this.isPatientBlocked,
        this.discharge,
        this.died,
        this.isNotificationBlocked,
        this.isProfileUpdated,
        this.isPasswordSet,
        this.isOtpVerified,
        this.scheduleDate,
        this.otp,
        this.accessToken,
        this.lat,
        this.lng,
        this.lastLoggedInAs,
        this.isAddedByAdmin,
        this.isDeleted,
        this.isHealthCareApp,
        this.isDocumentVerifed,
        this.lastLoginType,
        this.isAvailable,
        this.healthProfessionalAvailability,
        this.subscriptionStatus,
        this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.usertype,
        this.lang,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.id,
        this.isCardAdded});

  Data.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    stripeCustomerId = json['stripeCustomerId'];
    zipCode = json['zipCode'];
    profilePic = json['profilePic'];
    dob = json['dob'];
    profileManagedBy = json['profileManagedBy'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    isSubscribe = json['isSubscribe'];
    isIntroFinished = json['isIntroFinished'];
    isSubscribedToFirstPlan = json['isSubscribedToFirstPlan'];
    isFirstHospitalAdded = json['isFirstHospitalAdded'];
    isRegFromApp = json['isRegFromApp'];
    isVerifed = json['isVerifed'];
    islogin = json['islogin'];
    isdocVerifed = json['isdocVerifed'];
    isdocStatus = json['isdocStatus'];
    docVerification = json['docVerification'];
    forgotPassword = json['forgotPassword'];
    isBlocked = json['isBlocked'];
    isClientBlocked = json['isClientBlocked'];
    isAdminBlocked = json['isAdminBlocked'];
    isUserBlocked = json['isUserBlocked'];
    isPatientBlocked = json['isPatientBlocked'];
    discharge = json['discharge'];
    died = json['died'];
    isNotificationBlocked = json['isNotificationBlocked'];
    isProfileUpdated = json['isProfileUpdated'];
    isPasswordSet = json['isPasswordSet'];
    isOtpVerified = json['isOtpVerified'];
    scheduleDate = json['scheduleDate'];
    otp = json['otp'];
    accessToken = json['accessToken'];
    lat = json['lat'];
    lng = json['lng'];
    lastLoggedInAs = json['lastLoggedInAs'];
    isAddedByAdmin = json['isAddedByAdmin'];
    isDeleted = json['isDeleted'];
    isHealthCareApp = json['isHealthCareApp'];
    isDocumentVerifed = json['isDocumentVerifed'];
    lastLoginType = json['lastLoginType'];
    isAvailable = json['isAvailable'];
    healthProfessionalAvailability = json['healthProfessionalAvailability'];
    subscriptionStatus = json['subscriptionStatus'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    usertype = json['usertype'];
    lang = json['lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
    isCardAdded = json['isCardAdded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['zipCode'] = this.zipCode;
    data['profilePic'] = this.profilePic;
    data['dob'] = this.dob;
    data['profileManagedBy'] = this.profileManagedBy;
    data['countryCode'] = this.countryCode;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['isSubscribe'] = this.isSubscribe;
    data['isIntroFinished'] = this.isIntroFinished;
    data['isSubscribedToFirstPlan'] = this.isSubscribedToFirstPlan;
    data['isFirstHospitalAdded'] = this.isFirstHospitalAdded;
    data['isRegFromApp'] = this.isRegFromApp;
    data['isVerifed'] = this.isVerifed;
    data['islogin'] = this.islogin;
    data['isdocVerifed'] = this.isdocVerifed;
    data['isdocStatus'] = this.isdocStatus;
    data['docVerification'] = this.docVerification;
    data['forgotPassword'] = this.forgotPassword;
    data['isBlocked'] = this.isBlocked;
    data['isClientBlocked'] = this.isClientBlocked;
    data['isAdminBlocked'] = this.isAdminBlocked;
    data['isUserBlocked'] = this.isUserBlocked;
    data['isPatientBlocked'] = this.isPatientBlocked;
    data['discharge'] = this.discharge;
    data['died'] = this.died;
    data['isNotificationBlocked'] = this.isNotificationBlocked;
    data['isProfileUpdated'] = this.isProfileUpdated;
    data['isPasswordSet'] = this.isPasswordSet;
    data['isOtpVerified'] = this.isOtpVerified;
    data['scheduleDate'] = this.scheduleDate;
    data['otp'] = this.otp;
    data['accessToken'] = this.accessToken;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['lastLoggedInAs'] = this.lastLoggedInAs;
    data['isAddedByAdmin'] = this.isAddedByAdmin;
    data['isDeleted'] = this.isDeleted;
    data['isHealthCareApp'] = this.isHealthCareApp;
    data['isDocumentVerifed'] = this.isDocumentVerifed;
    data['lastLoginType'] = this.lastLoginType;
    data['isAvailable'] = this.isAvailable;
    data['healthProfessionalAvailability'] =
        this.healthProfessionalAvailability;
    data['subscriptionStatus'] = this.subscriptionStatus;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['usertype'] = this.usertype;
    data['lang'] = this.lang;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    data['isCardAdded'] = this.isCardAdded;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}