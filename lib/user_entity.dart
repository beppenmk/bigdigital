class UserEntity {
  final String? name;
  final String? email;
  final String? phone;

  UserEntity({this.name,required  this.email, this.phone});

  UserEntity copyWith({String? name, String? email, String? phone}) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() {
    return 'UserEntity{name: $name, email: $email, phone: $phone}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phone == other.phone;

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ phone.hashCode;
}