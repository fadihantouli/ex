
abstract class MainState{}
class MainInitialState extends MainState{}

class MainLoadingState extends MainState{}
class MainSuccessState extends MainState{}
class MainErrorState extends MainState{
  final error;
  MainErrorState(this.error);
}