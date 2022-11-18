

extension StringExtensions on String{
  bool validateEmail(){
    return
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
  bool validatePassword(){
    return
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(this);
  }
  bool validatePhoneNumber(){
    return
      //RegExp(r"/^((\+|00)32\s?|0)4(60|[789]\d)(\s?\d{2}){3}$/").hasMatch(this);
      RegExp(r"^(\+\d{12})?$").hasMatch(this);
  }
}

