class StatesResponse {
  String? message;
  int? code;
  Data? data;

  StatesResponse({this.message, this.code, this.data});
  StatesResponse.empty();

  StatesResponse.fromJson(Map<String, dynamic> json) {
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
  List<States>? states;

  Data({this.states});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['States'] != null) {
      states = <States>[];
      json['States'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (states != null) {
      data['States'] = states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  int? id;
  String? name;
  int? countryId;

  States({this.id, this.name, this.countryId});

  States.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    countryId = json['CountryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['CountryId'] = countryId;
    return data;
  }
}