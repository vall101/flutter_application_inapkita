class Resepsionis {
  final String name;
  final String image;
  final String phone;
  final String email;
  final String? shift;

  Resepsionis({
    required this.name,
    required this.image,
    required this.phone,
    required this.email,
    this.shift,
  });

  factory Resepsionis.fromJson(Map<String, dynamic> json) => Resepsionis(
        name: json['name'],
        image: json['image'] ?? '',
        phone: json['phone'],
        email: json['email'],
        shift: json['shift'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'phone': phone,
        'email': email,
        'shift': shift,
      };
}
