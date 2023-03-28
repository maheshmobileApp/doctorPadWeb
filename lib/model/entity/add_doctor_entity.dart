class AddDoctorEntity {
  String? createdBy;
  String? doctorRegistrationNumber;
  String? emailId;
  String? mobileNo;
  String? name;

  AddDoctorEntity(
      {this.createdBy,
      this.doctorRegistrationNumber,
      this.emailId,
      this.mobileNo,
      this.name,
      required String password});

  AddDoctorEntity.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    doctorRegistrationNumber = json['doctor_registration_number'];
    emailId = json['email_id'];
    mobileNo = json['mobile_no'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['doctor_registration_number'] = this.doctorRegistrationNumber;
    data['email_id'] = this.emailId;
    data['mobile_no'] = this.mobileNo;
    data['name'] = this.name;
    return data;
  }
}
