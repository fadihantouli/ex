import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/layout_cubit/states.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/remote/dio.dart';
import 'package:xvisa/utills/const.dart';
import 'package:xvisa/utills/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(GetCategoriesInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

}
