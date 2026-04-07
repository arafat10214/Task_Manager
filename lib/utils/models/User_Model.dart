class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String photo;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.photo,
  });

  // Null-safe & nested JSON handle করা factory
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    // যদি API response এ user data nested থাকে 'data' key-তে
    final data = jsonData['data'] ?? jsonData;

    return UserModel(
      id: data['_id'] ?? '',          
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      mobile: data['mobile'] ?? '',
      photo: data['photo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "photo": photo,
    };
  }
}