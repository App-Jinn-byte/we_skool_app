class CitiesResponse {
  String? message;
  int? code;
  Data? data;

  CitiesResponse({this.message, this.code, this.data});
  CitiesResponse.empty();

  CitiesResponse.fromJson(Map<String, dynamic> json) {
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
  List<Cities>? cities;

  Data({this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data['Cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  int? stateId;

  Cities({this.id, this.name, this.stateId});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    stateId = json['StateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['StateId'] = stateId;
    return data;
  }
}