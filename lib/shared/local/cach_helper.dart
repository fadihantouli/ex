import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences ;
  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<List<Map<String, String>>> getSelectedCountries() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    String? jsonString = prefs.getString('selectCoun');

    // If the string exists, decode it and return the list
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    }

    // Return an empty list if there's no cached data
    return [];
  }
  static setBool(key , bool? value){
    if(value != null){
      sharedPreferences.setBool(key, value);
    }
  }

  static setCustomer({required customer}){
    sharedPreferences.setString("F", customer);
  }
  static deleteCustomer(){
    sharedPreferences.remove("F");
  }
  static getCustomer(){
    return sharedPreferences.getString("F");
  }
  static Future<bool> deleteData({@required key})async{
    return await sharedPreferences!.remove(key);
  }
  static getBool(key){
    return sharedPreferences.getBool(key) ?? false;
  }
  static getBoolNULL(key){
    return sharedPreferences.getBool(key);
  }
 static Future<bool> setString ({@required key, @required value})async{
   return await sharedPreferences.setString(key, value);
  }
  static getString (key){
    return sharedPreferences.getString(key) ?? "";
  }
  static getStringNull (key){
    return sharedPreferences.getString(key) == "-" ? null : sharedPreferences.getString(key) ;
  }

  static setInt ({key, int? value}){
    sharedPreferences.setInt(key, value ?? -1);
  }
  static getInt (key){
    return sharedPreferences.getInt(key) ?? -1;
  }
  static getIntNull1 (key){
    return sharedPreferences.getInt(key) ;
  }

  static getIntNull (key){
    return sharedPreferences.getInt(key) == -1 ? null : sharedPreferences.getInt(key);
  }
  static setDouble (key ,double value){
    sharedPreferences.setDouble(key, value);
  }
  static getDouble (key){
    return sharedPreferences.getDouble(key) ?? 0;
  }

  static clear() async{
    await sharedPreferences.clear();
    return true;
  }
}

class CustomerHelper {
  static const String TOKEN = "TOKEN";
  static const String UserId="UserId";
  static const String IsLoged = "IsLoged";
  static const String Language = "language";
  static const String Email ="email";
  static const String Profile_Email ="Profile_email";
  static const String UserImage="UserImage";
  static const String Profile_UserImage="Profile_UserImage";
  static const String LastEmail ="LastEmail";
  static const String Password="password";
  static const String Phone="Phone";
  static const String FirstName="FirstName";
  static const String LastName="LastName";
  static const String UserName="UserName";
  static const String Profile_UserName="Profile_UserName";
  static const String TaxNumber="TaxNumber";
  static const String Tax_Register="Tax_Register";
  static const String Company_Name="Company_Name";




}



