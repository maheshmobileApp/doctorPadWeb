class UploadFileResponse {
  String? message;
  int? status;
  String? mediaBasePath;
  Body? body;

  UploadFileResponse(
      {this.message, this.status, this.mediaBasePath, this.body});

  UploadFileResponse.fromJson(Map<String, dynamic> json) {
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
  String? message;
  String? pathname;

  Body({this.message, this.pathname});

  Body.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pathname = json['pathname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['pathname'] = this.pathname;
    return data;
  }
}
