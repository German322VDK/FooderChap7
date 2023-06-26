// ignore_for_file: file_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../models/models.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key, required this.currentTab}) : super(key: key);
  final int currentTab;
  //final int id;
@override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  //final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _comptencyController = TextEditingController();
  final _longTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentUser = Provider.of<ProfileManager>(context, listen: false).
      getUser;
    // Start listening to changes.
    _comptencyController.addListener(() async{
      currentUser.role = _comptencyController.text;
      HTTP_Edit('api/user/edit', {'username':currentUser.login, 'comp':_comptencyController.text});
    });
    _emailController.addListener(() async{
      currentUser.email = _emailController.text;
      HTTP_Edit('api/user/edit', {'username':currentUser.login, 'email':_emailController.text});
    });
    _phoneController.addListener(() async{
      currentUser.phone = _phoneController.text;
      HTTP_Edit('api/user/edit', {'username':currentUser.login, 'phone':_phoneController.text});
    });
    _longTextController.addListener(() async{
      currentUser.longtext = _longTextController.text;
      HTTP_Edit('api/user/edit', {'username':currentUser.login, 'email':_longTextController.text});
    });
  }
  @override
  void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      _nameController.dispose();
      _surnameController.dispose();
      _loginController.dispose();
      _emailController.dispose();
      _phoneController.dispose();
      _comptencyController.dispose();
      _longTextController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    final ffem = fem * 0.97;
    final currentUser = Provider.of<ProfileManager>(context, listen: false).
      getUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Edit'),),
      body: SingleChildScrollView(                  
        child: Container(
          width: double.infinity,
          child: Container(          // profileeditd7y (40:191)
            width: double.infinity,
            height: 896*fem,
            decoration: const BoxDecoration (
              color: Color(0xfff0f0f0),
            ),
            child: Stack(
              children: [               
                Positioned(               // photoprofiledSj (40:207)
                  left: 31*fem,
                  top: 33*fem,
                  child: Align(
                    child: SizedBox(
                      width: 352*fem,
                      height: 330*fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30*fem),
                        child: Image.asset(currentUser.profileImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),                
                Positioned(              // backgroundqYo (40:208)
                  left: 0*fem,
                  top: 397*fem,
                  child: Container(
                    width: 414*fem,
                    height: 423*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle22VtF (40:211)
                          width: double.infinity,
                          height: 67*fem,
                          decoration: const BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 36*fem,
                        ),
                        Container(
                          // rectangle21zq1 (40:210)
                          width: double.infinity,
                          height: 67*fem,
                          decoration: const BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 36*fem,
                        ),
                        Container(
                          // rectangle20HZD (40:209)
                          width: double.infinity,
                          height: 217*fem,
                          decoration: const BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(              // borderoGf (40:224)
                  left: -95*fem,
                  top: -75*fem,
                  child: Align(
                    child: SizedBox(
                      width: 604*fem,
                      height: 1000.77*fem,
                      child: Image.asset(
                        'assets/atb_assets/border.png',
                        width: 604*fem,
                        height: 1000.77*fem,
                      ),
                    ),
                  ),
                ),
                Positioned(              // competentinputfieldGAF (40:247)
                  left: 42*fem,
                  top: 432*fem,
                  child: Container(
                    width: 320*fem,
                    height: 32*fem,                    
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextFormField( // comptency
                        controller: _comptencyController,                  
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: currentUser.role.isEmpty? 
                            'Заполните специальность' : currentUser.role,
                          contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(              // nameMzK (40:212)
                  left: 81*fem,
                  top: 403*fem,
                  child: Align(
                    child: SizedBox(
                      width: 252*fem,
                      height: 29*fem,
                      child: Text(
                        '${currentUser.firstName} ${currentUser.lastName}',
                        textAlign: TextAlign.center,
                        style: TextStyle (                          
                          fontSize: 21*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3625*ffem/fem,
                          letterSpacing: -0.3000000119*fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(              // contactsznP (40:246)
                  left: 42*fem,
                  top: 470*fem,
                  child: Container(
                    width: 322*fem,
                    height: 97*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // contacttitleHFh (40:214)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                            child: Text(
                              'Contacts',
                              textAlign: TextAlign.center,
                              style: TextStyle (
                                
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupbrm1sDu (Xu2X95WGMFfmSP5iNQbrM1)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                          width: double.infinity,
                          height: 62*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupbhx7Mes (Xu2XPzF69PnxeHHccobHx7)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 14*fem, 0*fem),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // emailtitleTT1 (40:216)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                                      child: Text(
                                        'Email: ',
                                        style: TextStyle (
                                          
                                          fontSize: 18*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3625*ffem/fem,
                                          letterSpacing: -0.3000000119*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // emailtitlevLb (40:218)
                                      'Phone:',
                                      style: TextStyle (
                                        
                                        fontSize: 18*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3625*ffem/fem,
                                        letterSpacing: -0.3000000119*fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                // autogrouppm6bRYF (Xu2XcQ45RmTg3o8jAspm6b)
                                width: 248*fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // rectangle52Af (40:255)
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: SizedBox(
                                        width: 248*fem,
                                        height: 32*fem,
                                        child: TextFormField( // email
                                          controller: _emailController,                  
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            hintText: currentUser.email.isEmpty? 
                                              'Введите email': currentUser.email,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(color: Color(0xffc0c0c0)),
                                            ),
                                            contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 13.0),                                                              
                                          ),
                                        ),                                      
                                      ),
                                    ),
                                    Positioned(      // phoneinputfieldsBH (40:256)
                                      left: 0*fem,
                                      top: 30*fem,
                                      child: SizedBox(
                                        width: 248*fem,
                                        height: 32*fem,
                                        child: TextFormField( // phone
                                          controller: _phoneController,                  
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                          decoration: InputDecoration(
                                            hintText: currentUser.phone.isEmpty? 
                                              'Введите номер телефона': currentUser.phone,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(color: Color(0xffc0c0c0)),
                                            ),
                                            contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 13.0),                                                              
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
                      ],
                    ),
                  ),
                ),
                Positioned(              // description3tP (40:268)
                  left: 42*fem,
                  top: 577*fem,
                  child: Container(
                    width: 322*fem,
                    height: 243*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // desctitle5aB (40:219)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6*fem),
                            child: Text(
                              'Description',
                              textAlign: TextAlign.center,
                              style: TextStyle (                                
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(                           // descriptioninputfieldMGo (40:250)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                          width: 320*fem,
                          height: 212*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            
                          ),
                          child: TextFormField( // longtext
                            controller: _longTextController,
                            textAlign: TextAlign.left,
                            //expands: true,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.multiline,
                            maxLines: 42,
                            decoration: InputDecoration(
                              hintText: currentUser.longtext.isEmpty? 
                                'Описание': currentUser.longtext,     
                              hintStyle: TextStyle(
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2175*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                              ),                                                                                                 
                            ),
                          ),
                                     
                          ), 
                          
                      ],
                    ),
                  ),
                ),
                Positioned(              // buttonsowR (40:322)
                  left:130*fem,
                  top: 834*fem,
                  child: Container(
                    width: 334*fem,
                    height: 46*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // profilebuttonJdH (40:239)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                          width: 145*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: ElevatedButton( //Button to profile-info.dart
                            onPressed: () 
                            {
                              const index = AtbTab.profileInfo;
                              Provider.of<AppStateManager>(context, listen: false).goToTab(index);
                                context.goNamed(
                                  'home',
                                  pathParameters: {
                                    'tab': '$index',
                                  },
                                );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.purple,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10*fem),
                              ),
                              side: const BorderSide(color: Color(0xff1b268a))),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // textgcB (40:383)
                                  left: 18*fem,
                                  top: 15.0534057617*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 78*fem,
                                        height: 19*fem,
                                        child: Text(
                                          'Профиль',
                                          textAlign: TextAlign.center,
                                          style: TextStyle (
                                            
                                            fontSize: 15*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2175*ffem/fem,
                                            letterSpacing: -0.3000000119*fem,
                                            color: const Color(0xff1b268a),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),                          
                              ],
                            ),
                          ),
                        ),
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}