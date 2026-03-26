abstract class HomeStates{}
class HomeInitialState extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}
class GetHomeSuccessState extends HomeStates{}
class GetHomeErrorState extends HomeStates{
  final error;
  GetHomeErrorState(this.error);
}