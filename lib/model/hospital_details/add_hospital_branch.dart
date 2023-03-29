class AddHospitalBranch {
  String? address;
  String? createdBy;
  String? createdDateTime;
  String? hospitalId;
  String? id;
  bool? isActive;
  String? modifiedBy;
  String? modifiedDateTime;
  String? name;
  String? prescriptionImageUrl;
  List<SpecializationIds>? specializationIds;

  AddHospitalBranch(
      {this.address,
      this.createdBy,
      this.createdDateTime,
      this.hospitalId,
      this.id,
      this.isActive,
      this.modifiedBy,
      this.modifiedDateTime,
      this.name,
      this.prescriptionImageUrl,
      this.specializationIds});

  AddHospitalBranch.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    createdBy = json['created_by'];
    createdDateTime = json['created_date_time'];
    hospitalId = json['hospital_id'];
    id = json['id'];
    isActive = json['is_active'];
    modifiedBy = json['modified_by'];
    modifiedDateTime = json['modified_date_time'];
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
    data['created_date_time'] = this.createdDateTime;
    data['hospital_id'] = this.hospitalId;
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['modified_by'] = this.modifiedBy;
    data['modified_date_time'] = this.modifiedDateTime;
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
