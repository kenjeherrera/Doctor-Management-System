import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  List<Map<String,String>> patients = [];

  TextEditingController nameController =
  TextEditingController();

  TextEditingController doctorController =
  TextEditingController();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Register Appointment"),
              SizedBox(height:20,),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Patient Name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(
                  labelText: "Doctor",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed:(){
                  if (nameController.text.isEmpty || doctorController.text.isEmpty){
                    print("please fill all fields");
                  }else {
                    setState(() {
                      patients.add(
                          {
                            "name": nameController.text,
                            "doctor": doctorController.text,
                            "status": "Pending",
                          }
                      );
                      nameController.clear();
                      doctorController.clear();
                    });
                  }
                },
                child: Text("Register"),
              ),

              Expanded(
                child:ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Text("Name: ${patients[index]["name"]}"),
                        Text("Doctor: ${patients[index]["doctor"]}"),
                        Text("Status: ${patients[index]["status"]}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              ElevatedButton(
                                onPressed:(){
                                  setState((){
                                    patients[index]["status"] = "Confirmed";
                                  });
                                },
                                child: Text("confirm"),
                              ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed:(){
                                setState((){
                                  patients.removeAt(index);
                                });
                              },
                              child: Text("delete"),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                )
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Kenje Clinic"),
          centerTitle: true,
        ),
      ),
    );
  }
}