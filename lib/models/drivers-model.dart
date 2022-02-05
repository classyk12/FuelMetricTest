List<DriversModel> driversModelFromMap(List<dynamic> data) {
  return List<DriversModel>.from(data.map((x) => DriversModel.fromJson(x)));
}

class DriversModel {
  DriversModel({
    this.name,
    this.phone,
    this.email,
    this.code,
    this.address,
    this.city,
    this.state,
    this.userId,
    this.driverLicense,
    this.companyId,
    this.dateAdded,
    this.companyName,
    this.assigned,
    this.vehicleAssigned,
    // this.roles,
    this.vehicles,
    this.id,
  });

  String? name;
  String? phone;
  String? email;
  String? code;
  String? address;
  String? city;
  String? state;
  String? userId;
  dynamic driverLicense;
  String? companyId;
  DateTime? dateAdded;
  String? companyName;
  int? assigned;
  bool? vehicleAssigned;
//  List<String>? roles;
  List<Vehicle>? vehicles;
  String? id;

  factory DriversModel.fromJson(Map<String, dynamic> json) => DriversModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        code: json["code"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        userId: json["userId"],
        driverLicense: json["driverLicense"],
        companyId: json["companyId"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        companyName: json["companyName"],
        assigned: json["assigned"],
        vehicleAssigned: json["vehicleAssigned"],
        // roles: List<String>.from(json["roles"].map((x) => x.map[x])),
        vehicles: List<Vehicle>.from(
            json["vehicles"].map((x) => Vehicle.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "code": code,
        "address": address,
        "city": city,
        "state": state,
        "userId": userId,
        "driverLicense": driverLicense,
        "companyId": companyId,
        "dateAdded": dateAdded!.toIso8601String(),
        "companyName": companyName,
        "assigned": assigned,
        "vehicleAssigned": vehicleAssigned,
        //  "roles": List<String>.from(roles!.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles!.map((x) => x.toJson())),
        "id": id,
      };
}

class Vehicle {
  Vehicle({
    this.plateNumber,
    this.vin,
    this.carMake,
    this.carModel,
    this.carModelYear,
    this.carReceiptId,
    this.dateAdded,
    this.track,
    this.type,
    this.ownerId,
    this.fuelConsumed,
    this.deleted,
    this.dateDeleted,
    this.id,
  });

  String? plateNumber;
  String? vin;
  String? carMake;
  String? carModel;
  int? carModelYear;
  dynamic carReceiptId;
  DateTime? dateAdded;
  bool? track;
  String? type;
  String? ownerId;
  int? fuelConsumed;
  bool? deleted;
  dynamic dateDeleted;
  String? id;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        plateNumber: json["plateNumber"],
        vin: json["vin"],
        carMake: json["carMake"],
        carModel: json["carModel"],
        carModelYear: json["carModelYear"],
        carReceiptId: json["carReceiptId"],
        dateAdded: DateTime.parse(json["dateAdded"]),
        track: json["track"],
        type: json["type"],
        ownerId: json["ownerId"],
        fuelConsumed: json["fuelConsumed"],
        deleted: json["deleted"],
        dateDeleted: json["dateDeleted"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "plateNumber": plateNumber,
        "vin": vin,
        "carMake": carMake,
        "carModel": carModel,
        "carModelYear": carModelYear,
        "carReceiptId": carReceiptId,
        "dateAdded": dateAdded!.toIso8601String(),
        "track": track,
        "type": type,
        "ownerId": ownerId,
        "fuelConsumed": fuelConsumed,
        "deleted": deleted,
        "dateDeleted": dateDeleted,
        "id": id,
      };
}
