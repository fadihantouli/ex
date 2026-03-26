abstract class InsuranceState{}
class InsuranceInitialState extends InsuranceState{}

class GetInsuranceLoadingState extends InsuranceState{}
class GetInsuranceSuccessState extends InsuranceState{}
class GetInsuranceErrorState extends InsuranceState{
  final error;
  GetInsuranceErrorState(this.error);
}
class GetOneInsuranceLoadingState extends InsuranceState{}
class GetOneInsuranceSuccessState extends InsuranceState{}
class GetOneInsuranceErrorState extends InsuranceState{
  final error;
  GetOneInsuranceErrorState(this.error);
}