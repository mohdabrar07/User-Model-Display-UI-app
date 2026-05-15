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

  // This factory constructor handles the "Unpacking"
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      // Unpacking the nested box
      address: json['address'] != null 
          ? Address.fromJson(json['address']) 
          : null,
    );
  }
}

class Address {
  final String city;
  final String street;

  Address({required this.city, required this.street});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
    );
  }
}