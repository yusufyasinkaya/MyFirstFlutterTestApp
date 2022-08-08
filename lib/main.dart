import 'package:deneme/models/student.dart';
import 'package:deneme/screens/student_add.dart';
import 'package:deneme/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int not = 65;

  Student seciliOgrenci = Student(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Yusuf", "Kaya", 25),
    Student.withId(2, "Yusuf", "Bekci", 65),
    Student.withId(3, "Yasin", "Kaya", 40)
  ];

  // var ogrenciler = ["Yusuf","Yasin","Kaya"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
      ),
      body: buildBody(context),
    );
  }

  /*String sinavHesapla(int puan) {
    String mesaj = "";
    if (not >= 50) {
      mesaj = "Geçti";
    } else if (not >= 40) {
      mesaj = "Büt";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }*/

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Başarılı"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        seciliOgrenci = students[index];
                      });

                      print(seciliOgrenci.firstName);
                    },
                  );
                })),
        Text("Seçili Öğrenci: " + seciliOgrenci.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Öğrenci Ekle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.blueAccent,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentEdit(seciliOgrenci)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(seciliOgrenci);
                  });
                  var mesaj = "Şu öğrenci silindi: " +
                      seciliOgrenci.firstName +
                      " " +
                      seciliOgrenci.lastName;
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
