import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/pages/add_assistant_page.dart';

import '../service/global_variables.dart';

class AssistantRolePage extends StatefulWidget {
  const AssistantRolePage({super.key});

  @override
  State<AssistantRolePage> createState() => _AssistantRolePageState();
}

class _AssistantRolePageState extends State<AssistantRolePage> {
  List<Map<String, dynamic>> assistantRoles = [
    {
      "role_name": "Receptionist",
      "role_details": "Could be assigned to Receptionist Or Compounder",
      "feature_1_icon": "assets/images/star_icon.png",
      "feature_1_name": "Appointments",
      "feature_2_icon": "assets/images/partial_privillege_icon.png",
      "feature_2_name": "Patient Details (Basic Details)",
      "feature_3_icon": "assets/images/no_access_icon.png",
      "feature_3_name": "Medical Investigations",
      "feature_4_icon": "assets/images/no_access_icon.png",
      "feature_4_name": "Notes",
      "feature_5_icon": "assets/images/star_icon.png",
      "feature_5_name": "Clinic Settings",
      "feature_6_icon": "assets/images/star_icon.png",
      "feature_6_name": "Invoice and Receipt",
      "feature_7_icon": "assets/images/partial_privillege_icon.png",
      "feature_7_name": "Doctor Profile (Share Only)"
    },
    {
      "role_name": "Assistant Doctor",
      "role_details": "Could be assigned to Assistant Doctor or Partner Doctor",
      "feature_1_icon": "assets/images/star_icon.png",
      "feature_1_name": "Full Access",
      "feature_2_icon": "assets/images/partial_privillege_icon.png",
      "feature_2_name": "Medical Investigations (No delete)"
    },
    {
      "role_name": "Medical Assistant",
      "role_details":
          "Could be assigned to Nurse,Physician or Medical Assistant",
      "feature_1_icon": "assets/images/star_icon.png",
      "feature_1_name": "Appointments",
      "feature_2_icon": "assets/images/star_icon.png",
      "feature_2_name": "Patient Details (Basic Details)",
      "feature_3_icon": "assets/images/partial_privillege_icon.png",
      "feature_3_name": "Medical Investigations",
      "feature_4_icon": "assets/images/star_icon.png",
      "feature_4_name": "Notes",
      "feature_5_icon": "assets/images/star_icon.png",
      "feature_5_name": "Clinic Settings",
      "feature_6_icon": "assets/images/star_icon.png",
      "feature_6_name": "Invoice and Receipt",
      "feature_7_icon": "assets/images/partial_privillege_icon.png",
      "feature_7_name": "Doctor Profile (Share Only)"
    },
  ];
  List<Map<String, dynamic>> selectedRoles = [];
  Map<String, dynamic>? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Assistant's Role",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/cross_icon.png",
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              print("$selectedRole");
              print("${ globalVariables.selectedAssistantRoleNames}");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAssistantPage()),
              );
            },
            child: Image.asset(
              "assets/images/done2_icon.png",
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/star_icon.png",
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      "Full Privileges",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.green,
                    ),
                    Text(
                      "Partial Privileges",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.red,
                    ),
                    Text(
                      "No Access",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              height: 700,
              width: 500,
              child: ListView.builder(
                  itemCount: assistantRoles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: RadioListTile(
                            activeColor: Color(0xff0066ff),
                            groupValue: selectedRole,
                            value: assistantRoles[index],
                            onChanged: (dynamic value) {
                              setState(() {
                                selectedRole = value;
                                globalVariables.selectedAssistantRoleNames = value["role_name"];
                              });
                            },
                           /* checkboxShape: CircleBorder(),
                            activeColor: Color(0xff0066ff),
                            controlAffinity: ListTileControlAffinity.leading,*/
                           /* value:
                                selectedRoles.contains(assistantRoles[index]),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null && value) {
                                  selectedRoles.add(assistantRoles[index]);
                                  globalVariables.selectedAssistantRoleNames
                                      .add(assistantRoles[index]["role_name"]);
                                } else {
                                  selectedRoles.remove(assistantRoles[index]);
                                  globalVariables.selectedAssistantRoleNames
                                      .remove(
                                          assistantRoles[index]["role_name"]);
                                }
                              });
                            },*/
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${assistantRoles[index]["role_name"]}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${assistantRoles[index]["role_details"]}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                assistantRoles[index]["feature_1_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_1_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_1_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_2_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_2_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_2_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_3_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_3_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_3_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_4_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_4_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_4_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_5_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_5_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_5_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_6_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_6_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_6_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                                assistantRoles[index]["feature_7_icon"] == null
                                    ? Container(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Row(
                                        children: [
                                          Image.asset(
                                            assistantRoles[index]
                                                ["feature_7_icon"],
                                            height: 20,
                                            width: 20,
                                          ),
                                          Text(
                                              "${assistantRoles[index]["feature_7_name"]}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade800)),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
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
