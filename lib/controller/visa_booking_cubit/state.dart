abstract class VisaBookingState{}
class VisaBookingInitialStates extends VisaBookingState{}
class GetVisaBookingImageByCamStates extends VisaBookingState{}
class GetVisaBookingImageByGalleryStates extends VisaBookingState{}
class ChangeCheckStates extends VisaBookingState{}
class VisaSelectDateStates extends VisaBookingState{}

class PostVisaBookingLoadingStates extends VisaBookingState{}
class PostVisaBookingSuccessStates extends VisaBookingState{}
class PostVisaBookingErrorStates extends VisaBookingState{
  final error;
  PostVisaBookingErrorStates(this.error);
}
