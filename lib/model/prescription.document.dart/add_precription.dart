class AddPrescriptionDoc {
  String? message;
  int? status;
  String? mediaBasePath;
  Body? body;

  AddPrescriptionDoc(
      {this.message, this.status, this.mediaBasePath, this.body});

  AddPrescriptionDoc.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['media_base_path'] = this.mediaBasePath;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? id;
  Null? isActive;
  String? createdDateTime;
  Null? modifiedDateTime;
  Null? modifiedBy;
  String? createdBy;
  String? prescriptionId;
  String? fileUrl;

  Body(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.prescriptionId,
      this.fileUrl});

  Body.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    createdDateTime = json['created_date_time'];
    modifiedDateTime = json['modified_date_time'];
    modifiedBy = json['modified_by'];
    createdBy = json['created_by'];
    prescriptionId = json['prescription_id'];
    fileUrl = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['created_date_time'] = this.createdDateTime;
    data['modified_date_time'] = this.modifiedDateTime;
    data['modified_by'] = this.modifiedBy;
    data['created_by'] = this.createdBy;
    data['prescription_id'] = this.prescriptionId;
    data['file_url'] = this.fileUrl;
    return data;
  }
}
