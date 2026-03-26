abstract class AcademyStates{}
class AcademyInitialStates extends AcademyStates{}
class AcademySearchDateStates extends AcademyStates{}
class GetAcademyLoadingStates extends AcademyStates{}
class GetAcademySuccessStates extends AcademyStates{}
class GetAcademyErrorStates extends AcademyStates{
  final error;
  GetAcademyErrorStates(this.error);
}
class GetOneAcademyLoadingStates extends AcademyStates{}
class GetOneAcademySuccessStates extends AcademyStates{}
class GetOneAcademyErrorStates extends AcademyStates{
  final error;
  GetOneAcademyErrorStates(this.error);
}
class BookAcademyLoadingStates extends AcademyStates{}
class BookAcademySuccessStates extends AcademyStates{}
class BookAcademyErrorStates extends AcademyStates{
  final error;
  BookAcademyErrorStates(this.error);
}