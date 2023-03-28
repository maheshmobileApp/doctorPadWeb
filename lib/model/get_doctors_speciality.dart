class GetDoctorSpecialites {
  String? message;
  int? status;
  String? mediaBasePath;
  List<Body>? body;

  GetDoctorSpecialites(
      {this.message, this.status, this.mediaBasePath, this.body});

  GetDoctorSpecialites.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
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

class Body {
  String? id;
  Null? isActive;
  String? createdDateTime;
  Null? modifiedDateTime;
  Null? modifiedBy;
  String? createdBy;
  String? specialityName;

  Body(
      {this.id,
      this.isActive,
      this.createdDateTime,
      this.modifiedDateTime,
      this.modifiedBy,
      this.createdBy,
      this.specialityName});

  Body.fromJson(Map<String, dynamic> json) {
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
