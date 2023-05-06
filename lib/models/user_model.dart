class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  // this model help to us  to send and pass data to our registration screen

  UserModel({this.uid,this.email,this.firstName,this.secondName});

  // receiving data from the sever

  factory UserModel.fromMap(map)
  {
    return UserModel(

      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      uid: map["uid"],
    );



  }

  // sending data to the server

  Map<String,dynamic>toMap()
  {
    return
      {
        'email':email,
        'firstName':firstName,
        'secondName':secondName,
        'uid':uid,

      };
  }
}