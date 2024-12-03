class UserListModel {
  String? message;
  int? status;
  bool? success;
  Data? data;

  UserListModel({this.message, this.status, this.success, this.data,required });

  UserListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  String get name => name;

  String get email => email;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Location? location;
  String? stripeCustomerId;
  bool? isStripeOnboardingCompleted;
  String? zipCode;
  String? profilePic;
  List<Null>? hospital;
  List<Null>? clients;
  List<Null>? ntdata;
  List<Null>? needs;
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
  List<Null>? payments;
  List<Null>? badges;
  List<Null>? schedules;
  List<Null>? diagnosis;
  List<Null>? palcare;
  List<Null>? status;
  List<Null>? anthropometry;
  List<Null>? vigilance;
  List<Null>? observations;
  List<Null>? nurse;
  int? lat;
  int? lng;
  List<Null>? categories;
  bool? isAddedByAdmin;
  bool? isDeleted;
  bool? isHealthCareApp;
  int? isDocumentVerifed;
  List<Null>? chargeCategory;
  String? lastLoginType;
  bool? isAvailable;
  List<Null>? availability;
  int? healthProfessionalAvailability;
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
        this.isStripeOnboardingCompleted,
        this.zipCode,
        this.profilePic,
        this.hospital,
        this.clients,
        this.ntdata,
        this.needs,
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
        this.payments,
        this.badges,
        this.schedules,
        this.diagnosis,
        this.palcare,
        this.status,
        this.anthropometry,
        this.vigilance,
        this.observations,
        this.nurse,
        this.lat,
        this.lng,
        this.categories,
        this.isAddedByAdmin,
        this.isDeleted,
        this.isHealthCareApp,
        this.isDocumentVerifed,
        this.chargeCategory,
        this.lastLoginType,
        this.isAvailable,
        this.availability,
        this.healthProfessionalAvailability,
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
    isStripeOnboardingCompleted = json['isStripeOnboardingCompleted'];
    zipCode = json['zipCode'];
    profilePic = json['profilePic'];
    if (json['hospital'] != null) {
      hospital = <Null>[];
      json['hospital'].forEach((v) {
      });
    }
    if (json['clients'] != null) {
      clients = <Null>[];
      json['clients'].forEach((v) {
      });
    }
    if (json['ntdata'] != null) {
      ntdata = <Null>[];
      json['ntdata'].forEach((v) {
      });
    }
    if (json['needs'] != null) {
      needs = <Null>[];
      json['needs'].forEach((v) {

      });
    }
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
    if (json['payments'] != null) {
      payments = <Null>[];
      json['payments'].forEach((v) {
      });
    }
    if (json['badges'] != null) {
      badges = <Null>[];
      json['badges'].forEach((v) {
      });
    }
    if (json['schedules'] != null) {
      schedules = <Null>[];
      json['schedules'].forEach((v) {
      });
    }
    if (json['diagnosis'] != null) {
      diagnosis = <Null>[];
      json['diagnosis'].forEach((v) {
      });
    }
    if (json['palcare'] != null) {
      palcare = <Null>[];
      json['palcare'].forEach((v) {

      });
    }
    if (json['status'] != null) {
      status = <Null>[];
      json['status'].forEach((v) {
      });
    }
    if (json['anthropometry'] != null) {
      anthropometry = <Null>[];
      json['anthropometry'].forEach((v) {

      });
    }
    if (json['vigilance'] != null) {
      vigilance = <Null>[];
      json['vigilance'].forEach((v) {
      });
    }
    if (json['observations'] != null) {
      observations = <Null>[];
      json['observations'].forEach((v) {

      });
    }
    if (json['nurse'] != null) {
      nurse = <Null>[];
      json['nurse'].forEach((v) {

      });
    }
    lat = json['lat'];
    lng = json['lng'];
    if (json['categories'] != null) {
      categories = <Null>[];
      json['categories'].forEach((v) {

      });
    }
    isAddedByAdmin = json['isAddedByAdmin'];
    isDeleted = json['isDeleted'];
    isHealthCareApp = json['isHealthCareApp'];
    isDocumentVerifed = json['isDocumentVerifed'];
    if (json['chargeCategory'] != null) {
      chargeCategory = <Null>[];
      json['chargeCategory'].forEach((v) {
      });
    }
    lastLoginType = json['lastLoginType'];
    isAvailable = json['isAvailable'];
    if (json['availability'] != null) {
      availability = <Null>[];
      json['availability'].forEach((v) {

      });
    }
    healthProfessionalAvailability = json['healthProfessionalAvailability'];
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
    data['isStripeOnboardingCompleted'] = this.isStripeOnboardingCompleted;
    data['zipCode'] = this.zipCode;
    data['profilePic'] = this.profilePic;
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.map((v) => v.toJson()).toList();
    }
    if (this.clients != null) {
      data['clients'] = this.clients!.map((v) => v.toJson()).toList();
    }
    if (this.ntdata != null) {
      data['ntdata'] = this.ntdata!.map((v) => v.toJson()).toList();
    }
    if (this.needs != null) {
      data['needs'] = this.needs!.map((v) => v?.toJson()).toList();
    }
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
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis!.map((v) => v.toJson()).toList();
    }
    if (this.palcare != null) {
      data['palcare'] = this.palcare!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    if (this.anthropometry != null) {
      data['anthropometry'] =
          this.anthropometry!.map((v) => v.toJson()).toList();
    }
    if (this.vigilance != null) {
      data['vigilance'] = this.vigilance!.map((v) => v.toJson()).toList();
    }
    if (this.observations != null) {
      data['observations'] = this.observations!.map((v) => v.toJson()).toList();
    }
    if (this.nurse != null) {
      data['nurse'] = this.nurse!.map((v) => v.toJson()).toList();
    }
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['isAddedByAdmin'] = this.isAddedByAdmin;
    data['isDeleted'] = this.isDeleted;
    data['isHealthCareApp'] = this.isHealthCareApp;
    data['isDocumentVerifed'] = this.isDocumentVerifed;
    if (this.chargeCategory != null) {
      data['chargeCategory'] =
          this.chargeCategory!.map((v) => v.toJson()).toList();
    }
    data['lastLoginType'] = this.lastLoginType;
    data['isAvailable'] = this.isAvailable;
    if (this.availability != null) {
      data['availability'] = this.availability!.map((v) => v.toJson()).toList();
    }
    data['healthProfessionalAvailability'] =
        this.healthProfessionalAvailability;
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

extension on Object? {
  toJson() {}
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