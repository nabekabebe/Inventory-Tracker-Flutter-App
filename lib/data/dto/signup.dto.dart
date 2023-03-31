class SignupDto {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String managingToken;
  final int isManager;

  SignupDto(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.managingToken,
      required this.isManager});

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
        'managing_token': managingToken,
        'is_manager': isManager
      };
}
