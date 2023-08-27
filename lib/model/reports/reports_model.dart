class ReportsModel {
  String? message;
  int? status;
  String? mediaBasePath;
  List<ReportsData>? body;

  ReportsModel({this.message, this.status, this.mediaBasePath, this.body});

  ReportsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    mediaBasePath = json['media_base_path'];
    if (json['body'] != null) {
      body = <ReportsData>[];
      json['body'].forEach((v) {
        body!.add(new ReportsData.fromJson(v));
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

class ReportsData {
  String? countName;
  int? totalCount;

  ReportsData({this.countName, this.totalCount});

  ReportsData.fromJson(Map<String, dynamic> json) {
    countName = json['count_name'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_name'] = this.countName;
    data['total_count'] = this.totalCount;
    return data;
  }
}
