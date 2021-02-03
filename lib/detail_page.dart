import 'package:flutter/material.dart';
class SubPage extends StatelessWidget {
  final userMail;
  final userName;
  final userNum;
  final userDate;
  final userAge;
  final userGender;
  final userDept;
  SubPage({Key key, @required this.userName,this.userMail,this.userNum,this.userDate,this.userAge,this.userGender,this.userDept}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text("Registration Form",))
      ),
      body:
         Padding(
           padding: const EdgeInsets.all(30),
           child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(alignment:Alignment.centerLeft,
                child:Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Name: ' + userName,
                    //textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,),
                  ),
                ),),
                Align(alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Email Id: ' + userMail,
                 // textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),),
                    )),

                Align(
                    alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Mobile Number: ' + userNum,
                  //textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15),),
                    )),

                 Align( alignment:Alignment.centerLeft,
                     child: Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Text('Date: ' + "${userDate}".split(' ')[0],
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),),
                     )),

                Align(
                    alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Gender: ' + userGender,
                  //textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),),
                    )),

                Align(
                    alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Department: ' + userDept,
                        //textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),),
                    )),
                // Center( child:
                // Text('Department: ' + userDept,
                //   style: TextStyle(fontSize: 15),)),
                Align(
                    alignment:Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Age: ' + userAge.toString(),
                  //textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),),
                    )),
              ],),
         ),
      );
  }
}