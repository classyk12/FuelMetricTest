class GetCompanyDetailsModel {
  GetCompanyDetailsModel({
    this.message,
    this.status,
    this.data,
  });

  String? message;
  String? status;
  CompanyDetailData? data;

  factory GetCompanyDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetCompanyDetailsModel(
        message: json["message"],
        status: json["status"],
        data: CompanyDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data!.toJson(),
      };
}

class CompanyDetailData {
  CompanyDetailData({
    this.company,
    this.wallet,
  });

  Company? company;
  Wallet? wallet;

  factory CompanyDetailData.fromJson(Map<String, dynamic> json) =>
      CompanyDetailData(
        company: Company.fromJson(json["company"]),
        wallet: Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "company": company!.toJson(),
        "wallet": wallet!.toJson(),
      };
}

class Company {
  Company({
    this.name,
    this.userId,
    this.email,
    this.address,
    this.city,
    this.state,
    this.country,
    this.logoId,
    this.parentId,
    this.isActive,
    this.dateRegistered,
    this.businessType,
    this.rcNumber,
    this.contactPhone,
    this.baseCurrency,
    this.bvnId,
    this.bvn,
    this.isSubAccount,
    this.logoUrl,
    this.documents,
    this.id,
  });

  String? name;
  String? userId;
  String? email;
  String? address;
  String? city;
  String? state;
  String? country;
  String? logoId;
  dynamic parentId;
  bool? isActive;
  DateTime? dateRegistered;
  String? businessType;
  String? rcNumber;
  String? contactPhone;
  String? baseCurrency;
  dynamic bvnId;
  dynamic bvn;
  bool? isSubAccount;
  String? logoUrl;
  dynamic documents;
  String? id;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        userId: json["userId"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        logoId: json["logoId"],
        parentId: json["parentId"],
        isActive: json["isActive"],
        dateRegistered: DateTime.parse(json["dateRegistered"]),
        businessType: json["businessType"],
        rcNumber: json["rcNumber"],
        contactPhone: json["contactPhone"],
        baseCurrency: json["baseCurrency"],
        bvnId: json["bvnId"],
        bvn: json["bvn"],
        isSubAccount: json["isSubAccount"],
        logoUrl: json["logoUrl"],
        documents: json["documents"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "userId": userId,
        "email": email,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "logoId": logoId,
        "parentId": parentId,
        "isActive": isActive,
        "dateRegistered": dateRegistered!.toIso8601String(),
        "businessType": businessType,
        "rcNumber": rcNumber,
        "contactPhone": contactPhone,
        "baseCurrency": baseCurrency,
        "bvnId": bvnId,
        "bvn": bvn,
        "isSubAccount": isSubAccount,
        "logoUrl": logoUrl,
        "documents": documents,
        "id": id,
      };
}

class Wallet {
  Wallet({
    this.ownerId,
    this.dateCreated,
    this.dateModified,
    this.balance,
    this.creditLimit,
    this.walletType,
    this.walletUnit,
    this.deleted,
    this.dateDeleted,
    this.parentId,
    this.friendlyName,
    this.target,
    this.walletTransactions,
    this.id,
  });

  String? ownerId;
  DateTime? dateCreated;
  DateTime? dateModified;
  num? balance;
  num? creditLimit;
  String? walletType;
  String? walletUnit;
  bool? deleted;
  dynamic dateDeleted;
  dynamic parentId;
  String? friendlyName;
  String? target;
  dynamic walletTransactions;
  String? id;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        ownerId: json["ownerId"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
        balance: json["balance"],
        creditLimit: json["creditLimit"],
        walletType: json["walletType"],
        walletUnit: json["walletUnit"],
        deleted: json["deleted"],
        dateDeleted: json["dateDeleted"],
        parentId: json["parentId"],
        friendlyName: json["friendlyName"],
        target: json["target"],
        walletTransactions: json["walletTransactions"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ownerId": ownerId,
        "dateCreated": dateCreated!.toIso8601String(),
        "dateModified": dateModified!.toIso8601String(),
        "balance": balance,
        "creditLimit": creditLimit,
        "walletType": walletType,
        "walletUnit": walletUnit,
        "deleted": deleted,
        "dateDeleted": dateDeleted,
        "parentId": parentId,
        "friendlyName": friendlyName,
        "target": target,
        "walletTransactions": walletTransactions,
        "id": id,
      };
}
