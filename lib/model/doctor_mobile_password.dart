class DoctorMobilePassword {
  String? message;
  int? status;
  String? error;

  DoctorMobilePassword({this.message, this.status, this.error});

  DoctorMobilePassword.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    error = json['error'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

