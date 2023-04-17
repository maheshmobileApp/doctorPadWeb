class VerifyOtp {
  String? datetime;
  String? entity;
  String? entityType;
  int? id;
  int? otpValue;
  int? verified;

  VerifyOtp(
      {this.datetime,
      this.entity,
      this.entityType,
      this.id,
      this.otpValue,
      this.verified});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    entity = json['entity'];
    entityType = json['entity_type'];
    id = json['id'];
    otpValue = json['otp_value'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['entity'] = this.entity;
    data['entity_type'] = this.entityType;
    data['id'] = this.id;
    data['otp_value'] = this.otpValue;
    data['verified'] = this.verified;
    return data;
  }
}
