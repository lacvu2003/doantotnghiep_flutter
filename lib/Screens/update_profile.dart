import 'package:doantotnghiep/Screens/profile.dart';
import 'package:doantotnghiep/values/app_colors.dart';
import 'package:doantotnghiep/values/images_string.dart';
import 'package:doantotnghiep/values/text_strings.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 2,
        primary: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          tEditProfile,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
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
                        Icons.settings,
                        size: 18,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                    label: Text("Full Name"),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined))),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Phone No."),
                          prefixIcon: Icon(Icons.phone_android))),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Password"),
                          prefixIcon: Icon(Icons.fingerprint_rounded))),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
