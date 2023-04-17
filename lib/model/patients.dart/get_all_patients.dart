class GetAllPatients {
  String? message;
  int? status;
  String? mediaBasePath;
  List<Body>? body;

  GetAllPatients({this.message, this.status, this.mediaBasePath, this.body});

  GetAllPatients.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Body {
  String? id;
  Null? isActive;
  String? createdDateTime;
  Null? modifiedDateTime;
  Null? modifiedBy;
  String? createdBy;
  String? name;
  String? mobileNo;
  String? aadhar;
  String? dob;
  String? referredBy;
  String? emailId;

  Body(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.name,
      this.mobileNo,
      this.aadhar,
      this.dob,
      this.referredBy,
      this.emailId});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdDateTime = json['created_date_time'];
    modifiedDateTime = json['modified_date_time'];
    modifiedBy = json['modified_by'];
    createdBy = json['created_by'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    aadhar = json['aadhar'];
    dob = json['dob'];
    referredBy = json['referred_by'];
    emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['created_date_time'] = this.createdDateTime;
    data['modified_date_time'] = this.modifiedDateTime;
    data['modified_by'] = this.modifiedBy;
    data['created_by'] = this.createdBy;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['aadhar'] = this.aadhar;
    data['dob'] = this.dob;
    data['referred_by'] = this.referredBy;
    data['email_id'] = this.emailId;
    return data;
  }
}
