import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/main_cubit/states.dart';
import 'package:xvisa/view/academy_search/academy_search_screen.dart';
import 'package:xvisa/view/best_visa/visa_view_all.dart';
import 'package:xvisa/view/home/home_screen.dart';
import 'package:xvisa/view/home/widget/visa_require_screen.dart';
import 'package:xvisa/view/my_booking_screen/my_booking_screen.dart';
import 'package:xvisa/view/profile_screen/profile_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class MainCubit extends Cubit<MainState> {

  MainCubit() : super(MainInitialState());
  static MainCubit get(context)=> BlocProvider.of(context);
  double totalUnPayedBookingInUSD = 1;
  double? unPayedBooking = 0;
  double? totalUnPayedBooking = 0;
  double currentCurrencyPrice = 1;
  int currentTab = 0;
  
  List screens = [
    HomeScreen(),
    MyBookingScreen(arrow: false,),
    VisaViewAll(visaRequire: true,),
    const ProfileScreen(),
  ];

  void changeCurrentTab(int index) {
    emit(MainLoadingState());
    currentTab = index;
    emit(MainSuccessState());
  }
}
