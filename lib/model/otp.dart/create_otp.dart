class CreateOtp {
  String? message;
  int? status;
  String? mediaBasePath;
  String? body;

  CreateOtp({this.message, this.status, this.mediaBasePath, this.body});

  CreateOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    data['body'] = this.body;
    return data;
  }
}
