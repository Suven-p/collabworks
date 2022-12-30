class HackerModel {
  final String name;
  final String age;
  final String phoneNumber;
  final String profilePicture;
  final String email;
  final String password;

//<editor-fold desc="Data Methods">

  const HackerModel({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.profilePicture,
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HackerModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          phoneNumber == other.phoneNumber &&
          profilePicture == other.profilePicture &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode =>
      name.hashCode ^
      age.hashCode ^
      phoneNumber.hashCode ^
      profilePicture.hashCode ^
      email.hashCode ^
      password.hashCode;

  @override
  String toString() {
    return 'HackerModel{' +
        ' name: $name,' +
        ' age: $age,' +
        ' phoneNumber: $phoneNumber,' +
        ' profilePicture: $profilePicture,' +
        ' email: $email,' +
        ' password: $password,' +
        '}';
  }

  HackerModel copyWith({
    String? name,
    String? age,
    String? phoneNumber,
    String? profilePicture,
    String? email,
    String? password,
  }) {
    return HackerModel(
      name: name ?? this.name,
      age: age ?? this.age,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'age': this.age,
      'phoneNumber': this.phoneNumber,
      'profilePicture': this.profilePicture,
      'email': this.email,
      'password': this.password,
    };
  }

  factory HackerModel.fromMap(Map<String, dynamic> map) {
    return HackerModel(
      name: map['name'] as String,
      age: map['age'] as String,
      phoneNumber: map['phoneNumber'] as String,
      profilePicture: map['profilePicture'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
