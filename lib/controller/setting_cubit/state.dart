abstract class SettingStates{}
class SettingInitialState extends SettingStates{}

class GetSettingLoadingState extends SettingStates{}
class GetSettingSuccessState extends SettingStates{}
class GetSettingErrorState extends SettingStates{
  final error;
  GetSettingErrorState(this.error);
}