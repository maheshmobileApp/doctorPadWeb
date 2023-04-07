class AddDoctor {
  String? createdBy;
  String? createdDateTime;
  String? doctorRegistrationNumber;
  String? emailId;
  String? id;
  bool? isActive;
  bool? isEmailVerified;
  bool? isFirstTimeLogin;
  bool? isMobileVerified;
  String? mobileNo;
  String? modifiedBy;
  String? modifiedDateTime;
  String? name;
  String? password;

  AddDoctor(
      {this.createdBy,
      this.createdDateTime,
      this.doctorRegistrationNumber,
      this.emailId,
      this.id,
      this.isActive,
      this.isEmailVerified,
      this.isFirstTimeLogin,
      this.isMobileVerified,
      this.mobileNo,
      this.modifiedBy,
      this.modifiedDateTime,
      this.name,
      this.password});

  AddDoctor.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    createdDateTime = json['created_date_time'];
    doctorRegistrationNumber = json['doctor_registration_number'];
    emailId = json['email_id'];
    id = json['id'];
    isActive = json['is_active'];
    isEmailVerified = json['is_email_verified'];
    isFirstTimeLogin = json['is_first_time_login'];
    isMobileVerified = json['is_mobile_verified'];
    mobileNo = json['mobile_no'];
    modifiedBy = json['modified_by'];
    modifiedDateTime = json['modified_date_time'];
    name = json['name'];
    password = json['password'];
  }

  get status => null;

  get message => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['created_date_time'] = this.createdDateTime;
    data['doctor_registration_number'] = this.doctorRegistrationNumber;
    data['email_id'] = this.emailId;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_first_time_login'] = this.isFirstTimeLogin;
    data['is_mobile_verified'] = this.isMobileVerified;
    data['mobile_no'] = this.mobileNo;
    data['modified_by'] = this.modifiedBy;
    data['modified_date_time'] = this.modifiedDateTime;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
