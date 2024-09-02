class Users {
  final String uid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String role;
  final String createAt;

  Users({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    this.role = "guest",
    required this.createAt,
  });

  factory Users.fromDoc(Map<String, dynamic> user) {
    return Users(
        uid: user['uid'],
        email: user['email'],
        fullName: user['fullName'],
        phoneNumber: user['phoneNumber'],
        createAt: user['createAt']);
  }

  Map<String, dynamic> toDoc() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'createAt': createAt
    };
  }
}
