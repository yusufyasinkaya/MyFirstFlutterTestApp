import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
  StudentAdd(List<Student>students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  late List<Student> students;
  var student=Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student>students) {
    this.students = students;
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
      decoration: InputDecoration(labelText: "Öğrenci Adı: ",hintText:"Adı Girbin" ),
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName=value!;
      },
    );
  }

  Widget buildLastnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soy Adı: ",hintText:"Soyadı Girbin" ),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastName=value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
    decoration: InputDecoration(labelText: "Notu: ",hintText:"Notu" ),
    validator: validateGrade,
    onSaved: (String? value){
      student.grade=int.parse(value!);
    },
  );}

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate());
        formKey.currentState!.save();
        students.add(student);
        Navigator.pop(context);
        saveStudent();
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
