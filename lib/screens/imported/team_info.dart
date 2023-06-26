// ignore_for_file: file_names, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);
  // int id;
  @override
  Widget build(BuildContext context) {
    
    final currentTeam = Provider.of<TeamManager>(context, listen: false).
      getTeam;
    
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    final ffem = fem * 0.97;
    return SingleChildScrollView(                  
      child: Container(
      width: double.infinity,
      child: Container(
        // teaminfojkP (20:845)
        width: double.infinity,
        height: 896*fem,
        decoration: const BoxDecoration (
          color: Color(0xfff0f0f0),
        ),
        child: Stack(
          children: [
            Positioned(              // backgroundBsH (40:259)
              left: 0*fem,
              top: 200*fem,
              child: Container(
                width: 414*fem,
                height: 617*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(                      // rectangle23fXZ (40:269)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 45*fem),
                      width: double.infinity,
                      height: 65*fem,
                      decoration: const BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(                      // rectangle22WHH (40:262)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 36*fem),
                      width: double.infinity,
                      height: 154*fem,
                      decoration: const BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(                      // rectangle21WwV (40:261)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
                      width: double.infinity,
                      height: 67*fem,
                      decoration: const BoxDecoration (
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(                      // rectangle20kaw (40:260)
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
            Positioned(              // borderV2j (20:889)
              left: -95*fem,
              top: -75*fem,
              child: Align(
                child: SizedBox(
                  width: 604*fem,
                  height: 1000.77*fem,
                  child: Image.asset(
                    'assets/atb_assets/border-noD.png',
                    width: 604*fem,
                    height: 1000.77*fem,
                  ),
                ),
              ),
            ),
            
            Positioned(              // membersnfM (40:270)
// TODO: Nested скроллинг участников команды и ограничения на список, чтоб не выходил за рамки

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
                        if (currentTeam.members.length > 0) {

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
            Positioned(              // contactsfFH (40:264)
              left: 42*fem,
              top: 470*fem,
              child: Container(
                width: 260*fem,
                height: 90*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(                      // autogroupxbhdM87 (Xu2ZpW3HsXfaakyX1ixbhD)
                      padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(                            // contacttitleed1 (40:265)
                            child: Container(
                              margin: EdgeInsets.fromLTRB(62*fem, 0*fem, 0*fem, 12*fem),
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
                          Container(                            // autogroupheifKUF (Xu2ZS6WxY6AwyhhFgMhEiF)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 63*fem, 0*fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(                                  // emailtitle16B (20:900)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
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
                                Text(                                  // emailinforsV (20:899)
                                  //'ivanov@mail.com',
                                  currentTeam.teamEmail,
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
                    Container(                      // autogroup1uppAdH (Xu2ZdvWaqFXtEKvamd1upP)
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(                            // contacttitleVfZ (20:897)
                            'Contact: ',
                            style: TextStyle (
                              
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3625*ffem/fem,
                              letterSpacing: -0.3000000119*fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                          Text(                            // contactinfooRM (20:898)
                            //'Discord PhantomRU#1289',
                            currentTeam.teamContact,
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
            Positioned(              // informationujH (40:271)
              left: 104.5*fem,
              top: 202*fem,
              child: Container(
                width: 205*fem,
                height: 52*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(                      // teamnamebs1 (20:862)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
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
                    Center(                      // typeinfo5GP (20:901)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                        child: Text(
                          //'Game Development',
                          currentTeam.teamRole,
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3625*ffem/fem,
                            letterSpacing: -0.3000000119*fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(              // buttons7Ty (40:321)
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
                    Container(                      // profilebuttonzGs (39:74)
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
                            Positioned(                              // text3F9 (39:75)
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
                    Container(                      // searchteambuttonW2F (39:77)
                      width: 145*fem,
                      height: double.infinity,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(10*fem),
                      ),
                      child:  ElevatedButton( //button to search member
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
                          side: const BorderSide(color: Color(0xff01746d))),
                        ),
                        child: Stack(
                          children: [
                            Positioned(                              // textR9D (39:78)
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
                  ],
                ),
              ),
            ),
            Positioned(              // descriptionX5m (40:267)
              left: 42*fem,
              top: 577*fem,
              child: Container(
                width: 321*fem,
                height: 213*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(                      // desctitleo3H (40:263)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 12*fem),
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
                    Container(                      // descinfoteamEPV (20:870)
                      constraints: BoxConstraints (
                        maxWidth: 321*fem,
                      ),
                      child: Text(
                        //'Хотел бы чтобы вы сделали игру, 3Д-экшон суть такова... Пользователь может играть лесными эльфами, охраной дворца и злодеем. И если пользователь играет эльфами то эльфы в лесу, домики деревяные набигают солдаты дворца и злодеи. Можно грабить корованы... И эльфу раз лесные то сделать так что там густой лес...\n\nP.S. Я джва года хочу такую игру.\n',
                        
                        currentTeam.description,
                        textAlign: TextAlign.left,
                        maxLines: 10,
                        overflow: TextOverflow.fade,
                        style: TextStyle (
                          
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.1725*ffem/fem,
                          letterSpacing: -0.3000000119*fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(              // phototeamHMm (20:904)
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
                      'assets/atb_assets/phototeam.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(              // editiconvQj (40:328)
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
                      context.goNamed(
                        'teamEdit', 
                        pathParameters: {
                          'tab': '${AtbTab.teamInfo}',                    
                        }
                      );
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