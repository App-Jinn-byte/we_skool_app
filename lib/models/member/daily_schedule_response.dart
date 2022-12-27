class DailyScheduleResponse {
  String? message;
  int? code;
  Data? data;

  DailyScheduleResponse({this.message, this.code, this.data});

  DailyScheduleResponse.fromJson(Map<String, dynamic> json) {
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
  List<DailySchedule>? dailySchedule;

  Data({this.dailySchedule});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['DailySchedule'] != null) {
      dailySchedule = <DailySchedule>[];
      json['DailySchedule'].forEach((v) {
        dailySchedule!.add(DailySchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dailySchedule != null) {
      data['DailySchedule'] =
          dailySchedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailySchedule {
  int? monthlyScheduleDetailId;
  int? monthlyScheduleRowId;
  String? fileName;
  String? fileUrl;
  String? title;
  String? startTime;
  String? endTime;

  DailySchedule(
      {this.monthlyScheduleDetailId,
        this.monthlyScheduleRowId,
        this.fileName,
        this.fileUrl,
        this.title,
        this.startTime,
        this.endTime});

  DailySchedule.fromJson(Map<String, dynamic> json) {
    monthlyScheduleDetailId = json['MonthlyScheduleDetailId'];
    monthlyScheduleRowId = json['MonthlyScheduleRowId'];
    fileName = json['FileName'];
    fileUrl = json['FileUrl'];
    title = json['Title'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MonthlyScheduleDetailId'] = monthlyScheduleDetailId;
    data['MonthlyScheduleRowId'] = monthlyScheduleRowId;
    data['FileName'] = fileName;
    data['FileUrl'] = fileUrl;
    data['Title'] = title;
    data['StartTime'] = startTime;
    data['EndTime'] = endTime;
    return data;
  }
}