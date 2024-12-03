class GovtDocModel {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  GovtDocModel({this.success, this.status, this.message, this.data});

  GovtDocModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? govtIdNumber;
  String? front;
  String? back;
  String? sId;
  String? userId;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.name,
        this.govtIdNumber,
        this.front,
        this.back,
        this.sId,
        this.userId,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    govtIdNumber = json['govtIdNumber'];
    front = json['front'];
    back = json['back'];
    sId = json['_id'];
    userId = json['userId'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['govtIdNumber'] = this.govtIdNumber;
    data['front'] = this.front;
    data['back'] = this.back;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
