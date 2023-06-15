import 'package:advanc_p1/quz_app/helper/quz_helper.dart';
import 'package:advanc_p1/quz_app/model/quz_model.dart';
import 'package:flutter/foundation.dart';

class QuezProvider extends ChangeNotifier
{
  Future<QuezModel> QuezApi()
  async {
    return await QuezApiCalling.quezApiCalling.quezApi();
  }

  int i=0;
  bool x=false;
  List? ansList=[];
  // void choiceans(String? ans)
  // {
  //   ansList?.add(ans);
  // }
  void changeQuestion()
  {
    if(i<9)
    {
      i++;
    }
    else
    {
      x=true;

    }
    print(ansList);
    notifyListeners();
  }
}