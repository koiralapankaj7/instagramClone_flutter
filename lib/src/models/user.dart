class User {
  //
  int id;
  String userId;
  String userName;
  String userProfileImage;

  User({this.id, this.userId, this.userName, this.userProfileImage});

  int get getId => this.id;
  String get getUserId => this.userId;
  String get getUserName => this.userName;
  String get getUserProfileImage => this.userProfileImage;

  set setUserId(String userId) {
    this.userId = userId;
  }

  set setUserName(String userName) {
    this.userName = userName;
  }

  set setUserProfileImage(String userProfileImage) {
    this.userProfileImage = userProfileImage;
  }
}
