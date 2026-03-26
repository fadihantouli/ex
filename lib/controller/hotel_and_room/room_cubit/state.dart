abstract class RoomState{}
class RoomInitialState extends RoomState{}

class GetRoomLoadingState extends RoomState{}
class GetRoomSuccessState extends RoomState{}
class GetRoomErrorState extends RoomState{
  final error;
  GetRoomErrorState(this.error);
}
class GetOneRoomLoadingState extends RoomState{}
class GetOneRoomSuccessState extends RoomState{}
class GetOneRoomErrorState extends RoomState{
  final error;
  GetOneRoomErrorState(this.error);
}