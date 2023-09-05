import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_doctor/custom%20widget/button.dart';
import 'package:my_doctor/service/global_variables.dart';
import 'package:my_doctor/view_models/registration_view_model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final vm = RegistrationViewModel();
  bool isPasswordHide = true;
  bool isrePasswordHide = true;
  String passwords = '';
  XFile? uploadedImg;
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordView() {
    setState(() {
      isPasswordHide = !isPasswordHide;
    });
  }

  void _togglerePasswordView() {
    setState(() {
      isrePasswordHide = !isrePasswordHide;
    });
  }

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      globalVariables.image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF3FBFF),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 0.060.sw,
          right: 26,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Let's create account",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            const Text(
              "Welcome Doctor, Lets Create your account!",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffBBBBBB)),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: CircleAvatar(
                      maxRadius: 80,
                      child: globalVariables.image == null
                          ? Image.asset(
                              "assets/images/instadoclogo.png",
                              fit: BoxFit.fill,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(globalVariables.image!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          myAlert();

                          /* showDialog(
                              context: context,
                              builder: (context) => ProfilePicUploadDialog(),
                              barrierDismissible: false);*/
                        },
                        icon: const Icon(Icons.edit)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 430,
              width: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: const Text(
                                "Dr.",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff707070)),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  controller: vm.nameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    hintStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Image.asset(
                                    "assets/images/mobile_icon.png")),
                            Spacer(),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  onChanged: (number) {
                                    if (number.length == 10) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                  maxLength: 10,
                                  controller: vm.mobileController,
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText: 'Mobile Number',
                                    hintStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 23),
                                child: Image.asset(
                                    "assets/images/regEmail_icon.png")),
                            Spacer(),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextFormField(
                                  validator: (input) => vm.isValidEmail(input!)
                                      ? null
                                      : "Invalid email",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: vm.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Email Address',
                                    hintStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Image.asset(
                                    "assets/images/regPassword_icon.png")),
                            Spacer(),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  onChanged: (value) {
                                    passwords = value;
                                  },
                                  controller: vm.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  onTap: _togglePasswordView,
                                  obscureText: !isPasswordHide,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      isPasswordHide
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xffC7C7C7),
                                      size: 40,
                                    ),
                                    /*Icon(
                                      Icons.remove_red_eye,
                                      color: Color(0xffC7C7C7),
                                      size: 40,
                                    ),*/
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: 500,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 15),
                                child: Image.asset(
                                    "assets/images/regPassword_icon.png")),
                            Spacer(),
                            Container(
                              height: 70,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value != passwords) {
                                      return "Password Not Matched";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: vm.reenterpassowrdController,
                                  keyboardType: TextInputType.visiblePassword,
                                  onTap: _togglerePasswordView,
                                  obscureText: !isrePasswordHide,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      isrePasswordHide
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color(0xffC7C7C7),
                                      size: 40,
                                    ),
                                    hintText: 'Re-enter Password',
                                    hintStyle: TextStyle(
                                        fontSize: 25, color: Color(0xffC7C7C7)),
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
            ),
            SizedBox(
              height: 9,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 70,
                  width: 500,
                  child: ourButton(
                      onPress: vm.isAllFieldComplete() == true
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                // do the API call here
                                // print("${File(globalVariables.image!.path)}");
                                vm.nextStep();
                              }
                            }
                          : null,
                      color: Color(0xff1468B3),
                      title: "Next Step",
                      textColor: Colors.white)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 4, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "I agree with all the",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffCFCFCF)),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "terms and conditions",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1468B3),
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "of eprescribe.in",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffCFCFCF),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
