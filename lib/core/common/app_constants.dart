import 'package:flutter/material.dart';

class AppConstants {
  static const BASE_URL = "http://192.168.0.6:8000/api/v1/";

  static const String SharedLogin = "Login";

  static const int DatabaseVersion = 1;
  static const String DatabaseFileName = "app_database.db";

  static const String GetxTagDatabase = "db";
  static const String GetxTagSharedPref = "pref";
  static const String GetxTagDio = "dio";
  static const String GetxTagSessionManager = "session";
  static const String GetxTagApiService = "apiService";
  static const String GetxTagDatabaseService = "databaseService";

  static const bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "Search",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.storefront_sharp),
      label: "Warehouse",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: "Statistics",
    ),
  ];
}
