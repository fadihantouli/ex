abstract class CountryAndCityState{}
class CountryAndCityInitialState extends CountryAndCityState{}

class GetCountryLoadingState extends CountryAndCityState{}
class GetCountrySuccessState extends CountryAndCityState{}
class GetCountryErrorState extends CountryAndCityState{
  final error;
  GetCountryErrorState(this.error);
}
class GetCityLoadingState extends CountryAndCityState{}
class GetCitySuccessState extends CountryAndCityState{}
class GetCityErrorState extends CountryAndCityState{
  final error;
  GetCityErrorState(this.error);
}