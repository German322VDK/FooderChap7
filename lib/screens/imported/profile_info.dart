// ignore_for_file: file_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../models/models.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);
  //final int id;
  

  @override
  Widget build(BuildContext context) {
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    final ffem = fem * 0.97;
    final currentUser = Provider.of<ProfileManager>(context, listen: false).
      getUser;
  

    return SingleChildScrollView(                  
      child: Container(
          width: double.infinity,
          child: Container(            // profileinfoMnK (40:343)
            width: double.infinity,
            height: 896*fem,
            decoration: BoxDecoration (
              color: Color(0xfff0f0f0),
            ),
            child: Stack(
              children: [
                Positioned(                  // background6om (40:360)
                  left: 0*fem,
                  top: 397*fem,
                  child: Container(
                    width: 414*fem,
                    height: 422*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(                          // rectangle22aiw (40:363)
                          width: double.infinity,
                          height: 67*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(height: 36*fem,),
                        Container(                          // rectangle21UZR (40:362)
                          width: double.infinity,
                          height: 67*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                        SizedBox(height: 36*fem,),
                        Container(                          // rectangle20bP9 (40:361)
                          width: double.infinity,
                          height: 216*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(                  // borderjET (40:364)
                  left: -95*fem,
                  top: -75*fem,
                  child: Align(
                    child: SizedBox(
                      width: 604*fem,
                      height: 1000.77*fem,
                      child: Image.asset(
                        'assets/atb_assets/border-37q.png',
                        width: 604*fem,
                        height: 1000.77*fem,
                      ),
                    ),
                  ),
                ),
                Positioned(                  // nameaVy (40:367)
                  left: 81*fem,
                  top: 403*fem,
                  child: Align(
                    child: SizedBox(
                      width: 252*fem,
                      height: 29*fem,
                      child: Text(
                        '${currentUser.firstName} ${currentUser.lastName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                Positioned(                  // competencetitle15V (40:368)
                  //left: 145.5*fem,
                  //top: 432*fem,
                  child: Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      //width: 124*fem,
                      height: 25*fem,
                      child: Text(
                        currentUser.role,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3625*ffem/fem,
                          letterSpacing: -0.3000000119*fem,
                          color: Color(0xff000000),)
                      ),
                    ),
                  ),
                ),
                Positioned(                  // contactsqaK (40:369)
                  left: 42*fem,
                  top: 470*fem,
                  child: Container(
                    width: 198*fem,
                    height: 92*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          // contacttitleXT9 (40:374)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                            width: double.infinity,
                            child: Text(
                              'Contacts',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color: Color(0xff000000),)
                            ),
                          ),
                        ),
                        Container(
                          // autogroup8zu98hq (Xu2VvnC4qxRcfwGMDB8zu9)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 6*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // emailtitle1md (40:371)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                child: Text(
                                  'Email: ',
                                  style: TextStyle(fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3625*ffem/fem,
                                    letterSpacing: -0.3000000119*fem,
                                    color: Color(0xff000000),)
                                ),
                              ),
                              Text(
                                // emailinfog75 (40:370)
                                currentUser.email,
                                style: TextStyle(fontSize: 15*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3625*ffem/fem,
                                  letterSpacing: -0.3000000119*fem,
                                  color: Color(0xff000000),)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupkikmz7m (Xu2W4rnwNU6qDyxVkxKiKM)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // emailtitleFpP (40:373)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                child: Text(
                                  'Phone:',
                                  style: TextStyle(fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3625*ffem/fem,
                                    letterSpacing: -0.3000000119*fem,
                                    color: Color(0xff000000),)
                                ),
                              ),
                              Text(
                                // emailinfoXG7 (40:372)
                                currentUser.phone,
                                 style: TextStyle(fontSize: 15*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3625*ffem/fem,
                                  letterSpacing: -0.3000000119*fem,
                                  color: Color(0xff000000),)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(                  // descriptiondK9 (40:375)
                  left: 42*fem,
                  top: 577*fem,
                  child: Container(
                    width: 321*fem,
                    height: 250*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // desctitleV6T (40:376)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 15*fem),
                            child: Text(
                              'Description',
                              textAlign: TextAlign.center,
                               style: TextStyle(fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3625*ffem/fem,
                                    letterSpacing: -0.3000000119*fem,
                                    color: Color(0xff000000),)
                            ),
                          ),
                        ),
                        Container(
                          // descinfoWGT (40:377)
                          alignment: Alignment.topLeft,
                          constraints: BoxConstraints (
                            maxWidth: 321*fem,
                          ),
                          child: Text(
                            currentUser.longtext,
                            textAlign: TextAlign.left,
                            maxLines: 10,
                            overflow: TextOverflow.fade,
                            style: TextStyle( fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: Color(0xff000000),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(                  // buttonsNZZ (40:378)
                  left: 30*fem,
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
                        Container(                          // profilebutton2u1 (40:382) //Team Search now
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                          width: 145*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child:  ElevatedButton( //button to Team Search. Не нашел виджет, пока что search member
                            onPressed: () 
                            {        
                              const index = AtbTab.lookingForGroups;
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
                              foregroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10*fem),
                              ),
                              side: BorderSide(color: Color(0xff01746d))),
                            ),
                            child: Stack(
                              children: [
                                Positioned(                                  // LZy (40:240)
                                  left: 4*fem,
                                  top: 6.0534057617*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 107*fem,
                                        height: 37*fem,
                                        child: Text(
                                          'Поиск команды',
                                          textAlign: TextAlign.center,
                                          style: TextStyle (
                                            fontSize: 15*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2175*ffem/fem,
                                            letterSpacing: -0.3000000119*fem,
                                            color: const Color(0xff01746d),
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
                        
                        Container(                          // teambuttonXWK (40:385)
                          width: 145*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: ElevatedButton( 
                            onPressed: () //Navigator to teampage
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
                Positioned(                  // photoprofilekGb (40:359)
                  left: 31*fem,
                  top: 33*fem,
                  child: Align(
                    child: SizedBox(
                      width: 352*fem,
                      height: 330*fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30*fem),
                        child: Image.asset(
                          'assets/atb_assets/photoprofile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(                  // editiconQc3 (40:394)
                  left: 330*fem,
                  top: 781*fem,
                  child: Align(
                    child: IconButton(
                      icon: Image.asset(
                        'assets/atb_assets/editicon-L3m.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () 
                        {                          
                          context.goNamed('profileEdit', pathParameters: {
                          'tab': '${AtbTab.profileInfo}',
                        });
                        },
                      iconSize: 32*fem,) 
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}