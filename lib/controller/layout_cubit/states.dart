abstract class HomeStates{}
class GetCategoriesInitialStates extends HomeStates{}

class GetCategoriesLoadingStates extends HomeStates{}
class GetCategoriesSuccessStates extends HomeStates{}
class GetCategoriesErrorStates extends HomeStates{
  final error;
  GetCategoriesErrorStates(this.error);
}
class GetHotelsLoadingStates extends HomeStates{}
class GetHotelsSuccessStates extends HomeStates{}
class GetHotelsErrorStates extends HomeStates{
  final error;
  GetHotelsErrorStates(this.error);
}