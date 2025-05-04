class UserModel {
  final String id;
  final String username;
  final String email;
  final bool isAdmin; // Default value for isAdmin

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isAdmin,
  });
  factory UserModel.fromFirebase(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] ?? 'Unknown', // Default to 'Unknown' if not present
      username:
          data['username'] ?? 'Unknown', // Default to 'Unknown' if not present
      email: data['email'] ?? 'Unknown', // Default to 'Unknown' if not present
      isAdmin: data['isAdmin'] ?? false, // Default to false if not present
    );
  }
}
