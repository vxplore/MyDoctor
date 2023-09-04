
import 'package:my_doctor/service/global_variables.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'button.dart';


class ProfilePicUploadDialog extends StatefulWidget {
  const ProfilePicUploadDialog({super.key});

  @override
  State<ProfilePicUploadDialog> createState() => _ProfilePicUploadDialogState();
}

class _ProfilePicUploadDialogState extends State<ProfilePicUploadDialog> {


  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      globalVariables.image = img;
    });
  }

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
              Text("Upload Pic",
                style: TextStyle(color: Colors.black, fontSize: 25),),
              Divider(),
              Text("Choose One",
                style: TextStyle(color: Colors.black, fontSize: 25),),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 0.07.sh,
                    width: 0.27.sw,
                    child: ourButton(
                        color: Colors.blue,
                        onPress: () {

                          getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        title: "Camera"),
                  ),
                  Container(
                    height: 0.07.sh,
                    width: 0.27.sw,
                    child: ourButton(
                        color: Colors.black,
                        onPress: () {

                          getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        textColor: Colors.white,
                        title: "Gallery"),
                  ),
                ],
              ),
              SizedBox(
                height: 0.02.sh,
              ),
            ],
          ),
        ));
  }


}