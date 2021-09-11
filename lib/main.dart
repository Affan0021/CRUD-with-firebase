import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()
{

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

    home: Main(),

  ));

}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);


  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override

   var studentName , studentID  , studyProgramID, studentGPA;


  getStudentName(name)
  {
    this.studentName = name;
  }
  getStudentID(id)
  {
    this.studentID = id;
  }

  getStudyProgramID(programID)
  {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa)
  {
    this.studentGPA = gpa;
  }

  createData()
  {
     DocumentReference documentReference =
         FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    Map<String,dynamic> students=
    {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
      


    };
     documentReference.set(students).whenComplete(() {
       print("student Name created");
     });

  }

  readData(){
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    documentReference.get().then((data)
    {

      print(data["studentName"]);
      print(data["studentID"]);
      print(data["studyProgramID"]);
      print(data["studentGPA"]);


    }

    );



  }

  updateData(){

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);

    Map<String,dynamic> students=
    {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,

    };
    // documentReference.update(students);
    documentReference.set(students).whenComplete(() {
      print("student Name created");
    });


  }

  deleteData(){
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    documentReference.delete().whenComplete(() {
      print("student Name deleted");
    });


    print('delete');
  }



  Widget build(BuildContext context) {



    return Scaffold(
    appBar: AppBar(
      title: Text('Main'),


    ),



      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: Colors.blueGrey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 3,



                  )

                )


              ),
                onChanged: (String name)
                {
                    getStudentName(name);
                }



            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "StudentID",
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 3,


                        )

                    )


                ),
                onChanged: (String id)
                {
                  getStudentID(id);
                }



            ),
          ),Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "study",
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 3,


                        )

                    )


                ),
                onChanged: (String programID)
                {

                  getStudyProgramID(programID);
                }



            ),
          ),Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Gpa",
                    fillColor: Colors.blueGrey,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black26,
                          width: 3,


                        )

                    )


                ),
                onChanged: (String gpa)
                {
                  getStudentGPA(gpa);
                }



            ),
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: ()

                {
                    createData();
                },


                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.indigoAccent;
                    },
                  ),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.white)
                      )
                  ),

                ),

                child: Text(
                  '\tCreate ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: ()

                {
                  readData();
                },


                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.indigoAccent;
                    },
                  ),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.white)
                      )
                  ),

                ),

                child: Text(
                  '\tRead ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: ()

                {
                  updateData();

                },


                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.indigoAccent;
                    },
                  ),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.white)
                      )
                  ),

                ),

                child: Text(
                  '\tUpdate ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: ()

                {
                  deleteData();

                },


                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.indigoAccent;
                    },
                  ),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                              color: Colors.white)
                      )
                  ),

                ),

                child: Text(
                  '\tDelete ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],

          )


        ],


      )


    );



  }
}
