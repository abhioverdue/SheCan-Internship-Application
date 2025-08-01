import '../models/user_model.dart';
import '../models/leaderboard_model.dart';
import '../models/announcement_model.dart';

class MockData {
  static UserModel currentUser = UserModel(
    name: "Abhinaya K",
    email: "abhinayaak5@gmail.com",
    referralCode: "ABHINAYA2025",
    totalDonations: 12500.0,
    rank: 3,
    achievements: ["First Donation", "Team Player", "Rising Star"],
    profileImage: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400",
  );

  static List<LeaderboardModel> leaderboard = [
    LeaderboardModel(
      name: "Priya Sharma",
      donations: 25000.0,
      rank: 1,
      profileImage: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=400",
    ),
    LeaderboardModel(
      name: "Rahul Verma",
      donations: 18500.0,
      rank: 2,
      profileImage: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400",
    ),
    LeaderboardModel(
      name: "Abhinaya K",
      donations: 12500.0,
      rank: 3,
      profileImage: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400",
      isCurrentUser: true,
    ),
    LeaderboardModel(
      name: "Sneha Patel",
      donations: 9800.0,
      rank: 4,
      profileImage: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400",
    ),
    LeaderboardModel(
      name: "Arjun Singh",
      donations: 7200.0,
      rank: 5,
      profileImage: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400",
    ),
  ];

  static List<AnnouncementModel> announcements = [
    AnnouncementModel(
      title: "🎉 New Milestone Achieved!",
      content: "We've successfully raised ₹1,00,000 for our education initiative! Thank you to all our amazing interns.",
      date: DateTime.now().subtract(Duration(hours: 2)),
      category: "Achievement",
      isImportant: true,
    ),
    AnnouncementModel(
      title: "📅 Weekly Team Meeting",
      content: "Join us for our weekly sync-up meeting this Friday at 4 PM IST. We'll discuss progress and upcoming campaigns.",
      date: DateTime.now().subtract(Duration(days: 1)),
      category: "Meeting",
    ),
    AnnouncementModel(
      title: "🏆 Top Performer Rewards",
      content: "This month's top 3 performers will receive exclusive certificates and LinkedIn recommendations!",
      date: DateTime.now().subtract(Duration(days: 2)),
      category: "Rewards",
    ),
    AnnouncementModel(
      title: "🚀 New Feature Launch",
      content: "We've launched a new referral tracking system. Check your dashboard for updated analytics!",
      date: DateTime.now().subtract(Duration(days: 3)),
      category: "Feature",
    ),
  ];
}