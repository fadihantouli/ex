abstract class CategoryState{}
class CategoryInitialState extends CategoryState{}

class GetCategoryLoadingState extends CategoryState{}
class GetCategorySuccessState extends CategoryState{}
class GetCategoryErrorState extends CategoryState{
  final error;
  GetCategoryErrorState(this.error);
}
class GetOneCategoryLoadingState extends CategoryState{}
class GetOneCategorySuccessState extends CategoryState{}
class GetOneCategoryErrorState extends CategoryState{
  final error;
  GetOneCategoryErrorState(this.error);
}
