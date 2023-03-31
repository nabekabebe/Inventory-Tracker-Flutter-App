import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/base.dart';

@entity
class User extends BaseEntity {
  @primaryKey
  final int id;
  final String fullName;
  final String email;
  final String? emailVerifiedAt;
  final String phoneNumber;
  final String managingToken;
  final int isManager;
  final String? rememberToken;
  final String createdAt;
  final String updatedAt;

  User({
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
}
