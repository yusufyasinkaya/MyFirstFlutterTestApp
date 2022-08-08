import 'dart:ui';

class Student{
   late int id;
   late String firstName;
   late String lastName;
   late int grade;
   late String _status;


  Student.withId(int id, String firstName,String lastName,int grade){
    this.id=id;
    this.firstName= firstName;
    this.lastName= lastName;
    this.grade=grade;
  }
   Student(int id, String firstName,String lastName,int grade){
     this.firstName= firstName;
     this.lastName= lastName;
     this.grade=grade;
   }
   Student.withoutInfo(){}
 String get getFirstName{
    return "OGR - " + this.firstName;

  }
  void set setFirstName(String value){
    this.firstName=firstName;
  }
  String get getStatus{
    String mesaj = "";
    if (this.grade >= 50) {
      mesaj = "Geçti";
    } else if (this.grade >= 40) {
      mesaj = "Büt";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }
}