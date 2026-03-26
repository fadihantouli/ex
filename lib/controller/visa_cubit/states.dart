abstract class VisaState{}
class VisaInitialStates extends VisaState{}

class VisaSelectDateStates extends VisaState{}

class PostVisa1LoadingStates extends VisaState{}
class PostVisa1SuccessStates extends VisaState{}
class PostVisa1ErrorStates extends VisaState{
  final error;
  PostVisa1ErrorStates(this.error);
}
class PostVisaCouponLoadingStates extends VisaState{}
class PostVisaCouponSuccessStates extends VisaState{}
class PostVisaCouponErrorStates extends VisaState{
  final error;
  PostVisaCouponErrorStates(this.error);
}
class GetOneVisaLoadingStates extends VisaState{}
class GetOneVisaSuccessStates extends VisaState{}
class GetOneVisaErrorStates extends VisaState{
  final error;
  GetOneVisaErrorStates(this.error);
}
class GetCitiesLoadingStates extends VisaState{}
class GetCitiesSuccessStates extends VisaState{}
class GetCitiesErrorStates extends VisaState{
  final error;
  GetCitiesErrorStates(this.error);
}class GetVisaLoadingStates extends VisaState{}
class GetVisaSuccessStates extends VisaState{}
class GetVisaErrorStates extends VisaState{
  final error;
  GetVisaErrorStates(this.error);
}