class LoginUserModelReq {
  String? status;
  LoginUserModel? loginUserModel;

  LoginUserModelReq({this.status, this.loginUserModel});

  LoginUserModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    loginUserModel = json['data'] != null ? LoginUserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (loginUserModel != null) {
      data['data'] = loginUserModel!.toJson();
    }
    return data;
  }
}

class LoginUserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? userType;
  String? avatar;
  String? balance;
  int? active;
  String? phone;
  String? telegramId;
  String? provider2fa;
  String? code2fa;
  String? expire2faAt;
  String? token;

  LoginUserModel(
      {this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.userType,
        this.avatar,
        this.balance,
        this.active,
        this.phone,
        this.telegramId,
        this.provider2fa,
        this.code2fa,
        this.expire2faAt,
        this.token});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    avatar = json['avatar'];
    balance = json['balance'];
    active = json['active'];
    phone = json['phone'];
    telegramId = json['telegram_id'];
    provider2fa = json['provider_2fa'];
    code2fa = json['code_2fa'];
    expire2faAt = json['expire_2fa_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_type'] = userType;
    data['avatar'] = avatar;
    data['balance'] = balance;
    data['active'] = active;
    data['phone'] = phone;
    data['telegram_id'] = telegramId;
    data['provider_2fa'] = provider2fa;
    data['code_2fa'] = code2fa;
    data['expire_2fa_at'] = expire2faAt;
    data['token'] = token;
    return data;
  }
}
