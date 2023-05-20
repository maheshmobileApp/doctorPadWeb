class BranchesList {
  String? message;
  int? status;
  String? mediaBasePath;
  List<BrachDetailsModel>? body;

  BranchesList({this.message, this.status, this.mediaBasePath, this.body});

  BranchesList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    if (json['body'] != null) {
      body = <BrachDetailsModel>[];
      json['body'].forEach((v) {
        body!.add(new BrachDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrachDetailsModel {
  String? id;
  Null? isActive;
  String? createdDateTime;
  Null? modifiedDateTime;
  Null? modifiedBy;
  String? createdBy;
  String? name;
  String? address;
  String? hospitalId;
  Null? specializationIds;
  String? prescriptionImageUrl;
  String? hospitalRegNumber;

  BrachDetailsModel(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.name,
      this.address,
      this.hospitalId,
      this.specializationIds,
      this.prescriptionImageUrl,
      this.hospitalRegNumber});

  BrachDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdDateTime = json['created_date_time'];
    modifiedDateTime = json['modified_date_time'];
    modifiedBy = json['modified_by'];
    createdBy = json['created_by'];
    name = json['name'];
    address = json['address'];
    hospitalId = json['hospital_id'];
    specializationIds = json['specialization_ids'];
    prescriptionImageUrl = json['prescription_image_url'];
    hospitalRegNumber = json['hospital_reg_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['created_date_time'] = this.createdDateTime;
    data['modified_date_time'] = this.modifiedDateTime;
    data['modified_by'] = this.modifiedBy;
    data['created_by'] = this.createdBy;
    data['name'] = this.name;
    data['address'] = this.address;
    data['hospital_id'] = this.hospitalId;
    data['specialization_ids'] = this.specializationIds;
    data['prescription_image_url'] = this.prescriptionImageUrl;
    data['hospital_reg_number'] = this.hospitalRegNumber;
    return data;
  }
}
