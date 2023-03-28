
class DoctorMobilePasswordEntity {
  String? mobileNo;
  String? password;

  DoctorMobilePasswordEntity(param0, param1, {this.mobileNo, this.password, required String mobileNumber});


  DoctorMobilePasswordEntity.fromJson(Map<String, dynamic> json) {
    mobileNo = json['mobile_no'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    return data;
  }
}
