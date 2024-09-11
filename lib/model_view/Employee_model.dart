import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) => List<EmployeeModel>.from(json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
    DateTime? createdAt;
    String name;
    String avatar;
    String emailId;
    String mobile;
    String country;
    String state;
    String district;
    String id;
    String? email;

    EmployeeModel({
        required this.createdAt,
        required this.name,
        required this.avatar,
        required this.emailId,
        required this.mobile,
        required this.country,
        required this.state,
        required this.district,
        required this.id,
        this.email,
    });

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        emailId: json["emailId"],
        mobile: json["mobile"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        id: json["id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "emailId": emailId,
        "mobile": mobile,
        "country": country,
        "state": state,
        "district": district,
        "id": id,
        "email": email,
    };
}
