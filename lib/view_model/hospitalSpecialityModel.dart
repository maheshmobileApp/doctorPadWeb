class HospitalSpecialitiesModel {
  String? message;
  int? status;
  String? mediaBasePath;
  List<Specilities>? specilityList;

  HospitalSpecialitiesModel(
      {this.message, this.status, this.mediaBasePath, this.specilityList});

  HospitalSpecialitiesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    if (json['body'] != null) {
      specilityList = <Specilities>[];
      json['body'].forEach((v) {
        specilityList!.add(new Specilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    if (this.specilityList != null) {
      data['body'] = this.specilityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specilities {
  String? id;
  Null? isActive;
  String? createdDateTime;
  Null? modifiedDateTime;
  Null? modifiedBy;
  String? createdBy;
  String? specialityName;

  Specilities(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.specialityName});

  Specilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdDateTime = json['created_date_time'];
    modifiedDateTime = json['modified_date_time'];
    modifiedBy = json['modified_by'];
    createdBy = json['created_by'];
    specialityName = json['speciality_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['created_date_time'] = this.createdDateTime;
    data['modified_date_time'] = this.modifiedDateTime;
    data['modified_by'] = this.modifiedBy;
    data['created_by'] = this.createdBy;
    data['speciality_name'] = this.specialityName;
    return data;
  }
}
