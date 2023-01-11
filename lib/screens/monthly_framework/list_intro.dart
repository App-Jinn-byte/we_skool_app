class IntroModelList {
  List<Data>? data;

  IntroModelList({this.data});

  IntroModelList.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? heading;
  String? description;

  Data({this.heading, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['heading'] = heading;
    data['description'] = description;
    return data;
  }
}