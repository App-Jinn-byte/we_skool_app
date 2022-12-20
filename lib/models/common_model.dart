class CommonResponse {
  String? message;
  int? code;
  Data? data;

  CommonResponse({this.message, this.code, this.data});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    code = json['Code'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Code'] = code;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;

  Data({this.message});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    return data;
  }
}