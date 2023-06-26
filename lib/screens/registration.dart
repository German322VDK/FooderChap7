// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _comptencyController = TextEditingController();
  final _passController = TextEditingController();
  //var userDatabase;

  @override
  void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      _nameController.dispose();
      _surnameController.dispose();
      _loginController.dispose();
      _emailController.dispose();
      _comptencyController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(              // imagetoph3H (9:556)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13.66*fem, 0*fem),
                width: 352*fem,
                height: 300*fem,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30*fem),
                  child: Image.asset(
                    'assets/atb_assets/imagetop.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Text( // Заголовок
                'Регистрация',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox( // Отступ от заголовка
                height: 40,
              ),
              Form( // Формы                
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField( // Name Input
                            controller: _nameController,
                            validator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Введите Ваше имя';
                              }
                              return null;
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Имя',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _surnameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите Вашу Фамилию';
                              }
                              return null;
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Фамилия',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField( // Login
                      controller: _loginController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите Ваш логин';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Введите логин',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField( // Email
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите Ваш емейл';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Введите email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField( // Password
                      controller: _passController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите пароль';
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Введите пароль',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField( // comptency
                    controller: _comptencyController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите Вашу специализацию';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Введите специализацию',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) { //TODO: Add Registration activity
                          //final lol = await HTTP_GET_BOOL('api/user/register?username=${_loginController.text}');
                          //final lol = await HTTP_GET_BOOL('api/user/register?username=${_loginController.text}&password=${_passController.text}&email=${_emailController.text}&comp=${_comptencyController.text}&fn=${_nameController.text}&sn=${_surnameController.text}');
                          final id = await HTTP_Register('api/user/register', {'username':_loginController.text, 'password':_passController.text, 'email':_emailController.text, 'comp':_comptencyController.text, 'fn':_nameController.text,'sn':_surnameController.text});

                          if(id != '')
                          {
                            // Присвоить userId
                            // Добавляю логин в список,
                            // TODO: заменить на DB
                            users.add(_loginController.text);
                            //записываю в profile_manager _newUser
                            Provider.of<ProfileManager>(context, listen: false)
                                .signupUser(
                                id,
                                _loginController.text,
                                _nameController.text,
                                _surnameController.text,
                                _comptencyController.text,
                                _emailController.text
                            );
                            // getter юзера
                            final currentUser = Provider.of<ProfileManager>(context, listen: false)
                                .getUser;
                            // задать новый _currentTeam в team_manager.dart, каждому новому пользователю по личной тиме
                            Provider.of<TeamManager>(context, listen: false).createTeam(currentUser, 'MyTeam');
                            userDatabase.add(currentUser);
                            // Пароль пока нигде не используется
                            Provider.of<AppStateManager>(context, listen: false)
                                .signup(_loginController.text, _passController.text);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      ),
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Уже зарегистрированы?'),
                        TextButton(
                          onPressed: () {
                            Provider.of<AppStateManager>(context, listen: false).logout();
                          },
                          child: const Text('Войти'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(              // googlebuttonev7 (9:574)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.66*fem, 24*fem),
              width: 354*fem,
              height: 52*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(10*fem),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // googleiuy (9:575)
                    left: 150*fem,
                    top: 17*fem,
                    child: Align(
                      child: SizedBox(
                        width: 54*fem,
                        height: 19*fem,
                        child: Text(
                          'Google',
                          style: TextStyle (
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2175*ffem/fem,
                            letterSpacing: -0.3000000119*fem,
                            color: Color(0xffe74c3c),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle5Mi3 (9:576)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 354*fem,
                        height: 52*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            border: Border.all(color: Color(0xffe74c3c)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // googleicon1n2f (9:585)
                    left: 16*fem,
                    top: 9*fem,
                    child: Align(
                      child: SizedBox(
                        width: 33*fem,
                        height: 33*fem,
                        child: Image.asset(
                          'assets/atb_assets/google-icon-1-9Z5.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              Container(              // facebookbuttonf6T (9:577)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.66*fem, 49*fem),
                width: 354*fem,
                height: 52*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // facebook9XR (9:578)
                      left: 140*fem,
                      top: 17*fem,
                      child: Align(
                        child: SizedBox(
                          width: 75*fem,
                          height: 19*fem,
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
                    Positioned(
                      // rectangle5QiF (9:579)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 354*fem,
                          height: 52*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(10*fem),
                              border: Border.all(color: Color(0xff3498db)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // vectorHn3 (9:580)
                      left: 24*fem,
                      top: 10*fem,
                      child: Align(
                        child: SizedBox(
                          width: 17*fem,
                          height: 32*fem,
                          child: Image.asset(
                            'assets/atb_assets/vector-jgF.png',
                            width: 17*fem,
                            height: 32*fem,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ],
            
          ),
        ),
      ),
    );
  }
}

