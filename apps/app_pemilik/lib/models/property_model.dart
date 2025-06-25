class Property {
  final String name;
  final String address;
  final String? desc;
  final String image;

  Property({
    required this.name,
    required this.address,
    this.desc,
    required this.image,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        name: json['name'],
        address: json['address'],
        desc: json['desc'],
        image: json['image'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'desc': desc,
        'image': image,
      };
}
