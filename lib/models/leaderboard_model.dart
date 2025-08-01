class LeaderboardModel {
  final String name;
  final double donations;
  final int rank;
  final String profileImage;
  final bool isCurrentUser;

  LeaderboardModel({
    required this.name,
    required this.donations,
    required this.rank,
    required this.profileImage,
    this.isCurrentUser = false,
  });
}