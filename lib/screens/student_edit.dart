import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudents;
  StudentEdit(Student selectedStudents){
    this.selectedStudents=selectedStudents;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudents);
  }
}

class _StudentAddState extends State<StudentEdit> with StudentValidationMixin {
  late Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudents) {
    this.selectedStudent=selectedStudents;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstnameField(),
              buildLastnameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstnameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı: ",hintText:"Adı Girbin" ),
      validator: validateFirstName,
      onSaved: (String? value){
        selectedStudent.firstName=value!;
      },
    );
  }

  Widget buildLastnameField() {
    return TextFormField(
        initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Soy Adı: ",hintText:"Soyadı Girbin" ),
      validator: validateLastName,
      onSaved: (String? value){
        selectedStudent.lastName=value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Notu: ",hintText:"Notu" ),
      validator: validateGrade,
      onSaved: (String? value){
        selectedStudent.grade=int.parse(value!);
      },
    );}

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate());
        formKey.currentState!.save();
        Navigator.pop(context);
        saveStudent();
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
