import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/dto/auth_response.dto.dart';
import 'package:inventory_tracker/data/dto/signup.dto.dart';

abstract class IAuthRepository {
  late final ApiService apiService;

  IAuthRepository(this.apiService);

  Stream<Resource<AuthResponse>> login(String email, String password);

  Stream<Resource<AuthResponse>> signup(SignupDto info);
}
