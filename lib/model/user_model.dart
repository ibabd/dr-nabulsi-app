class UserModel{
  String ? userId , email , name , picture ;
  UserModel({required this.userId,required this.email,required this.name,required this.picture});
  UserModel.fromJson(Map<dynamic,dynamic>map){
    // ignore: unnecessary_null_comparison
    if(map ==null){
      return ;
    }else{
      userId=map['userId'];
      email=map['email'];
      name=map['name'];
      picture=map['picture'];
    }
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': picture,
    };
  }
}