class OrganizationModel {
  final String name;
  final String image;
  final String email;
  final String password;
  final String confirmPassword;

//<editor-fold desc="Data Methods">

  const OrganizationModel({
    required this.name,
    required this.image,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          email == other.email &&
          password == other.password &&
          confirmPassword == other.confirmPassword);

  @override
  int get hashCode =>
      name.hashCode ^
      image.hashCode ^
      email.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode;

  @override
  String toString() {
    return 'OrganizationModel{' +
        ' name: $name,' +
        ' image: $image,' +
        ' email: $email,' +
        ' password: $password,' +
        ' confirmPassword: $confirmPassword,' +
        '}';
  }

  OrganizationModel copyWith({
    String? name,
    String? image,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return OrganizationModel(
      name: name ?? this.name,
      image: image ?? this.image,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'email': this.email,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      name: map['name'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

//</editor-fold>
}
