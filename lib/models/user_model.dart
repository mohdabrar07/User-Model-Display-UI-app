import 'address_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final Address? address;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      
      address: json['address'] != null 
          ? Address.fromJson(json['address']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address?.toJson(),
    };
  }
}