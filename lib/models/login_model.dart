class LoginResponse {
  String? message;
  int? code;
  Data? data;

  LoginResponse({this.message, this.code, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    code = json['Code'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Message'] = message;
    data['Code'] = code;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Token'] = token;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? profilePicture;
  int? userTypeId;
  String? userType;
  String? deviceId;

  User(
      {this.userId,
        this.name,
        this.email,
        this.phone,
        this.password,
        this.profilePicture,
        this.userTypeId,
        this.userType,
        this.deviceId});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    password = json['Password'];
    profilePicture = json['ProfilePicture'];
    userTypeId = json['UserTypeId'];
    userType = json['UserType'];
    deviceId = json['DeviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = userId;
    data['Name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Password'] = password;
    data['ProfilePicture'] = profilePicture;
    data['UserTypeId'] = userTypeId;
    data['UserType'] = userType;
    data['DeviceId'] = deviceId;
    return data;
  }
}