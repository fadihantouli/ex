abstract class BranchStates{}
class BranchInitialState extends BranchStates{}

class GetBranchLoadingState extends BranchStates{}
class GetBranchSuccessState extends BranchStates{}
class GetBranchErrorState extends BranchStates{
  final error;
  GetBranchErrorState(this.error);
}