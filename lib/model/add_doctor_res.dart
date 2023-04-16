class AddDoctorResponse {
  String? message;
  int? status;
  String? mediaBasePath;
  Body? body;

  AddDoctorResponse({this.message, this.status, this.mediaBasePath, this.body});

  AddDoctorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
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
  String? emailId;
  String? password;
  String? doctorRegistrationNumber;
  Null? isMobileVerified;
  Null? isEmailVerified;
  Null? isFirstTimeLogin;

  Body(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.name,
      this.mobileNo,
      this.emailId,
      this.password,
      this.doctorRegistrationNumber,
      this.isMobileVerified,
      this.isEmailVerified,
      this.isFirstTimeLogin});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdDateTime = json['created_date_time'];
    modifiedDateTime = json['modified_date_time'];
    modifiedBy = json['modified_by'];
    createdBy = json['created_by'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    password = json['password'];
    doctorRegistrationNumber = json['doctor_registration_number'];
    isMobileVerified = json['is_mobile_verified'];
    isEmailVerified = json['is_email_verified'];
    isFirstTimeLogin = json['is_first_time_login'];
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
    data['email_id'] = this.emailId;
    data['password'] = this.password;
    data['doctor_registration_number'] = this.doctorRegistrationNumber;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_first_time_login'] = this.isFirstTimeLogin;
    return data;
  }
}
