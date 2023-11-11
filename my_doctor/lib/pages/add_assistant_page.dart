import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_doctor/pages/assistant_role_page.dart';
import 'package:my_doctor/pages/manage_assistant-page.dart';
import 'dart:io';
import '../service/global_variables.dart';
import 'assign_clinic_select_page.dart';
import 'out_of_clinic_clinic_select_page.dart';

class AddAssistantPage extends StatefulWidget {
  const AddAssistantPage({super.key});

  @override
  State<AddAssistantPage> createState() => _AddAssistantPageState();
}

class _AddAssistantPageState extends State<AddAssistantPage> {
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media, imageQuality: 50);
    if (img == null)
      // img = await ImagePicker().pickImage(source: ImageSource.gallery);
      return;
    setState(() {
      // globalVariables.image = img;
      globalVariables.profileImagePath = img.path;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add Assistant",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        leading: InkWell(
          onTap: () {
            setState(() {
              globalVariables.selectedAssistantRoleNames = "";
              globalVariables.selectedClinicNames = [];
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ManageAssistantPage()),
            );

          },
          child: Image.asset(
            "assets/images/cross_icon.png",
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                globalVariables.selectedAssistantRoleNames = "";
                globalVariables.selectedClinicNames = [];
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageAssistantPage()),
              );

            },
            child: Image.asset(
              "assets/images/done2_icon.png",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 12),
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
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
                      maxRadius: 70,
                      child: globalVariables.profileImagePath == ""
                          ? Image.asset(
                              "assets/images/instadoclogo.png",
                              fit: BoxFit.fill,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(globalVariables.profileImagePath),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        myAlert();
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("First Name",
                    style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
                Text("*", style: TextStyle(fontSize: 17, color: Colors.red)),
              ],
            ),
            TextField(
              controller: globalVariables.mobileNumberController,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Last Name",
                    style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
                Text("*", style: TextStyle(fontSize: 17, color: Colors.red)),
              ],
            ),
            TextField(
              controller: globalVariables.mobileNumberController,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Mobile Number",
                    style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
                Text("*", style: TextStyle(fontSize: 17, color: Colors.red)),
              ],
            ),
            TextField(
              controller: globalVariables.mobileNumberController,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Email Id",
                style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
            TextField(
              controller: globalVariables.mobileNumberController,
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Assistant Role",
                    style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
                Text("*", style: TextStyle(fontSize: 17, color: Colors.red)),
              ],
            ),
            globalVariables.selectedAssistantRoleNames == ""
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssistantRolePage()),
                      );
                    },
                    child: Text("Select",
                        style: TextStyle(fontSize: 17, color: Colors.grey)),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssistantRolePage()),
                      );
                    },
                    child: Text("${globalVariables.selectedAssistantRoleNames}",
                        style: TextStyle(fontSize: 17, color: Colors.black)),
                  ),
            const SizedBox(
              height: 15,
            ),
           /* InkWell(
              onTap: () {
                showModalBottomSheet(

                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        ),
                        ListTile(
                          leading: Icon(Icons.copy),
                          title: Text('Copy Link'),
                        ),
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Know about role",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      color: Color(0xff1468B3),
                      fontWeight: FontWeight.bold)),
            ),*/
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Assign Clinic/Hospital",
                    style: TextStyle(fontSize: 17, color: Color(0xffC7C7C7))),
                Text("*", style: TextStyle(fontSize: 17, color: Colors.red)),
              ],
            ),
            Container(
              height: 40,
              width: 200,
              child: globalVariables.selectedClinicNames.isEmpty == true
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AssignClinicPage()),
                        );
                      },
                      child: Text("Select",
                          style: TextStyle(fontSize: 17, color: Colors.grey)),
                    )
                  : ListView.builder(
                      itemCount: globalVariables.selectedClinicNames.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AssignClinicPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                                "${globalVariables.selectedClinicNames[index]}",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black)),
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
