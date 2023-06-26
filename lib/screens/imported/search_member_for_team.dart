// ignore_for_file: file_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';

class SearchMemberPage extends StatelessWidget {
  const SearchMemberPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    final ffem = fem * 0.97;
    final currentUser = Provider.of<ProfileManager>(context, listen: false).
      getUser;
    final currentTeam = Provider.of<TeamManager>(context, listen: false).
      getTeam;
    if (Provider.of<TeamManager>(context, listen: false)
    .isCandidateListEmpty) {
      return emptyListLFGPage();
    }
    // будем брать верхнего в списке
    final thisCandidate = Provider.of<TeamManager>(context, listen: true).
      getCandidateToCheck;
    // Надо сделать, как в примере, explore_screen.dart, но пока
    // как есть


    return SingleChildScrollView(                  
      child: Container(
      width: double.infinity,
      child: Container(        // searchmemberforteamTfH (20:765)
        width: double.infinity,
        height: 896*fem,
        decoration: const BoxDecoration (
          color: Color(0xfff0f0f0),
        ),
        child: Stack(
          children: [
            Positioned(              // backgroundqrB (40:183)
              left: 0*fem,
              top: 397*fem,
              child: Container(
                width: 414*fem,
                height: 349*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(                      // rectangle22WSX (40:190)
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
                      // rectangle2118P (40:186)
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
                      // rectangle20iHh (40:182)
                      width: double.infinity,
                      height: 143*fem,
                      decoration: const BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(              // borderF2j (20:890)
              left: -95*fem,
              top: -75*fem,
              child: Align(
                child: SizedBox(
                  width: 604*fem,
                  height: 1000.77*fem,
                  child: Image.asset(
                    'assets/atb_assets/border-DZV.png',
                    width: 604*fem,
                    height: 1000.77*fem,
                  ),
                ),
              ),
            ),
            Positioned(              // namer2X (20:782)
              left: 81*fem,
              top: 403*fem,
              child: Align(
                child: SizedBox(
                  width: 252*fem,
                  height: 29*fem,
                  child: Text(
                    '${thisCandidate.firstName} ${thisCandidate.lastName}',
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
            Positioned(              // competencetitlesiK (20:831)
              left: 145.5*fem,
              top: 432*fem,
              child: Align(
                child: SizedBox(
                  width: 124*fem,
                  height: 25*fem,
                  child: Text(
                    thisCandidate.role,
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
            ),
            Positioned(              // contactsuuu (40:245)
              left: 42*fem,
              top: 470*fem,
              child: Container(
                width: 198*fem,
                height: 92*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(                      // contacttitleCPD (20:832)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                        width: double.infinity,
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
                    Container(                      // autogrouplpktchq (Xu2TcmD3FcYF1fJtphLpkT)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 6*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(                            // emailtitleKMM (20:833)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                            child: Text(
                              'Email: ',
                              style: TextStyle (
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color:const Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(                            // emailinfobJs (20:835)
                            thisCandidate.email,
                            style: TextStyle (
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3625*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(                      // autogroupystqHSb (Xu2TsAxhLzyLf5qqXpysTq)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(                            // phonetitlezbu (40:189)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                            child: Text(
                              'Phone:',
                              style: TextStyle (
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3625*ffem/fem,
                                letterSpacing: -0.3000000119*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(                            // phoneinfoUX5 (40:188)
                            thisCandidate.phone,
                            style: TextStyle (
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3625*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(              // descriptionyTq (40:266)
              left: 42*fem,
              top: 577*fem,
              child: Container(
                width: 321*fem,
                height: 199*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(                      // desctitleT87 (20:840)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 15*fem),
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
                    Container(                      // descinfogFm (20:783)
                      constraints: BoxConstraints (
                        maxWidth: 321*fem,
                      ),
                      child: Text(
                        thisCandidate.longtext,
                        textAlign: TextAlign.left,
                        // хорошо бы скроллинг сделать для описания
                        // или вытащить все из Stack и тогда можно сделать текст expand
                        // сейчас из-за Stack на кнопки налезает
                        maxLines: 10,
                        overflow: TextOverflow.fade,
                        style: TextStyle (
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.1725*ffem/fem,
                          letterSpacing: -0.3000000119*fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(              // buttonsKJj (40:325)
              left: 30*fem,
              top: 755*fem,
              child: Container(
                width: 334*fem,
                height: 125*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(                      // autogroupfyqpC7d (Xu2UMAA4hBgi1oTTiefyQP)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.08*fem),
                      height: 75.92*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(                            // rejectbuttonTZM (20:836)
                            onPressed: () {
                              Provider.of<TeamManager>(context, listen: false)
                                .popLastFromTeamCandidates(thisCandidate);
                              // TODO добавить нотификацию пользователю
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 105*fem,
                              height: 64*fem,
                              decoration:  BoxDecoration (
                                color: const Color(0xffad2c2c),
                                borderRadius: BorderRadius.circular(10*fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Не подходит',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2025*ffem/fem,
                                    letterSpacing: -0.3000000119*fem,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9*fem,
                          ),
                          TextButton(
                            // laterbuttonPbR (20:841)
                            onPressed: () {
                              Provider.of<TeamManager>(context, listen: false)
                                .moveLastCandidateToFirst(thisCandidate);
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 105*fem,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // rectangle5Usm (I20:841;3:68)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 105*fem,
                                        height: 64*fem,
                                        child: Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(10*fem),
                                            color: Color(0xff3498db),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // masukk4b (I20:841;3:69)
                                    left: 7.7711791992*fem,
                                    top: 20.9230957031*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 89*fem,
                                        height: 55*fem,
                                        child: Text(
                                          'Рассмотреть \nпозже',
                                          textAlign: TextAlign.center,
                                          style: TextStyle (
                                            fontSize: 15*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2025*ffem/fem,
                                            letterSpacing: -0.3000000119*fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9*fem,
                          ),
                          TextButton(
                            // acceptbuttonjhD (20:784)
                            onPressed: () {
                              Provider.of<TeamManager>(context, listen: false)
                                .acceptMembers(thisCandidate);
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 105*fem,
                              height: 64*fem,
                              decoration: BoxDecoration (
                                color: Color(0xff33a729),
                                borderRadius: BorderRadius.circular(10*fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Подходит',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2025*ffem/fem,
                                    letterSpacing: -0.3000000119*fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupxch9EGb (Xu2UduBAjRLvGnTYH1xCH9)
                      width: double.infinity,
                      height: 46*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // profilebuttonY2P (39:50)
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
                          side: BorderSide(color: Color(0xff1b268a))),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              // text3F9 (39:75)
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
                                        color: Color(0xff1b268a),
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
                          Container(
                            // teambuttonWG3 (39:53)
                            width: 145*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(10*fem),
                            ),
                            child:  ElevatedButton( //button to Team Search. Не нашел виджет, пока что search member
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
                                foregroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10*fem),
                                ),
                                side: const BorderSide(color: Color(0xff01746d))),
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
                                            color: Color(0xff06661b),
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
                  ],
                ),
              ),
            ),
            Positioned(
              // photoprofile8gj (20:844)
              left: 31*fem,
              top: 33*fem,
              child: Align(
                child: SizedBox(
                  width: 352*fem,
                  height: 330*fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30*fem),
                    child: Image.asset(
                      thisCandidate.profileImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget emptyListLFGPage() {
    
    return const SingleChildScrollView(
      child: SizedBox(
      width: double.infinity,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/fooderlich_assets/rw_logo.png'),
          ),
          
          Text(
              'У вашей команды нет кандидатов на вступление',
              style: TextStyle(fontSize: 55,),
              textAlign: TextAlign.center, 
            ),
            
        ],
      )
        
      ),
    );
  }
}