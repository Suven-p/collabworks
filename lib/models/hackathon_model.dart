class HackathonModel {
  final String name;
  final String region;
  final String image;
  final String organizationName;

//<editor-fold desc="Data Methods">

  const HackathonModel({
    required this.name,
    required this.region,
    required this.image,
    required this.organizationName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HackathonModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          region == other.region &&
          image == other.image &&
          organizationName == other.organizationName);

  @override
  int get hashCode =>
      name.hashCode ^
      region.hashCode ^
      image.hashCode ^
      organizationName.hashCode;

  @override
  String toString() {
    return 'HackathonModel{' +
        ' name: $name,' +
        ' region: $region,' +
        ' image: $image,' +
        ' organizationName: $organizationName,' +
        '}';
  }

  HackathonModel copyWith({
    String? name,
    String? region,
    String? image,
    String? organizationName,
  }) {
    return HackathonModel(
      name: name ?? this.name,
      region: region ?? this.region,
      image: image ?? this.image,
      organizationName: organizationName ?? this.organizationName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'region': this.region,
      'image': this.image,
      'organizationName': this.organizationName,
    };
  }

  factory HackathonModel.fromMap(Map<String, dynamic> map) {
    return HackathonModel(
      name: map['name'] as String,
      region: map['region'] as String,
      image: map['image'] as String,
      organizationName: map['organizationName'] as String,
    );
  }

//</editor-fold>
}
