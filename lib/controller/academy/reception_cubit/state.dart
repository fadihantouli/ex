abstract class ReceptionState{}
class ReceptionInitialState extends ReceptionState{}

class GetReceptionLoadingState extends ReceptionState{}
class GetReceptionSuccessState extends ReceptionState{}
class GetReceptionErrorState extends ReceptionState{
  final error;
  GetReceptionErrorState(this.error);
}
class GetOneReceptionLoadingState extends ReceptionState{}
class GetOneReceptionSuccessState extends ReceptionState{}
class GetOneReceptionErrorState extends ReceptionState{
  final error;
  GetOneReceptionErrorState(this.error);
}