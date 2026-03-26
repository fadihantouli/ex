abstract class AuthStates{}
class AuthInitialStates extends AuthStates{}

class LoginLoadingStates extends AuthStates{}
class LoginSuccessStates extends AuthStates{
  final token;
  final id;
  final loginMessage;
  LoginSuccessStates(this.token, this.id,this.loginMessage);
}
class LoginErrorStates extends AuthStates{
  final error;
  LoginErrorStates(this.error);
}class LoginVerifyLoadingStates extends AuthStates{}
class LoginVerifySuccessStates extends AuthStates{
  final token;
  final id;
  final loginMessage;
  LoginVerifySuccessStates(this.token, this.id, this.loginMessage);
}
class LoginVerifyErrorStates extends AuthStates{
  final error;
  LoginVerifyErrorStates(this.error);
}
class RegisterLoadingStates extends AuthStates{}
class RegisterSuccessStates extends AuthStates{}
class RegisterErrorStates extends AuthStates{
  final error;
  RegisterErrorStates(this.error);
}
class UpdatePasswordLoadingStates extends AuthStates{}
class UpdatePasswordSuccessStates extends AuthStates{}
class UpdatePasswordErrorStates extends AuthStates{
  final error;
  UpdatePasswordErrorStates(this.error);
}
class VerificationPasswordLoadingStates extends AuthStates{}
class VerificationPasswordSuccessStates extends AuthStates{}
class VerificationPasswordErrorStates extends AuthStates{
  final error;
  VerificationPasswordErrorStates(this.error);
}
class ForgetPasswordLoadingStates extends AuthStates{}
class ForgetPasswordSuccessStates extends AuthStates{}
class ForgetPasswordErrorStates extends AuthStates{
  final error;
  ForgetPasswordErrorStates(this.error);
}