import '../../domain/entity/user.dart';

class UserDto {
  late final int id;
  late final String fullName;
  late final String email;
  late final String? emailVerifiedAt;
  late final String phoneNumber;
  late final String managingToken;
  late final int isManager;
  late final String? rememberToken;
  late final String createdAt;
  late final String updatedAt;

  UserDto({
    required this.id,
    required this.fullName,
    required this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    required this.managingToken,
    required this.isManager,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    managingToken = json['managing_token'];
    isManager = json['is_manager'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['phone_number'] = phoneNumber;
    map['managing_token'] = managingToken;
    map['is_manager'] = isManager;
    map['remember_token'] = rememberToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  User toUserEntity() {
    return User(
        id: id,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        managingToken: managingToken,
        isManager: isManager,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}
