class MyContacts {
  String phone;
  String imagePath;
  String name;
  bool _selected = false;

  MyContacts({
    required this.phone,
    required this.imagePath,
    required this.name,
  });

  // Serialize the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'imagePath': imagePath,
      'name': name,
    };
  }

  //toggle checkbox
  void toggleSelected() {
    _selected = !_selected;
  }

  bool getSelected() {
    return _selected;
  }

  // Create an object from a JSON map
  factory MyContacts.fromJson(Map<String, dynamic> json) {
    return MyContacts(
      phone: json['phone'],
      imagePath: json['imagePath'],
      name: json['name'],
    );
  }
}
