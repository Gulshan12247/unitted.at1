class FetchPostModel{
  bool? success;
  List<Data>? data;
  Meta? meta;
  String? message;

  FetchPostModel({this.success, this.data, this.meta, this.message});

  FetchPostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? slug;
  String? title;
  String? body;
  String? authorId;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;

  Data(
      {this.id,
        this.slug,
        this.title,
        this.body,
        this.authorId,
        this.createdAt,
        this.updatedAt,
        this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    body = json['body'];
    authorId = json['authorId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['body'] = this.body;
    data['authorId'] = this.authorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? id;
  String? comment;
  int? commentCount;
  String? createdAt;
  String? updateAt;
  User? user;

  Comments(
      {this.id,
        this.comment,
        this.commentCount,
        this.createdAt,
        this.updateAt,
        this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    commentCount = json['comment_count'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['comment_count'] = this.commentCount;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;

  User({this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

class Meta {
  int? totalRecord;
  int? totalPage;
  int? currectPage;
  int? limit;

  Meta({this.totalRecord, this.totalPage, this.currectPage, this.limit});

  Meta.fromJson(Map<String, dynamic> json) {
    totalRecord = json['Total_Record'];
    totalPage = json['Total_Page'];
    currectPage = json['Currect_Page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Total_Record'] = this.totalRecord;
    data['Total_Page'] = this.totalPage;
    data['Currect_Page'] = this.currectPage;
    data['limit'] = this.limit;
    return data;
  }
}
