class AddPrescriptionDocEntity {
  String? createdBy;
  String? fileUrl;
  String? prescriptionId;

  AddPrescriptionDocEntity({this.createdBy, this.fileUrl, this.prescriptionId});

  AddPrescriptionDocEntity.fromJson(Map<String, dynamic> json) {
    createdBy = json['created_by'];
    fileUrl = json['file_url'];
    prescriptionId = json['prescription_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_by'] = this.createdBy;
    data['file_url'] = this.fileUrl;
    data['prescription_id'] = this.prescriptionId;
    return data;
  }
}
