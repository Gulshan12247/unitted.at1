class UpdateInsuranceDetails {
  int? status;
  String? message;
  bool? success;
  Data? data;

  UpdateInsuranceDetails({this.status, this.message, this.success, this.data});

  UpdateInsuranceDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  get token => token;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? insuranceCompanyName;
  String? insuranceNumber;
  List<Null>? file;
  String? sId;
  String? userId;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.insuranceCompanyName,
        this.insuranceNumber,
        this.file,
        this.sId,
        this.userId,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    insuranceCompanyName = json['insuranceCompanyName'];
    insuranceNumber = json['insuranceNumber'];
    if (json['file'] != null) {
      file = <Null>[];
      json['file'].forEach((v) {

      });
    }
    sId = json['_id'];
    userId = json['userId'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['insuranceNumber'] = this.insuranceNumber;
    if (this.file != null) {
      data['file'] = this.file!.map((v) => v?.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

extension on Object? {
  toJson() {}
}