class MonthlyFrameworkResponse {
  String? message;
  int? code;
  Data? data;

  MonthlyFrameworkResponse({this.message, this.code, this.data});

  MonthlyFrameworkResponse.fromJson(Map<String, dynamic> json) {
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
  bool? isAgeGroup;
  List<MonthlyFramework>? monthlyFramework;

  Data({this.isAgeGroup, this.monthlyFramework});

  Data.fromJson(Map<String, dynamic> json) {
    isAgeGroup = json['IsAgeGroup'];
    if (json['MonthlyFramework'] != null) {
      monthlyFramework = <MonthlyFramework>[];
      json['MonthlyFramework'].forEach((v) {
        monthlyFramework!.add(MonthlyFramework.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsAgeGroup'] = isAgeGroup;
    if (monthlyFramework != null) {
      data['MonthlyFramework'] =
          monthlyFramework!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyFramework {
  int? monthlyFrameworkId;
  String? code;
  int? classId;
  int? monthId;
  int? year;
  bool? isApproved;
  bool? isTemplate;
  String? introduction;
  String? introductionPic;
  String? materials;
  String? books;
  String? vocabulary;
  String? songsToSing;
  List<MonthlyFrameworkDetails>? monthlyFrameworkDetails;
  List<Null>? monthlyFrameworkFiles;

  MonthlyFramework(
      {this.monthlyFrameworkId,
        this.code,
        this.classId,
        this.monthId,
        this.year,
        this.isApproved,
        this.isTemplate,
        this.introduction,
        this.introductionPic,
        this.materials,
        this.books,
        this.vocabulary,
        this.songsToSing,
        this.monthlyFrameworkDetails,
        this.monthlyFrameworkFiles});

  MonthlyFramework.fromJson(Map<String, dynamic> json) {
    monthlyFrameworkId = json['MonthlyFrameworkId'];
    code = json['Code'];
    classId = json['ClassId'];
    monthId = json['MonthId'];
    year = json['Year'];
    isApproved = json['IsApproved'];
    isTemplate = json['IsTemplate'];
    introduction = json['Introduction'];
    introductionPic = json['IntroductionPic'];
    materials = json['Materials'];
    books = json['Books'];
    vocabulary = json['Vocabulary'];
    songsToSing = json['SongsToSing'];
    if (json['MonthlyFrameworkDetails'] != null) {
      monthlyFrameworkDetails = <MonthlyFrameworkDetails>[];
      json['MonthlyFrameworkDetails'].forEach((v) {
        monthlyFrameworkDetails!.add(MonthlyFrameworkDetails.fromJson(v));
      });
    }
    // if (json['MonthlyFrameworkFiles'] != null) {
    //   monthlyFrameworkFiles = <Null>[];
    //   json['MonthlyFrameworkFiles'].forEach((v) {
    //     monthlyFrameworkFiles!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MonthlyFrameworkId'] = monthlyFrameworkId;
    data['Code'] = code;
    data['ClassId'] = classId;
    data['MonthId'] = monthId;
    data['Year'] = year;
    data['IsApproved'] = isApproved;
    data['IsTemplate'] = isTemplate;
    data['Introduction'] = introduction;
    data['IntroductionPic'] = introductionPic;
    data['Materials'] = materials;
    data['Books'] = books;
    data['Vocabulary'] = vocabulary;
    data['SongsToSing'] = songsToSing;
    if (monthlyFrameworkDetails != null) {
      data['MonthlyFrameworkDetails'] =
          monthlyFrameworkDetails!.map((v) => v.toJson()).toList();
    }
    // if (monthlyFrameworkFiles != null) {
    //   data['MonthlyFrameworkFiles'] =
    //       monthlyFrameworkFiles!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class MonthlyFrameworkDetails {
  int? monthlyFrameworkDetailId;
  int? monthlyFrameworkId;
  String? title;
  String? description;
  String? domain;

  MonthlyFrameworkDetails(
      {this.monthlyFrameworkDetailId,
        this.monthlyFrameworkId,
        this.title,
        this.description,
        this.domain});

  MonthlyFrameworkDetails.fromJson(Map<String, dynamic> json) {
    monthlyFrameworkDetailId = json['MonthlyFrameworkDetailId'];
    monthlyFrameworkId = json['MonthlyFrameworkId'];
    title = json['Title'];
    description = json['Description'];
    domain = json['Domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MonthlyFrameworkDetailId'] = monthlyFrameworkDetailId;
    data['MonthlyFrameworkId'] = monthlyFrameworkId;
    data['Title'] = title;
    data['Description'] = description;
    data['Domain'] = domain;
    return data;
  }
}