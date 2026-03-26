abstract class TicketState{}
class TicketInitialStates extends TicketState{}


class GetTicketLoadingState extends TicketState{}
class GetTicketSuccessState extends TicketState{}
class GetTicketErrorState extends TicketState{
  final error;
  GetTicketErrorState(this.error);
}
class GetOneTicketLoadingState extends TicketState{}
class GetOneTicketSuccessState extends TicketState{}
class GetOneTicketErrorState extends TicketState{
  final error;
  GetOneTicketErrorState(this.error);
}
