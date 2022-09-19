import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../shared/components/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:gammal_tech_community/services/firestore.dart';

class AddCourse extends StatefulWidget {
  AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  File? file;

  var image_picker = ImagePicker();

  var courseImage;

  var imageUrl;

  var courseName;

  UploadImage(context) async {
    courseImage = await image_picker.pickImage(source: ImageSource.gallery);

    if (courseImage != null) {
      file = File(courseImage.path);
      var imageName = basename(courseImage.path);

      //start uploading the image file

      final refStorage =
          FirebaseStorage.instance.ref('images/courses/$imageName');

      await refStorage.putFile(file!);
      imageUrl = await refStorage.getDownloadURL();
      setState(() {});
      //end uploading the image file
    } else {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: const Text(
            'Please Choose an image\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    }
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  final storage = FirebaseStorage.instance;

  var courseNameContoller = TextEditingController();

  @override
  void initState() {
    super.initState();

    ///whatever you want to run on page build
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new course'),
      ),
      body: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultFormField(
                      onSaved: (val) {
                        courseName = val;
                      },
                      onSubmit: (value) {},
                      onChange: ((value) => null),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: courseNameContoller,
                      label: 'Course name',
                      prefix: FontAwesomeIcons.book,
                      type: TextInputType.url,
                    ),
                    SizedBox(height: 10),
                    courseImage == null
                        ? InkWell(
                            onTap: () async {
                              await UploadImage(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromARGB(255, 255, 240, 240),
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Uplaod Image',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Image(image: NetworkImage(imageUrl)),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () async {
                        var formData = formKey.currentState;

                        if (formData!.validate()) {
                          formData.save();
                          print('===================================');
                          print(imageUrl);
                          print('===================================');
                          print(courseName);
                        }
                        if (imageUrl != null && courseName != null) {
                          await FirestoreService()
                              .addCourse(context:context,img: imageUrl,name: courseName);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: Color.fromARGB(255, 0, 125, 112),
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Add Course',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
