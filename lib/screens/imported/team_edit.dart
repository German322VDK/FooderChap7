// ignore_for_file: file_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';

class TeamEditPage extends StatefulWidget {
  const TeamEditPage({Key? key, required this.currentTab2}) : super(key: key);
  final int currentTab2;

  @override
  State<TeamEditPage> createState() => _TeamEditPageState();
}

class _TeamEditPageState extends State<TeamEditPage>{
  //final int id;
  var rememberValue = false;
  final _loginController = TextEditingController();
  final _teamEmailController = TextEditingController();
  final _contactController = TextEditingController();
  final _roleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentTeam = Provider.of<TeamManager>(context, listen: false).getTeam;
    // Start listening to changes.
    // Изменения записываются сразу, как пользователь изменил контроллер в поле
    _roleController.addListener((){
      currentTeam.teamRole = _roleController.text;
    });
    _teamEmailController.addListener((){
      currentTeam.teamEmail = _teamEmailController.text;
    });
    _contactController.addListener((){
      currentTeam.teamContact = _contactController.text;
    });
    _descriptionController.addListener((){
      currentTeam.description = _descriptionController.text;
    });
  }
  @override
  void dispose() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      _loginController.dispose();
      _teamEmailController.dispose();
      _contactController.dispose();
      _roleController.dispose();
      _descriptionController.dispose();
      super.dispose();
    }




  @override
  Widget build(BuildContext context) {
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    final ffem = fem * 0.97;

    final currentTeam = Provider.of<TeamManager>(context, listen: false).
      getTeam;

    return Scaffold(
      appBar: AppBar(title: const Text('Team Edit'),),
      body: SingleChildScrollView(                  
        child: Container(
        width: double.infinity,
        child: Container(
          // teamedittgs (40:272)
          width: double.infinity,
          height: 896*fem,
          decoration: const BoxDecoration (
            color: Color(0xfff0f0f0),
          ),
          child: Stack(
            children: [
              Positioned(                // backgroundw9M (40:273)
                left: 0*fem,
                top: 200*fem,
                child: Container(
                  width: 414*fem,
                  height: 617*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(                        // rectangle23yLw (40:277)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 45*fem),
                        width: double.infinity,
                        height: 65*fem,
                        decoration: const BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                      Container(                        // rectangle22SkK (40:276)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 36*fem),
                        width: double.infinity,
                        height: 154*fem,
                        decoration: const BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                      Container(                        // rectangle21ZK9 (40:275)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
                        width: double.infinity,
                        height: 67*fem,
                        decoration: const BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                      Container(                        // rectangle20gPm (40:274)
                        width: double.infinity,
                        height: 215*fem,
                        decoration: const BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(                // bordercYK (40:278)
                left: -95*fem,
                top: -75*fem,
                child: Align(
                  child: SizedBox(
                    width: 604*fem,
                    height: 1000.77*fem,
                    child: Image.asset(
                      'assets/atb_assets/border-F79.png',
                      width: 604*fem,
                      height: 1000.77*fem,
                    ),
                  ),
                ),
              ),
             
              Positioned(              // membersnfM (40:270)
              left: 50*fem,
              top: 265*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 309*fem,
                    height: 30*fem,
                    //decoration: BoxDecoration(color: Colors.green),
                    margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 19*fem),
                    child: Text(
                      'Участники команды:',
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
                  
                  Container(                    // membersP2s (20:864)
                    //decoration: BoxDecoration(color: Colors.red),
                    alignment: Alignment.topLeft,
                    height: 135,
                    constraints: BoxConstraints (
                      maxWidth: 309*fem,
                    ),
                    child: ListView.separated(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: currentTeam.members.length,
                      itemBuilder: (context, index) {
                        if (currentTeam.members.isNotEmpty) {

                        final member = currentTeam.members[index];
                        final avatar = member.profileImageUrl;

                        return //Text('${member.firstName} ${member.lastName}');
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(avatar),
                                ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${member.firstName} ${member.lastName}',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                          
                        }
                        else {return const Text('Участников нет. Приглашайте, ищите');}
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 5);
                      },
                    ),
                   ),
                  
                ],
              ),
            ),
              Positioned(                // contactsyzT (40:299)
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
                      Center(                        // contacttitlesK9 (40:304)
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
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(                        // autogroupagd1jcF (Xu2b1iYxgrurdqW9AtAGD1)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                        width: 320*fem,
                        height: 62*fem,
                        child: Stack(
                          children: [
                            Positioned(                              // contactinputfieldRjy (40:337)
                              left: 72*fem,
                              top: 30*fem,
                              child: Container(
                                width: 248*fem,
                                height: 32*fem,
                                decoration: BoxDecoration (
                                  //border: Border.all(),
                                  borderRadius: BorderRadius.circular(10*fem),
                                ),
                                child: TextFormField( // phone
                                  controller: _contactController,                  
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(color: Color(0xffc0c0c0)),
                                      ),
                                    hintText: currentTeam.teamContact.isEmpty? 
                                      'Контактные детали': currentTeam.teamContact,
                                    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 15.0),                                                              
                                  ),
                                ),
                              ),
                            ),
                            Positioned(                              // contacttitleWoM (40:300)
                              left: 0*fem,
                              top: 30*fem,
                              child: SizedBox(
                                width: 74*fem,
                                height: 25*fem,
                                child: Text(
                                  'Contact: ',
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
                            Positioned(                              // emailinputfieldN4s (40:334)
                              left: 72*fem,
                              top: 0*fem,
                              child: Container(
                                width: 248*fem,
                                height: 32*fem,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(10*fem),
                                ),
                                child: TextFormField( // email
                                  controller: _teamEmailController,                  
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xffc0c0c0)),
                                ),
                                    hintText: currentTeam.teamEmail.isEmpty? 
                                      'Введите email': currentTeam.teamEmail,
                                    
                                    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 13.0),                                                              
                                  ),
                                ),
                              ),
                            ),
                            Positioned(                              // emailtitleA99 (40:303)
                              left: 0*fem,
                              top: 2*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 58*fem,
                                  height: 25*fem,
                                  child: Text(
                                    'Email: ',
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(                // informationbET (40:305)
                left: 42*fem,
                top: 202*fem,
                child: Container(
                  width: 320*fem,
                  height: 59*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(10*fem),
                  ),
                  child: Stack(
                    children: [
                      Positioned(                        // teamnameo5d (40:307)
                        left: 62.5*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 205*fem,
                            height: 29*fem,
                            child: Text(
                              //'Название команды',
                              currentTeam.teamName,
                              textAlign: TextAlign.center,
                              style: TextStyle (
                                
                                fontSize: 21*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(                        // typeinputfield1Bh (40:340)
                        left: 0*fem,
                        top: 27*fem,
                        child: Container(
                          width: 320*fem,
                          height: 32*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            border: Border.all(color: const Color(0xffc0c0c0)),
                          ),
                          child: TextFormField(
                            controller: _roleController,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: currentTeam.teamRole.isEmpty? 
                                'Тип команды' : currentTeam.teamRole,
                              contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(                // buttonsDh5 (40:323)
                left: 130*fem,
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
                      Container(                        // profilebutton3RD (40:309)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                        width: 145*fem,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: ElevatedButton( //Button to profile-info.dart
                          onPressed: () 
                          {
                            const index = AtbTab.teamInfo;
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
                              foregroundColor: Colors.green,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10*fem),
                                ),
                                side: const BorderSide(color: Color(0xff06661b))
                              ),
                            ),
                          child: Stack(
                              children: [
                                Positioned(
                                  // textdpF (40:386)
                                  left: 18*fem,
                                  top: 15.0534057617*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 76*fem,
                                        height: 19*fem,
                                        child: Text(
                                          'Команда',
                                          textAlign: TextAlign.center,
                                          style: TextStyle (
                                            fontSize: 15*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2175*ffem/fem,
                                            letterSpacing: -0.3000000119*fem,
                                            color: const Color(0xff06661b),
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
              Positioned(                // descriptionrZ1 (40:315)
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
                        // desctitle92K (40:317)
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
                      Container(                        // descriptioninputfieldosZ (40:331)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                        width: 320*fem,
                        height: 212*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(10*fem),
                          border: Border.all(color: const Color(0xffc0c0c0))
                        ),
                        child: TextFormField( // longtext
                          controller: _descriptionController,
                          textAlign: TextAlign.left,
                          //expands: true,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          maxLines: 42,
                          decoration: InputDecoration(
                            hintText: currentTeam.description.isEmpty? 
                              'Описание команды': currentTeam.description,
                            contentPadding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
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
              Positioned(                // phototeamRfy (40:308)
                left: 26*fem,
                top: 46*fem,
                child: Align(
                  child: SizedBox(
                    width: 365*fem,
                    height: 147*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only (
                        topLeft: Radius.circular(33*fem),
                        topRight: Radius.circular(33*fem),
                      ),
                      child: Image.asset(
                        currentTeam.teamPicture,
                        //'assets/atb_assets/phototeam-GJ7.png',
                        fit: BoxFit.contain,
                      ),
                    ),
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