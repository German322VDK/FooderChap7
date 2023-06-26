import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/circle_image.dart';
import '../models/models.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final int currentTab;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.currentTab,
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            //buildProfileInfo(),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        const SizedBox(height: 16.0),
        buildProfile(),
        const SizedBox(height: 16.0),
        buildProfileInfo(),
        const SizedBox(height: 16.0),
        buildDarkModeRow(),
        ListTile(
          title: const Text('Log out'),
          tileColor: Colors.red,
          titleAlignment: ListTileTitleAlignment.center,
          focusColor: Color.fromARGB(0, 118, 36, 36),
          onTap: () {
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  Widget buildDarkModeRow() {     
// Darkmode работает, но из-за рамки, фона и локальных стилей - надо все менять 
// на стили из atb_theme.dart
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Dark Mode', style: Theme.of(context).textTheme.displayMedium),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          CircleImage(
            imageProvider: AssetImage(widget.user.profileImageUrl),
            imageRadius: 60.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            '${widget.user.firstName} ${widget.user.lastName}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.user.role,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16.0),
          Text(
            '${widget.user.points} points',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileInfo() {
    const baseWidth = 414;
    final fem = MediaQuery.of(context).size.width / baseWidth;
    return Column(
      children: [
        SizedBox(
          width: 300*fem,
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
                    style: Theme.of(context).textTheme.displayMedium
                  ),
                ),
              ),
              SizedBox(        // autogroup8zu98hq (Xu2VvnC4qxRcfwGMDB8zu9)
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Email: ',
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                    SizedBox(width: 36,),
                    Text(                          // emailinfog75 (40:370)
                      widget.user.email,
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                  ],
                ),
              ),
              SizedBox(        // autogroupkikmz7m (Xu2W4rnwNU6qDyxVkxKiKM)
                //width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        'Телефон:',
                        style: Theme.of(context).textTheme.displaySmall
                    ),
                    SizedBox(width: 10,),
                    Text(
                      // emailinfoXG7 (40:372)
                      widget.user.phone,
                      style: Theme.of(context).textTheme.displaySmall
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
