class UserModel {
  final String name;
  final String email;
  final String referralCode;
  final double totalDonations;
  final int rank;
  final List<String> achievements;
  final String profileImage;

  UserModel({
    required this.name,
    required this.email,
    required this.referralCode,
    required this.totalDonations,
    required this.rank,
    required this.achievements,
    required this.profileImage,
  });
}