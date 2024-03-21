class UserModelReq {
  String? status;
  UserModel? userModel;

  UserModelReq({this.status, this.userModel});

  UserModelReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userModel = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (userModel != null) {
      data['data'] = userModel!.toJson();
    }
    return data;
  }
}

class UserModel {
  int? id;
  String? username;
  String? email;
  String? emailActive;
  String? firstName;
  String? lastName;
  String? userType;
  String? avatar;
  String? balance;
  String? phone;
  int? active;
  int? groupId;
  int? countryId;
  int? fixedGroupId;
  dynamic telegramId;
  String? apiToken;
  String? withdrawalLimit;
  String? lang;
  int? currencyId;
  dynamic agentRef;
  dynamic refCode;
  int? otpEnable;
  String? provider2fa;
  dynamic apiIp;
  int? enableApi;
  dynamic hook;
  String? groupName;
  String? groupLogo;
  String? permission;
  String? symbol;
  String? currencyCode;
  String? currencyPrice;
  int? credit;
  num? lastPurchases;

  UserModel(
      {this.id,
        this.username,
        this.email,
        this.emailActive,
        this.firstName,
        this.lastName,
        this.userType,
        this.avatar,
        this.balance,
        this.phone,
        this.active,
        this.groupId,
        this.countryId,
        this.fixedGroupId,
        this.telegramId,
        this.apiToken,
        this.withdrawalLimit,
        this.lang,
        this.currencyId,
        this.agentRef,
        this.refCode,
        this.otpEnable,
        this.provider2fa,
        this.apiIp,
        this.enableApi,
        this.hook,
        this.groupName,
        this.groupLogo,
        this.permission,
        this.symbol,
        this.currencyCode,
        this.currencyPrice,
        this.credit,
        this.lastPurchases});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    emailActive = json['email_active'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    avatar = json['avatar'];
    balance = json['balance'];
    phone = json['phone'];
    active = json['active'];
    groupId = json['group_id'];
    countryId = json['country_id'];
    fixedGroupId = json['fixed_group_id'];
    telegramId = json['telegram_id'];
    apiToken = json['api_token'];
    withdrawalLimit = json['withdrawal_limit'];
    lang = json['lang'];
    currencyId = json['currency_id'];
    agentRef = json['agent_ref'];
    refCode = json['ref_code'];
    otpEnable = json['otp_enable'];
    provider2fa = json['provider_2fa'];
    apiIp = json['api_ip'];
    enableApi = json['enable_api'];
    hook = json['hook'];
    groupName = json['group_name'];
    groupLogo = json['group_logo'];
    permission = json['permission'];
    symbol = json['symbol'];
    currencyCode = json['currencyCode'];
    currencyPrice = json['currencyPrice'];
    credit = json['credit'];
    lastPurchases = json['last_purchases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['email_active'] = emailActive;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['user_type'] = userType;
    data['avatar'] = avatar;
    data['balance'] = balance;
    data['phone'] = phone;
    data['active'] = active;
    data['group_id'] = groupId;
    data['country_id'] = countryId;
    data['fixed_group_id'] = fixedGroupId;
    data['telegram_id'] = telegramId;
    data['api_token'] = apiToken;
    data['withdrawal_limit'] = withdrawalLimit;
    data['lang'] = lang;
    data['currency_id'] = currencyId;
    data['agent_ref'] = agentRef;
    data['ref_code'] = refCode;
    data['otp_enable'] = otpEnable;
    data['provider_2fa'] = provider2fa;
    data['api_ip'] = apiIp;
    data['enable_api'] = enableApi;
    data['hook'] = hook;
    data['group_name'] = groupName;
    data['group_logo'] = groupLogo;
    data['permission'] = permission;
    data['symbol'] = symbol;
    data['currencyCode'] = currencyCode;
    data['currencyPrice'] = currencyPrice;
    data['credit'] = credit;
    data['last_purchases'] = lastPurchases;
    return data;
  }
}
