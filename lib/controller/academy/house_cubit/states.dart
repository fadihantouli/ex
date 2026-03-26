abstract class HouseState{}
class HouseInitialState extends HouseState{}

class GetHouseLoadingState extends HouseState{}
class GetHouseSuccessState extends HouseState{}
class GetHouseErrorState extends HouseState{
  final error;
  GetHouseErrorState(this.error);
}
class GetOneHouseLoadingState extends HouseState{}
class GetOneHouseSuccessState extends HouseState{}
class GetOneHouseErrorState extends HouseState{
  final error;
  GetOneHouseErrorState(this.error);
}