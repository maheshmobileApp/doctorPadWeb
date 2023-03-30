class AddPatient {
  String? aadhar;
  String? createdBy;
  String? createdDateTime;
  String? dob;
  String? emailId;
  String? id;
  bool? isActive;
  String? mobileNo;
  String? modifiedBy;
  String? modifiedDateTime;
  String? name;
  String? referredBy;

  AddPatient(
      {this.aadhar,
      this.createdBy,
      this.createdDateTime,
      this.dob,
      this.emailId,
      this.id,
      this.isActive,
      this.mobileNo,
      this.modifiedBy,
      this.modifiedDateTime,
      this.name,
      this.referredBy});

  AddPatient.fromJson(Map<String, dynamic> json) {
    aadhar = json['aadhar'];
    createdBy = json['created_by'];
    createdDateTime = json['created_date_time'];
    dob = json['dob'];
    emailId = json['email_id'];
    id = json['id'];
    isActive = json['is_active'];
    mobileNo = json['mobile_no'];
    modifiedBy = json['modified_by'];
    modifiedDateTime = json['modified_date_time'];
    name = json['name'];
    referredBy = json['referred_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhar'] = this.aadhar;
    data['created_by'] = this.createdBy;
    data['created_date_time'] = this.createdDateTime;
    data['dob'] = this.dob;
    data['email_id'] = this.emailId;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['mobile_no'] = this.mobileNo;
    data['modified_by'] = this.modifiedBy;
    data['modified_date_time'] = this.modifiedDateTime;
    data['name'] = this.name;
    data['referred_by'] = this.referredBy;
    return data;
  }
}
