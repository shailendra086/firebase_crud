import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/sevice/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameCnt = new TextEditingController();
  TextEditingController ageCnt = new TextEditingController();
  TextEditingController locationCnt = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Employee',style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),)
            ,SizedBox(width: 10,),Text('Form',style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name",style: TextStyle(color: Colors.blue,fontSize: 20.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(border: Border.all()
              ,borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: nameCnt,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10.0,),
            Text("Age",style: TextStyle(color: Colors.orange,fontSize: 20.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(border: Border.all()
                  ,borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: ageCnt,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10.0,),
            Text("Location",style: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(border: Border.all()
                  ,borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: locationCnt,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 30.0,),
            Center(
              child: ElevatedButton(onPressed: ()async{
                String id = randomAlphaNumeric(10);
                Map<String,dynamic> employeeInfoMap={
                  "Name" : nameCnt.text,
                  "age" : ageCnt.text,
                  "location" : locationCnt.text
                };
                await DatabaseMethods().addEmployeeDetails(employeeInfoMap, id).then((value){
                  Fluttertoast.showToast(
                      msg: "Employee Details Added Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                });

              }, child: Text('Add',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.red
              ),)),
            ),
          ],
        ),
      ),
    );
  }
}
