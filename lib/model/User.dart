

class AppUser{
  String fullName;
  String userName;
  String mobile;
  String title;//User's Proffesion
  String email;
  String id;

  AppUser(this.userName,this.title,this.mobile,this.email,this.fullName,this.id);





  AppUser.fromData(Map<String,dynamic> data):
        id=data['id'],title=data['title'],
  fullName=data['fullName'],userName=data['userName'],mobile=data['mobile'],email=data['email'];

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'title':title,
      'fullName':fullName,
     'userName': userName,
      'mobile':mobile,
      'email':email,
    };
  }


}