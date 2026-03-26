abstract class DrawerStates{}
class DrawerInitialStates extends DrawerStates{}

class GetFaqLoadingStates extends DrawerStates{}
class GetFaqSuccessStates extends DrawerStates{}
class GetFaqErrorStates extends DrawerStates{
  final error;
  GetFaqErrorStates(this.error);
}