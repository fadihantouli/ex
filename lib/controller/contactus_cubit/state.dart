abstract class ContactUsStates{}
class ContactUsInitialState extends ContactUsStates{}

class PostContactUsLoadingState extends ContactUsStates{}
class PostContactUsSuccessState extends ContactUsStates{}
class PostContactUsErrorState extends ContactUsStates{
  final error;
  PostContactUsErrorState(this.error);
}