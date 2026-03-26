abstract class HotelState{}
class HotelInitialState extends HotelState{}
class HotelAraiveState extends HotelState{}
class HotelLeftDateState extends HotelState{}

class GetHotelLoadingState extends HotelState{}
class GetHotelSuccessState extends HotelState{}
class GetHotelErrorState extends HotelState{
  final error;
  GetHotelErrorState(this.error);
}
class GetOneHotelLoadingState extends HotelState{}
class GetOneHotelSuccessState extends HotelState{}
class GetOneHotelErrorState extends HotelState{
  final error;
  GetOneHotelErrorState(this.error);
}