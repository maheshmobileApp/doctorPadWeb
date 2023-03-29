class AddHospitalBranchEntity {
  String? address;
  String? createdBy;
  String? hospitalId;
  String? name;
  String? prescriptionImageUrl;
  List<SpecializationIds>? specializationIds;

  AddHospitalBranchEntity(
      {this.address,
      this.createdBy,
      this.hospitalId,
      this.name,
      this.prescriptionImageUrl,
      this.specializationIds});

  AddHospitalBranchEntity.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createdBy = json['created_by'];
    hospitalId = json['hospital_id'];
    name = json['name'];
    prescriptionImageUrl = json['prescription_image_url'];
    if (json['specialization_ids'] != null) {
      specializationIds = <SpecializationIds>[];
      json['specialization_ids'].forEach((v) {
        specializationIds!.add(new SpecializationIds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['created_by'] = this.createdBy;
    data['hospital_id'] = this.hospitalId;
    data['name'] = this.name;
    data['prescription_image_url'] = this.prescriptionImageUrl;
    if (this.specializationIds != null) {
      data['specialization_ids'] =
          this.specializationIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpecializationIds {
  String? id;

  SpecializationIds({this.id});

  SpecializationIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
