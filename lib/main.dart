import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:email_validator/email_validator.dart';
//import 'detail_page.dart';

void main() {
  var email = "abc@gmail.com";
  assert(EmailValidator.validate(email));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child:Text("Registration Form",),),
        ),
        body: MyForm(),
      ),
    );
  }
}
enum Gender { Male, Female }
class MyForm extends StatefulWidget {
  MyForm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  int id = 1;
  File _image;
  final ImagePicker imagePicker = ImagePicker();
  String radioButtonItem = 'Male';
  bool autoValidate = false;
  bool itVal = false;
  bool ceVal = false;
  bool bcaVal = false;
  double currentVal = 20;
  DateTime currentDate = DateTime.now();

  final RegExp phn = new RegExp(r"^(?:[+0]9)?[0-9]{10,12}$");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        // ignore: deprecated_member_use
        autovalidate: autoValidate,
        child: Column(
          children: <Widget>[
           SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black38,
                  child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image, width: 100, height: 100, fit: BoxFit.fitHeight,),)
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Name",
                ),
                validator: (value) {
                  if (value.length<3) {
                    return 'Please Enter Valid Name';
                  }
                  return null;
                },
              ),),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: 'Enter Email Id'
                ),
                 validator: (value) => EmailValidator.validate(value) ? null : "Please Enter Valid Email",
              ),),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    hintText: "Enter Mobile Number",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                    if (!phn.hasMatch(value)) {
                    return 'Please Enter Valid Mobile Number';
                  }
                  else
                    return null;
                },

              ),),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Text("Date Of Birth",style: TextStyle(fontSize: 15),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("${currentDate.toLocal()}".split(' ')[0],
                           style: TextStyle(fontSize: 15,),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          RaisedButton(
                              padding: EdgeInsets.all(5),
                              color: Colors.white,
                              elevation: 0,
                              onPressed: () => _pickedDate(context),
                              child: Text("Select Date")
                          ),
                    ],
                  ),),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Text("Gender",style: TextStyle(fontSize: 15),),
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Male';
                        id = 1;
                      });
                    },
                  ),
                  Text('Male', style: new TextStyle(fontSize: 17.0),
                  ),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Female';
                        id = 2;
                      });
                    },
                  ),
                  Text('Female', style: new TextStyle(fontSize: 17.0,),
                  ),
                ],),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Text("Department",style: TextStyle(fontSize: 15),),
                  Column(
                    children: <Widget>[
                      Text("IT"),
                      Checkbox(
                        value: itVal,
                        onChanged: (bool value) {
                          setState(() {
                           itVal = value;
                          });
                        },
                      ),
                    ],),
                  Column(
                    children: <Widget>[
                      Text("CE"),
                      Checkbox(
                        value: ceVal,
                        onChanged: (bool value) {
                          setState(() {
                            ceVal = value;
                          });
                        },
                      ),
                    ],),
                  Column(
                    children: <Widget>[
                      Text("BCA"),
                      Checkbox(
                        value: bcaVal,
                        onChanged: (bool value) {
                          setState(() {
                            bcaVal = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text("Age",style: TextStyle(fontSize: 15),),
                  Column(
                    children: <Widget>[
                      Text(currentVal.toString(),),
                      Slider(
                        value: currentVal,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: currentVal.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentVal = value;
                          });
                        },
                      ),
                    ],),
                ],),),
            Container(
                //padding: EdgeInsets.all(30),
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed:
                  _validateInputs,
                   // navigateToSubPage(context);
                )
            ),
          ],),
      ),
    );
  }
  // Future navigateToSubPage(context) async {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  // }
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }
  Future<void> _pickedDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2050));
    if (date != null && date != currentDate)
      setState(() {
        currentDate = date;
      });

  }

   _imgFromCamera() async {
    var image = (await imagePicker.getImage(
        source: ImageSource.camera,
        imageQuality: 50
    ));
    setState(() {
      _image = image as File;
    });
  }
  _imgFromGallery() async {
    File image = (await imagePicker.getImage(
        source: ImageSource.gallery,
        imageQuality: 50
    )) as File;
    setState(() {
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
