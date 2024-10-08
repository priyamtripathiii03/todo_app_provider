import 'package:flutter/material.dart';
import 'package:todo_app_provider/Modals/modal.dart';
class  QuoteProvider extends ChangeNotifier
{
  List QuoteData=[];
  List<controllerModal> QuotefinalList=[];
  QuoteProvider()
  {
    StoreData();
  }
  void addData(controllerModal  addData)
  {
    QuotefinalList.insert(0,addData);
    notifyListeners();
  }
  void removeData(int index)
  {
    QuotefinalList.removeAt(index);
    notifyListeners();
  }
  void StoreData()
  {
    QuotefinalList=QuoteData.map((e) => controllerModal.from(e),).toList();
    notifyListeners();
  }


}