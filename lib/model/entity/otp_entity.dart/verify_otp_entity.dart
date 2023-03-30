class VerifyOtpEntity {
  String? entity;
  int? otpValue;

  VerifyOtpEntity({this.entity, this.otpValue});

  VerifyOtpEntity.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
    otpValue = json['otp_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    data['otp_value'] = this.otpValue;
    return data;
  }
}
