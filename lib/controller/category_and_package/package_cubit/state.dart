abstract class PackageState{}
class PackageInitialState extends PackageState{}

class GetPackageLoadingState extends PackageState{}
class GetPackageSuccessState extends PackageState{}
class GetPackageErrorState extends PackageState{
  final error;
  GetPackageErrorState(this.error);
}
class GetOnePackageLoadingState extends PackageState{}
class GetOnePackageSuccessState extends PackageState{}
class GetOnePackageErrorState extends PackageState{
  final error;
  GetOnePackageErrorState(this.error);
}
