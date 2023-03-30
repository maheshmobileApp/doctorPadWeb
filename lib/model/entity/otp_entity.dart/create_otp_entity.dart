class CreateOtpEntity {
  String? entity;

  CreateOtpEntity({this.entity});

  CreateOtpEntity.fromJson(Map<String, dynamic> json) {
    entity = json['entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity'] = this.entity;
    return data;
  }
}
