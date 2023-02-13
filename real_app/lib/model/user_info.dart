class UserInfo{
  final bool isLogin;
  final String userName;
  final String age;
  final String role;

  const UserInfo({this.isLogin = false,this.userName="Guest", this.age = "-999",this.role = "guest"});
}