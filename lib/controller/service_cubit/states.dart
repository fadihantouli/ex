abstract class ServiceState{}
class ServiceInitialStates extends ServiceState{}
class ServiceSelectDateStates extends ServiceState{}
class GetProfileImageByCamStates extends ServiceState{}
class GetProfileImageByGalleryStates extends ServiceState{}


class GetServiceLoadingState extends ServiceState{}
class GetServiceSuccessState extends ServiceState{}
class GetServiceErrorState extends ServiceState{
  final error;
  GetServiceErrorState(this.error);
}
class PostPaymentLoadingState extends ServiceState{}
class PostPaymentSuccessState extends ServiceState{
  final url;
  PostPaymentSuccessState({this.url});
}
class PostPaymentErrorState extends ServiceState{
  final error;
  PostPaymentErrorState(this.error);
}
class PostServiceLoadingState extends ServiceState{}
class PostServiceSuccessState extends ServiceState{
  final id;
  PostServiceSuccessState(this.id);
}
class PostServiceErrorState extends ServiceState{
  final error;
  PostServiceErrorState(this.error);
}
class GetOneServiceLoadingState extends ServiceState{}
class GetOneServiceSuccessState extends ServiceState{}
class GetOneServiceErrorState extends ServiceState{
  final error;
  GetOneServiceErrorState(this.error);
}

class GetServiceTypeLoadingState extends ServiceState{}
class GetServiceTypeSuccessState extends ServiceState{}
class GetServiceTypeErrorState extends ServiceState{
  final error;
  GetServiceTypeErrorState(this.error);
}