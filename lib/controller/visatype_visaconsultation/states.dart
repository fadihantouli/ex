abstract class VisaTypeAndConsultationState{}
class VisaTypeAndConsultationInitialStates extends VisaTypeAndConsultationState{}


class GetVisaTypeLoadingState extends VisaTypeAndConsultationState{}
class GetVisaTypeSuccessState extends VisaTypeAndConsultationState{}
class GetVisaTypeErrorState extends VisaTypeAndConsultationState{
  final error;
  GetVisaTypeErrorState(this.error);
}
class PostVisaConsultationLoadingState extends VisaTypeAndConsultationState{}
class PostVisaConsultationSuccessState extends VisaTypeAndConsultationState{}
class PostVisaConsultationErrorState extends VisaTypeAndConsultationState{
  final error;
  PostVisaConsultationErrorState(this.error);
}
