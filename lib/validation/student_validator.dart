class StudentValidationMixin{
   String validateFirstName(String? value){
    if(value!.length<2){
      String mesaj="İsim en az iki karakter olmalı";
      return mesaj;
    }
    return "Başarılı";
  }
   String validateLastName(String? value){
     if(value!.length<1){
       String mesaj="Soy İsim en az iki karakter olmalı";
       return mesaj;
     }
     return "Başarılı";
   }
   String validateGrade(String? value){
     var grade=int.parse(value!);
     if(grade<0||grade>100){
       return "Not 0-100 aralığında olmalı";
     }
     return "başarılı";
   }
}