abstract class ProfileState{}

class ProfileInitialState extends ProfileState{}
class GetProfileImageByCamStates extends ProfileState{}
class GetProfileImageByGalleryStates extends ProfileState{}

class GetProfileLoading extends ProfileState{}
class GetProfileSuccess extends ProfileState{}
class GetProfileError extends ProfileState{
  final error;
  GetProfileError(this.error);
}class LogoutLoading extends ProfileState{}
class LogoutSuccess extends ProfileState{}
class LogoutError extends ProfileState{
  final error;
  LogoutError(this.error);
}class GetBookingLoading extends ProfileState{}
class GetBookingSuccess extends ProfileState{}
class GetBookingError extends ProfileState{
  final error;
  GetBookingError(this.error);
}
class UpdateProfileLoading extends ProfileState{}
class UpdateProfileSuccess extends ProfileState{}
class UpdateProfileError extends ProfileState{
  final error;
  UpdateProfileError(this.error);
}