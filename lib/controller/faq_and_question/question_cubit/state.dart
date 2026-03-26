abstract class QuestionStates{}
class QuestionInitialState extends QuestionStates{}

class GetQuestionLoadingState extends QuestionStates{}
class GetQuestionSuccessState extends QuestionStates{}
class GetQuestionErrorState extends QuestionStates{
  final error;
  GetQuestionErrorState(this.error);
}