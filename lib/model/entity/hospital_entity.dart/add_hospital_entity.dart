class AddHospitalEntity {
  String? createdBy;
  String? email;
  String? name;
  String? phone;
  String? address;

  AddHospitalEntity({this.createdBy, this.email, this.name, this.phone});

  AddHospitalEntity.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone'] = this.phone;

    return data;
  }
}
