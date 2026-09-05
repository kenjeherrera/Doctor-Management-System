import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  List<Map<String,String>> patients =[];
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
              Text("Appointment Tracker"),
              SizedBox(height: 20,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Patient Name",
                  border: OutlineInputBorder(),
                )
              ),

              SizedBox(height: 20,),
              TextField(
                controller: doctorController,
                decoration: InputDecoration(
                  labelText: "Doctor Name",
                  border: OutlineInputBorder(),
              ),
              ),
              ElevatedButton(
                onPressed: (){
                  if (nameController.text.isEmpty || doctorController.text.isEmpty) {
                    print("Please fill in all fields");
                  }else {
                    setState(() {
                      patients.add({
                        "name": nameController.text,
                        "doctor": doctorController.text,
                        "status": "Pending",
                      });
                      nameController.clear();
                      doctorController.clear();
                    });
                  }
                },
                child: Text("Register Appointment"),
              ),

              SizedBox(height: 20,),
              Text("Appointments"),
              Expanded(
                child:ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("Patient Name: ${patients[index]["name"]}"),
                        SizedBox(height: 10,),
                        Text("doctor: ${patients[index]["doctor"]}"),
                        SizedBox(height: 10,),
                        Text("Status: ${patients[index]["status"]}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                setState((){
                                  patients[index]["status"] = "Confirmed";
                                });
                              },
                              child: Text("Confirm"),
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  patients.removeAt(index);
                                });
                              },
                              child: Text("Delete"),
                            )
                          ],
                        )
                      ],
                    );
                  }
                )
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Eye Optical Clinic"),
          centerTitle: true,
        ),
      ),
    );
  }
}