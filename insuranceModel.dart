class InsuranceModel {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  InsuranceModel({this.success, this.status, this.message, this.data});

  InsuranceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
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
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? insuranceCompanyName;
  String? insuranceNumber;
  Null? expiryDate;
  String? description;
  List<String>? file;
  String? sId;
  String? userId;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.insuranceCompanyName,
        this.insuranceNumber,
        this.expiryDate,
        this.description,
        this.file,
        this.sId,
        this.userId,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    insuranceCompanyName = json['insuranceCompanyName'];
    insuranceNumber = json['insuranceNumber'];
    expiryDate = json['expiryDate'];
    description = json['description'];
    file = json['file'].cast<String>();
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
    data['expiryDate'] = this.expiryDate;
    data['description'] = this.description;
    data['file'] = this.file;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}