abstract class CourseState{}
class CourseInitialState extends CourseState{}

class GetCourseLoadingState extends CourseState{}
class GetCourseSuccessState extends CourseState{}
class GetCourseErrorState extends CourseState{
  final error;
  GetCourseErrorState(this.error);
}
class GetOneCourseLoadingState extends CourseState{}
class GetOneCourseSuccessState extends CourseState{}
class GetOneCourseErrorState extends CourseState{
  final error;
  GetOneCourseErrorState(this.error);
}