import 'package:doantotnghiep/Screens/introduce.dart';
import 'package:doantotnghiep/Screens/landing.dart';
import 'package:doantotnghiep/Screens/update_profile.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:doantotnghiep/values/images_string.dart';
import 'package:doantotnghiep/values/text_strings.dart';
import 'package:doantotnghiep/widgets/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String user = "";
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user = preferences.getString('username')!;
    });
  }

  Future logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 2,
        primary: false,
        title: Text(tProfile,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.nights_stay_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tProfileImage1))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.mainColor.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 18,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                tProfileHeading,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              user == ''
                  ? Text('')
                  : Text(
                      user,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
              const SizedBox(height: 10),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateProfile(),
                          ));
                    },
                    child: const Text(
                      tEditProfile,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.mainColor,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                  )),
              const SizedBox(height: 10),
              const Divider(
                color: Color(0xFFF6F4F4),
                thickness: 2,
              ),
              const SizedBox(height: 10),
              PreferencesMenuWidget(
                title: tMenu1,
                icon: Icons.settings,
                textColor: Colors.black,
                endIcon: true,
                onPress: () {},
              ),
              PreferencesMenuWidget(
                title: tMenu2,
                icon: Icons.receipt,
                textColor: Colors.black,
                endIcon: true,
                onPress: () {},
              ),
              PreferencesMenuWidget(
                title: tMenu3,
                icon: Icons.manage_accounts,
                textColor: Colors.black,
                endIcon: true,
                onPress: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color(0xFFF6F4F4),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              PreferencesMenuWidget(
                title: tMenu4,
                icon: Icons.info_outline,
                textColor: Colors.black,
                endIcon: true,
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Introduce(),
                      ));
                },
              ),
              PreferencesMenuWidget(
                title: 'Đăng xuất',
                icon: Icons.logout_outlined,
                textColor: Colors.black,
                endIcon: true,
                onPress: () {
                  logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreferencesMenuWidget extends StatelessWidget {
  const PreferencesMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? AppColor.mainColor : Colors.accents;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColor.mainColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: AppColor.mainColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.mainColor.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.keyboard_arrow_right,
                size: 25.0,
                color: AppColor.mainColor,
              ))
          : null,
    );
  }
}
