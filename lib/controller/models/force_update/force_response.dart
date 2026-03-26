class AppVersionResponse {
  bool? status;
  AppVersionData? data;

  AppVersionResponse({this.status, this.data});

  AppVersionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? AppVersionData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['status'] = status;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}

class AppVersionData {
  int? id;
  String? platform;
  String? minVersion;
  String? latestVersion;
  int? forceUpdate;
  String? message;
  String? createdAt;
  String? updatedAt;

  AppVersionData({
    this.id,
    this.platform,
    this.minVersion,
    this.latestVersion,
    this.forceUpdate,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  AppVersionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    minVersion = json['min_version'];
    latestVersion = json['latest_version'];
    forceUpdate = json['force_update'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['platform'] = platform;
    json['min_version'] = minVersion;
    json['latest_version'] = latestVersion;
    json['force_update'] = forceUpdate;
    json['message'] = message;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}
