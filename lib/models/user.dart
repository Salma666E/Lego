class User{
  String uid;
  String displayName;
  String email;
  String password;
  String month;
  String day; 
  String year;
  bool termsCheck;
  bool isAdmin;
  

  User({
    this.uid,
    this.displayName,
    this.email, 
    this.password,
    this.month,
    this.day,
    this.year, 
    this.termsCheck,
    this.isAdmin
  });
}