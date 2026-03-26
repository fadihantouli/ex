abstract class AccreditationState{}
class AccreditationInitialState extends AccreditationState{}

class GetAccreditationLoadingState extends AccreditationState{}
class GetAccreditationSuccessState extends AccreditationState{}
class GetAccreditationErrorState extends AccreditationState{
  final error;
  GetAccreditationErrorState(this.error);
}
class GetOneAccreditationLoadingState extends AccreditationState{}
class GetOneAccreditationSuccessState extends AccreditationState{}
class GetOneAccreditationErrorState extends AccreditationState{
  final error;
  GetOneAccreditationErrorState(this.error);
}