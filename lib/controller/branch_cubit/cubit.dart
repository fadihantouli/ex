import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/branch_cubit/state.dart';
import 'package:xvisa/controller/contactus_cubit/state.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchCubit extends Cubit<BranchStates>{
  BranchCubit() : super(BranchInitialState());
  static BranchCubit get(context) => BlocProvider.of(context);
  String? getBranchErrorMessage;
  List branches = [];
  getBranch(){
    emit(GetBranchLoadingState());
    DioHelper.getData(
        url: AppConstant.GetBranchEndPoint,
        token: CacheHelper.getString("token"),
    ).then((value){
      emit(GetBranchSuccessState());
      branches = value.data['data'];
      print(value.data);
    }).catchError((error){
      if (error is DioError) {
        if (error.response != null) {
          getBranchErrorMessage = error.response?.data['message'] ?? 'Something went wrong';
        } else {
          getBranchErrorMessage = error.message!;
        }
      } else {
        getBranchErrorMessage = error.toString();
      }
      emit(GetBranchErrorState(error.toString()));
    });
  }
}