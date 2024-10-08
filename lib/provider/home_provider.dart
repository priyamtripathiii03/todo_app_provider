import 'package:flutter/material.dart';
import 'package:todo_app_provider/Modals/modal.dart';
class  QuoteProvider extends ChangeNotifier
{
  List yourData=[];
  List<ControllerModal> dataFinalList=[];
  QuoteProvider()
  {
    storeData();
  }
  void addData(ControllerModal  addData)
  {
    dataFinalList.insert(0,addData);
    notifyListeners();
  }
  void removeData(int index)
  {
    dataFinalList.removeAt(index);
    notifyListeners();
  }
  void storeData()
  {
    dataFinalList=yourData.map((e) => ControllerModal.from(e),).toList();
    notifyListeners();
  }


}