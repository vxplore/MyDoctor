import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login_page.dart';
import '../service/navigation_service.dart';
import 'button.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.white,
          // height: 0.3.sh,
          // width: 0.8.sw,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("Logout",style: TextStyle(fontSize: 25.sp,color: Colors.black)),
              Divider(),
             /* Strings.wantToLogout.text(
                TextStyles.defaultStyle
                    .copyWith(fontSize: 20.sp, color: Colors.black),
              ),*/
              Text("Do you want to logout?",style: TextStyle(fontSize: 25.sp,color: Colors.black)),
              SizedBox(
                height: 0.03.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 0.07.sh,
                    width: 0.27.sw,
                    child: ourButton(
                        color: Colors.blue,
                        onPress: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.remove("UserId");
                          NavigationService().navigateToScreen(LoginPage());
                        },
                        textColor: Colors.white,
                        title: "Yes"),
                  ),
                  Container(
                    height: 0.07.sh,
                    width: 0.27.sw,
                    child: ourButton(
                        color: Colors.black,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        title: "No"),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
            ],
          ),
        ));;
  }
}
