abstract class AirportState{}
class AirportInitialStates extends AirportState{}


class GetAirportLoadingState extends AirportState{}
class GetAirportSuccessState extends AirportState{}
class GetAirportErrorState extends AirportState{
  final error;
  GetAirportErrorState(this.error);
}
class GetOneAirportLoadingState extends AirportState{}
class GetOneAirportSuccessState extends AirportState{}
class GetOneAirportErrorState extends AirportState{
  final error;
  GetOneAirportErrorState(this.error);
}
