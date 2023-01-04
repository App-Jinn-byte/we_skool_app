class ProgramsListResponse {
  String? message;
  int? code;
  Data? data;

  ProgramsListResponse({this.message, this.code, this.data});

  ProgramsListResponse.fromJson(Map<String, dynamic> json) {
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
  List<Programs>? programs;

  Data({this.programs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Programs'] != null) {
      programs = <Programs>[];
      json['Programs'].forEach((v) {
        programs!.add(Programs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (programs != null) {
      data['Programs'] = programs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Programs {
  int? id;
  String? name;

  Programs({this.id, this.name});

  Programs.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}