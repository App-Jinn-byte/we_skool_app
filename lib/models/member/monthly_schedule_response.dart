// class MonthlyScheduleResponse {
//   String? message;
//   int? code;
//   Data? data;
//
//   MonthlyScheduleResponse({this.message, this.code, this.data});
//
//   MonthlyScheduleResponse.fromJson(Map<String, dynamic> json) {
//     message = json['Message'];
//     code = json['Code'];
//     data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Message'] = this.message;
//     data['Code'] = this.code;
//     if (this.data != null) {
//       data['Data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   MonthlySchedule? monthlySchedule;
//
//   Data({this.monthlySchedule});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     monthlySchedule = json['MonthlySchedule'] != null
//         ? new MonthlySchedule.fromJson(json['MonthlySchedule'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.monthlySchedule != null) {
//       data['MonthlySchedule'] = this.monthlySchedule!.toJson();
//     }
//     return data;
//   }
// }
//
// class MonthlySchedule {
//   MonthlySchedule? monthlySchedule;
//   String? month;
//   MonthData? monthData;
//
//   MonthlySchedule({this.monthlySchedule, this.month, this.monthData});
//
//   MonthlySchedule.fromJson(Map<String, dynamic> json) {
//     monthlySchedule = json['MonthlySchedule'] != null
//         ? new MonthlySchedule.fromJson(json['MonthlySchedule'])
//         : null;
//     month = json['Month'];
//     monthData = json['MonthData'] != null
//         ? new MonthData.fromJson(json['MonthData'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.monthlySchedule != null) {
//       data['MonthlySchedule'] = this.monthlySchedule!.toJson();
//     }
//     data['Month'] = this.month;
//     if (this.monthData != null) {
//       data['MonthData'] = this.monthData!.toJson();
//     }
//     return data;
//   }
// }
//
// class MonthlySchedule {
//   int? monthlyScheduleId;
//   String? code;
//   int? classId;
//   int? monthlyFrameworkId;
//   int? monthId;
//   int? year;
//   String? title;
//   String? description;
//   bool? isApproved;
//   bool? isTemplate;
//   List<MonthlyScheduleRows>? monthlyScheduleRows;
//
//   MonthlySchedule(
//       {this.monthlyScheduleId,
//         this.code,
//         this.classId,
//         this.monthlyFrameworkId,
//         this.monthId,
//         this.year,
//         this.title,
//         this.description,
//         this.isApproved,
//         this.isTemplate,
//         this.monthlyScheduleRows});
//
//   MonthlySchedule.fromJson(Map<String, dynamic> json) {
//     monthlyScheduleId = json['MonthlyScheduleId'];
//     code = json['Code'];
//     classId = json['ClassId'];
//     monthlyFrameworkId = json['MonthlyFrameworkId'];
//     monthId = json['MonthId'];
//     year = json['Year'];
//     title = json['Title'];
//     description = json['Description'];
//     isApproved = json['IsApproved'];
//     isTemplate = json['IsTemplate'];
//     if (json['MonthlyScheduleRows'] != null) {
//       monthlyScheduleRows = <MonthlyScheduleRows>[];
//       json['MonthlyScheduleRows'].forEach((v) {
//         monthlyScheduleRows!.add(new MonthlyScheduleRows.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['MonthlyScheduleId'] = this.monthlyScheduleId;
//     data['Code'] = this.code;
//     data['ClassId'] = this.classId;
//     data['MonthlyFrameworkId'] = this.monthlyFrameworkId;
//     data['MonthId'] = this.monthId;
//     data['Year'] = this.year;
//     data['Title'] = this.title;
//     data['Description'] = this.description;
//     data['IsApproved'] = this.isApproved;
//     data['IsTemplate'] = this.isTemplate;
//     if (this.monthlyScheduleRows != null) {
//       data['MonthlyScheduleRows'] =
//           this.monthlyScheduleRows!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MonthlyScheduleRows {
//   int? monthlyScheduleRowId;
//   int? monthlyScheduleId;
//   String? startTime;
//   String? endTime;
//   int? weekNo;
//   int? rowId;
//   List<MonthlyScheduleDetails>? monthlyScheduleDetails;
//
//   MonthlyScheduleRows(
//       {this.monthlyScheduleRowId,
//         this.monthlyScheduleId,
//         this.startTime,
//         this.endTime,
//         this.weekNo,
//         this.rowId,
//         this.monthlyScheduleDetails});
//
//   MonthlyScheduleRows.fromJson(Map<String, dynamic> json) {
//     monthlyScheduleRowId = json['MonthlyScheduleRowId'];
//     monthlyScheduleId = json['MonthlyScheduleId'];
//     startTime = json['StartTime'];
//     endTime = json['EndTime'];
//     weekNo = json['WeekNo'];
//     rowId = json['RowId'];
//     if (json['MonthlyScheduleDetails'] != null) {
//       monthlyScheduleDetails = <MonthlyScheduleDetails>[];
//       json['MonthlyScheduleDetails'].forEach((v) {
//         monthlyScheduleDetails!.add(new MonthlyScheduleDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['MonthlyScheduleRowId'] = this.monthlyScheduleRowId;
//     data['MonthlyScheduleId'] = this.monthlyScheduleId;
//     data['StartTime'] = this.startTime;
//     data['EndTime'] = this.endTime;
//     data['WeekNo'] = this.weekNo;
//     data['RowId'] = this.rowId;
//     if (this.monthlyScheduleDetails != null) {
//       data['MonthlyScheduleDetails'] =
//           this.monthlyScheduleDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MonthlyScheduleDetails {
//   int? monthlyScheduleDetailId;
//   int? monthlyScheduleRowId;
//   int? identifier;
//   int? dayId;
//   int? weekNo;
//   String? fileName;
//   String? fileUrl;
//   String? title;
//   Null? description;
//   String? boxId;
//
//   MonthlyScheduleDetails(
//       {this.monthlyScheduleDetailId,
//         this.monthlyScheduleRowId,
//         this.identifier,
//         this.dayId,
//         this.weekNo,
//         this.fileName,
//         this.fileUrl,
//         this.title,
//         this.description,
//         this.boxId});
//
//   MonthlyScheduleDetails.fromJson(Map<String, dynamic> json) {
//     monthlyScheduleDetailId = json['MonthlyScheduleDetailId'];
//     monthlyScheduleRowId = json['MonthlyScheduleRowId'];
//     identifier = json['Identifier'];
//     dayId = json['DayId'];
//     weekNo = json['WeekNo'];
//     fileName = json['FileName'];
//     fileUrl = json['FileUrl'];
//     title = json['Title'];
//     description = json['Description'];
//     boxId = json['BoxId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['MonthlyScheduleDetailId'] = this.monthlyScheduleDetailId;
//     data['MonthlyScheduleRowId'] = this.monthlyScheduleRowId;
//     data['Identifier'] = this.identifier;
//     data['DayId'] = this.dayId;
//     data['WeekNo'] = this.weekNo;
//     data['FileName'] = this.fileName;
//     data['FileUrl'] = this.fileUrl;
//     data['Title'] = this.title;
//     data['Description'] = this.description;
//     data['BoxId'] = this.boxId;
//     return data;
//   }
// }
//
// class MonthData {
//   int? weeks;
//   String? month;
//   int? firstDay;
//   int? lastDay;
//
//   MonthData({this.weeks, this.month, this.firstDay, this.lastDay});
//
//   MonthData.fromJson(Map<String, dynamic> json) {
//     weeks = json['Weeks'];
//     month = json['Month'];
//     firstDay = json['FirstDay'];
//     lastDay = json['LastDay'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Weeks'] = this.weeks;
//     data['Month'] = this.month;
//     data['FirstDay'] = this.firstDay;
//     data['LastDay'] = this.lastDay;
//     return data;
//   }
// }