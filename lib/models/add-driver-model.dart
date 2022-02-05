class AddDriverRequest {
  AddDriverRequest({
    this.companyId,
    this.userId,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.state,
    this.roles,
  });

  String? companyId;
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? state;
  List<String>? roles;

  factory AddDriverRequest.fromJson(Map<String, dynamic> json) =>
      AddDriverRequest(
        companyId: json["companyId"],
        userId: json["userId"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "userId": userId,
        "name": name,
        "phone": phone,
        "email": email,
        "address": address,
        "city": city,
        "state": state,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
      };
}
