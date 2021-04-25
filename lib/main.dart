import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'ModelView/ViewModel.dart';
import 'Pages/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(create:(context){
      return HomeViewModel();
    },child: Sizer(
      builder: (context, orientation, screenType){
        return MaterialApp(home: HomePage());
      },
    ),);
  }

}
