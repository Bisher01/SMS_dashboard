import 'package:flutter/material.dart';

import '../models/student.dart';
class TabManager extends ChangeNotifier{
  int selectedTab =0;

  void goToTab(int index){
    selectedTab = index;
    notifyListeners();
  }
  Student? student;
  void setStudent(Student s){
    student = s;
    notifyListeners();
  }


}