// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.username,
  });
  final String? username;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final loginController = TextEditingController();
  final passController = TextEditingController();

@override
  void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      loginController.dispose();
      super.dispose();
    }



  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);
  final TextStyle focusedStyle = const TextStyle(color: Colors.green);
  final TextStyle unfocusedStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {


    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 44.0),
            children: [
              Container(              // autogroupv9xwobq (Xu2cAGUQRWUHhhnKndV9xw)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.66*fem, 44*fem),
                width: 354*fem, height: 300*fem,
                child: Stack(
                  children: [
                    Positioned(                      // imagetopJHh (9:671)
                      left: 2*fem, top: 25*fem,
                      child: Align(
                        child: SizedBox(
                          width: 352*fem, height: 330*fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30*fem),
                            child: Image.asset(
                              'assets/atb_assets/imagetop-2Z1.png',
                              fit: BoxFit.cover,
                            ),),),),),
                  ],
                ),
              ),
              
              Form( //Формы с вводом логина и пароля
                key:_formKey,
                child: Column(
                  children: [
                    TextFormField( // logininputfieldM31 (9:673)
                      controller: loginController,
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Введите Ваш логин';
                        }                        
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Логин',
                        hintStyle: const TextStyle(height: 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField( // passwordinputfield7Zu (9:676)
                      controller: passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите Ваш пароль';
                        }
                        // TODO: Добавить проверку пароля -> добавить при нажатии кнопки ниже
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Пароль',
                      hintStyle: const TextStyle(height: 0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton( //кнопка входа. TODO: Добавить валидацию
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Взять userId из базы по логину
                          // этот if на время отсутствия проверки логина в базе (Null)
                          if (users.contains(loginController.text)) {
                            //bool переменная становится False, рефрешится и переходит дальше                            
                            Provider.of<ProfileManager>(context, listen: false).setCurrentUser(loginController.text);
                            final currentUser = Provider.of<ProfileManager>(context, listen: false).getUser;
                            //Provider.of<TeamManager>(context, listen: false).setCurrentTeam(currentUser.myTeamName);
                            Provider.of<AppStateManager>(context, listen: false)
                              .login(loginController.text, passController.text);
                          }
                          else { // если юзера нет в списке юзеров
                            ScaffoldMessenger.of(context).showSnackBar(
                              showLoginError()
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,                        
                      ),
                      child: Container(
                        width: 360*fem, height: 52*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff3498db),
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Войти',
                            textAlign: TextAlign.center,
                            style: TextStyle (
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2025*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: Color(0xffffffff),
                            ),),),),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                )

              ),
            
              Container(              // textpasswordforgotha3 (9:672)
              //TODO: добавить ссылку на восстановление пароля
                margin: EdgeInsets.fromLTRB(224.34*fem, 0*fem, 0*fem, 23*fem),
                child: Text(
                  'Забыли пароль?',
                  style: Theme.of(context).textTheme.bodySmall
                ),
              ),
            
              Container(              // autogroupbppbXBh (Xu2cNWd18xudvPjnVcbppB)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.66*fem, 10*fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 9*fem,),
                    Text(
                      // textinputBGF (9:688)
                      'Войти под аккаунтом',
                      textAlign: TextAlign.center,
                      style: TextStyle (
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.1725*ffem/fem,
                        letterSpacing: -0.3000000119*fem,
                        color: Color(0xffc0c0c0),
                      ),
                    ),
                    SizedBox(width: 9*fem,),
                  ],
                ),
              ),
              Row(                  //логин через соцсети          
                children: [            
                  Container(              // googleRwH (9:681)
                    margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 0*fem),
                    width: 170*fem, height: 60*fem,
                    decoration: BoxDecoration (borderRadius: BorderRadius.circular(10*fem),),
                    child: Stack(
                      children: [
                        Positioned(                          // googlevd9 (9:682)
                          left: 70*fem, top: 22.9*fem,
                          child: Align(
                            child: SizedBox(
                              width: 54*fem, height: 19*fem,
                              child: Text(
                                'Google',
                                style: TextStyle (
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2175*ffem/fem,
                                  letterSpacing: -0.3000000119*fem,
                                  color: Color(0xffe74c3c),
                                ),),),),
                        ),
                        Positioned(                          // rectangle5PFq (9:683)
                          left: 0*fem, top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 170*fem, height: 59.95*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(10*fem),
                                  border: Border.all(color: Color(0xffe74c3c)),
                                ),),),),
                        ),
                        Positioned(                          // googleicon1TmV (9:691)
                          left: 16*fem, top: 13*fem,
                          child: Align(
                            child: SizedBox(
                              width: 33*fem, height: 33*fem,
                              child: Image.asset(
                                'assets/atb_assets/google-icon-1-9Z5.png',
                                fit: BoxFit.cover,
                              ),),),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(              // fbLKV (9:684)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                width: 170*fem, height: 60*fem,
                child: Stack(
                  children: [
                    Positioned(                      // facebookq1M (9:685)
                      left: 70*fem, top: 22.9*fem,
                      child: Align(
                        child: SizedBox(
                          width: 80*fem, height: 19*fem,
                          child: Text(
                            'Facebook',
                            style: TextStyle (
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2175*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: Color(0xff3498db),
                            ),),),),
                    ),
                    Positioned(                      // rectangle5Dnb (9:686)
                      left: 0*fem, top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 170*fem, height: 60*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(10*fem),
                              border: Border.all(color: Color(0xff3498db)),
                            ),),),),
                    ),
                    Positioned(                      // vector4oD (9:687)
                      left: 24*fem, top: 12*fem,
                      child: Align(
                        child: SizedBox(
                          width: 17*fem, height: 36.89*fem,
                          child: Image.asset(
                            'assets/atb_assets/vector-jgF.png',
                            width: 17*fem, height: 36.89*fem,
                          ), ),),
                    ),
                  ],
                ),
              ),
              ],),
              SizedBox(height: 8,),
              Container(              // textrecomendateregistrN3D (9:670)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.66*fem, 0*fem),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle (
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2175*ffem/fem,
                      letterSpacing: -0.3000000119*fem,
                      color: Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Нет аккаунта? ',
                        style: Theme.of(context).textTheme.titleSmall
                      ),
                      TextSpan(
                        text: 'Зарегистрируйтесь!',
                        style: TextStyle (
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2175*ffem/fem,
                          letterSpacing: -0.3000000119*fem,
                          color: Color(0xff3498db),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Provider.of<AppStateManager>(context, listen: false)
                              .toSignup();
                            },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return SizedBox(
      height: 55,
      child: MaterialButton(
        color: rwColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          Provider.of<AppStateManager>(context, listen: false)
            .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }

  SnackBar showLoginError() {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return 
      SnackBar( // Snack bar , показывающий ошибку на 1,5 секунды
        content: Container(
          padding: EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 10.95*fem),
          width: 354*fem,
          height: 80.95*fem,
          decoration: BoxDecoration (
            color: Color(0xffe74c3c),
            borderRadius: BorderRadius.circular(10*fem),
          ),
          child: Center(
            // text8vw (39:177)
            child: SizedBox(
              child: Container(
                constraints: BoxConstraints (
                  maxWidth: 300*fem,
                ),
                child: Text(
                  'Неправильный логин или пароль!\nУбедитесь в правильности данных!',
                  textAlign: TextAlign.center,
                  style: TextStyle (
                    fontSize: 17*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2175*ffem/fem,
                    letterSpacing: -0.3000000119*fem,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        ); 
  }

  Widget buildTextfield(String hintText) {
    return TextField(
      cursorColor: rwColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        prefixIcon: 
          Row(
            children: [
              (hintText == 'Введите Ваш логин') ? const Icon(Icons.person)
              :(hintText == 'Введите Ваш пароль') ? const Icon(Icons.lock)
              :const Icon(Icons.note),
            ]
          ),
        hintText: hintText,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }
}
