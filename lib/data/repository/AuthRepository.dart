import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/dto/auth_response.dto.dart';
import 'package:inventory_tracker/data/dto/signup.dto.dart';
import 'package:inventory_tracker/domain/repository/IAuthRepository.dart';

class AuthRepository implements IAuthRepository {
  @override
  ApiService apiService;

  AuthRepository(this.apiService) : super();

  @override
  Stream<Resource<AuthResponse>> login(String email, String password) async* {
    yield const Resource.Loading(null);

    final result =
        await apiService.auth.login({'email': email, 'password': password});

    yield result.fold((error) => Resource.Error(error.message, null),
        (AuthResponse resp) => Resource.Success(resp));
  }

  @override
  Stream<Resource<AuthResponse>> signup(SignupDto info) async* {
    yield const Resource.Loading(null);

    final result = await apiService.auth.signup(info.toJson());

    yield result.fold((error) => Resource.Error(error.message, null),
        (AuthResponse resp) => Resource.Success(resp));
  }
}
