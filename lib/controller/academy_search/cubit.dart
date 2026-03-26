import 'package:bloc/bloc.dart';
import 'package:xvisa/controller/academy_search/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AcademySearchCubit extends Cubit<AcademySearchState>{
  AcademySearchCubit() : super(AcademySearchInitialStates());
  static AcademySearchCubit get(context) => BlocProvider.of(context);
  String? selectLocation;
  String? selectStudyWeek;
  bool? selectInsurance;
  bool? selectReception;
  String? selectStartDate;
  bool? selectNeedHouse;
  String? selectGetFromAirport;
  String? selectStudyInsurance;
  String? selectLeaveDate;
  String? selectLeaveType;
  DateTime? _selectedDate;
  var selectedDate;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      var outputFormat = DateFormat('yyyy-MM-dd');
      var outputDate = outputFormat.format(_selectedDate!);
      selectedDate = outputDate;
      emit(AcademySearchDateStates());
      print(selectedDate);
    }
  }

}