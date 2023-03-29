class AddHospitalSpecialityEntity {
  String? createdBy;
  String? specialityName;

  AddHospitalSpecialityEntity({this.createdBy, this.specialityName});

  AddHospitalSpecialityEntity.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    specialityName = json['speciality_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['speciality_name'] = this.specialityName;
    return data;
  }
}
