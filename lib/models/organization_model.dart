class OrganizationModel {
  final String name;
  final String image;
  final String email;
  final String password;

//<editor-fold desc="Data Methods">

  const OrganizationModel({
    required this.name,
    required this.image,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode =>
      name.hashCode ^ image.hashCode ^ email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'OrganizationModel{' +
        ' name: $name,' +
        ' image: $image,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  OrganizationModel copyWith({
    String? name,
    String? image,
    String? email,
    String? password,
  }) {
    return OrganizationModel(
      name: name ?? this.name,
      image: image ?? this.image,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'email': this.email,
      'password': this.password,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      name: map['name'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
