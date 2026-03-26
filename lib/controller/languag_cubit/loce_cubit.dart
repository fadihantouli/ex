
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
import 'package:xvisa/shared/local/cach_helper.dart';
import 'package:xvisa/shared/local/language_cechhelper.dart';

import 'loce_state.dart';



class LanguageCubit extends Cubit<languageStates>{
  LanguageCubit():super(languageInitialState());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();

    // Validate if the language is 'ar' or 'en'
    if (cachedLanguageCode == 'ar' || cachedLanguageCode == 'en') {
      emit(changeLanguageState(locale: Locale(cachedLanguageCode)));
    } else {
      // Default to English if the language is not 'ar' or 'en'
      emit(changeLanguageState(locale: Locale('en')));
    }
  }
  Future<void> changeLanguage(String languageCode) async {
    // Validate if the languageCode is 'ar' or 'en'
    if (languageCode == 'ar' || languageCode == 'en') {
      await LanguageCacheHelper().cacheLanguageCode(languageCode);
      emit(changeLanguageState(locale: Locale(languageCode)));
      CacheHelper.sharedPreferences.setString(CustomerHelper.Language, Locale(languageCode).toString());
      print(CacheHelper.sharedPreferences.get(CustomerHelper.Language));
    } else {
      // Optionally handle invalid language codes
      print("Invalid language code: $languageCode");
    }
  }
// void toArabic()=>emit(selectedLanguageState(Locale('ar')));

// void toEnglish()=>emit(selectedLanguageState(Locale('en')));
}

class RadioListTileCubit extends Cubit<int> {
  RadioListTileCubit() : super(0);

  void selectItem(int index) {
    emit(index);
  }
}