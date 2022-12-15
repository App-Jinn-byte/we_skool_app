import 'package:flutter/cupertino.dart';
import 'dart:io';


class ContactUsProvider extends ChangeNotifier {
  BuildContext? context;
  bool? pickedImage = false;
  File? myImage;

  init({@required BuildContext? context, @required int? index}) {
    pickedImage = false;
    this.context = context;
  }
}

