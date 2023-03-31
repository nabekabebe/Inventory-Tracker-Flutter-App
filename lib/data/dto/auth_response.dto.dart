import 'package:inventory_tracker/data/dto/user.dto.dart';
import 'package:inventory_tracker/domain/entity/user.dart';

class AuthResponse {
  late final String token;
  late final User user;

  AuthResponse(this.token, this.user);

  AuthResponse.fromJson(Map<String, dynamic> json) {
    token = json['token']!;
    user = UserDto.fromJson(json['user']!).toUserEntity();
  }
}
