abstract class FAQStates{}
class FAQInitialState extends FAQStates{}

class GetFAQLoadingState extends FAQStates{}
class GetFAQSuccessState extends FAQStates{}
class GetFAQErrorState extends FAQStates{
  final error;
  GetFAQErrorState(this.error);
}