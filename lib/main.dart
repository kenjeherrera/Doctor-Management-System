import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  List<Map<String, String>> patients = [];
  TextEditingController  patientNameController =
  TextEditingController();

  TextEditingController doctorController =
  TextEditingController();


  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kenje Clinic"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add patient"),

              SizedBox(height: 20,),

              TextField(
                controller: patientNameController,
                decoration: InputDecoration(
                  labelText: "Patient Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),

              TextField(
                controller: doctorController,
                decoration: InputDecoration(
                  labelText: "Doctor",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(
                onPressed:() {
                  if (patientNameController.text.isEmpty ||
                      doctorController.text.isEmpty) {
                    print("Please fill in all fields");
                  } else {
                    setState(() {
                      patients.add({
                        "name": patientNameController.text,
                        "doctor": doctorController.text,
                        "status": "pending",
                      });
                      patientNameController.clear();
                      doctorController.clear();
                    });
                  }
                },
                child: Text("Register Patient"),
              ),

              Expanded(
                child:ListView.builder(
                  itemCount: patients.length,
                  itemBuilder:(context, index){
                    return Column(
                      children:[
                        Text("Patient Name: ${patients[index]["name"]}"),
                        Text("Doctor: ${patients[index]["doctor"]}"),
                        Text("Status: ${patients[index]["status"]}"),

                        SizedBox(height:10,),
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              patients[index]["status"] = "Checked-In";
                            });
                          },
                          child:Text("Check-In"),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              patients[index]["status"] = "Cancelled";
                              patients.removeAt(index);
                            });
                          },
                          child: Text("Delete"),
                        )
                      ],
                    );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}