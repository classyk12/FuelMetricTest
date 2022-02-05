class LoginSuccessResponseModel {
  LoginSuccessResponseModel({
    this.token,
    this.fullName,
    this.email,
    this.phone,
    this.roles,
    this.isDeveloper,
    this.avatar,
    this.developer,
    this.isActive,
    this.country,
  });

  String? token;
  String? fullName;
  String? email;
  String? phone;
  List<String>? roles;
  bool? isDeveloper;
  dynamic avatar;
  dynamic developer;
  bool? isActive;
  Country? country;

  factory LoginSuccessResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginSuccessResponseModel(
        token: json["token"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        isDeveloper: json["isDeveloper"],
        avatar: json["avatar"],
        developer: json["developer"],
        isActive: json["isActive"],
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "isDeveloper": isDeveloper,
        "avatar": avatar,
        "developer": developer,
        "isActive": isActive,
        "country": country!.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.currency,
    this.code,
    this.utcTime,
    this.currencyName,
    this.currencyHtmlDisplay,
    this.states,
    this.id,
  });

  String? name;
  String? currency;
  String? code;
  int? utcTime;
  String? currencyName;
  String? currencyHtmlDisplay;
  dynamic states;
  String? id;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        currency: json["currency"],
        code: json["code"],
        utcTime: json["utcTime"],
        currencyName: json["currencyName"],
        currencyHtmlDisplay: json["currencyHTMLDisplay"],
        states: json["states"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "currency": currency,
        "code": code,
        "utcTime": utcTime,
        "currencyName": currencyName,
        "currencyHTMLDisplay": currencyHtmlDisplay,
        "states": states,
        "id": id,
      };
}
