class AddPatientEntity {
  String? aadhar;
  String? createdBy;
  String? dob;
  String? emailId;
  String? mobileNo;
  String? name;
  String? referredBy;

  AddPatientEntity(
      {this.aadhar,
      this.createdBy,
      this.dob,
      this.emailId,
      this.mobileNo,
      this.name,
      this.referredBy});

  AddPatientEntity.fromJson(Map<String, dynamic> json) {
    aadhar = json['aadhar'];
    createdBy = json['created_by'];
    dob = json['dob'];
    emailId = json['email_id'];
    mobileNo = json['mobile_no'];
    name = json['name'];
    referredBy = json['referred_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhar'] = this.aadhar;
    data['created_by'] = this.createdBy;
    data['dob'] = this.dob;
    data['email_id'] = this.emailId;
    data['mobile_no'] = this.mobileNo;
    data['name'] = this.name;
    data['referred_by'] = this.referredBy;
    return data;
  }
}
