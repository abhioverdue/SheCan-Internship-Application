import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'FundRaise Intern';
  static const String appVersion = '1.0.0';
  
  // UI Constants
  static const double borderRadius = 12.0;
  static const double cardBorderRadius = 16.0;
  static const double buttonBorderRadius = 12.0;
  static const double inputBorderRadius = 8.0;
  
  // Padding & Margins
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0);
  static const EdgeInsets inputPadding = EdgeInsets.all(16.0);
  
  // Spacing
  static const double spaceXS = 4.0;
  static const double spaceSM = 8.0;
  static const double spaceMD = 16.0;
  static const double spaceLG = 24.0;
  static const double spaceXL = 32.0;
  static const double spaceXXL = 48.0;
  
  // Icon Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXL = 48.0;
  
  // Animation Durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationMedium = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);
  
  // Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
  
  // Shadow
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];
  
  // Status Colors
  static const Map<String, Color> statusColors = {
    'active': Color(0xFF00C851),
    'pending': Color(0xFFFFBB33),
    'inactive': Color(0xFF8F9BB3),
    'completed': Color(0xFF6C63FF),
  };
  
  // Achievement Levels
  static const Map<String, dynamic> achievementLevels = {
    'bronze': {
      'threshold': 1000,
      'color': Color(0xFFCD7F32),
      'icon': '🥉',
      'title': 'Bronze Fundraiser'
    },
    'silver': {
      'threshold': 5000,
      'color': Color(0xFFC0C0C0),
      'icon': '🥈',
      'title': 'Silver Fundraiser'
    },
    'gold': {
      'threshold': 10000,
      'color': Color(0xFFFFD700),
      'icon': '🥇',
      'title': 'Gold Fundraiser'
    },
    'platinum': {
      'threshold': 25000,
      'color': Color(0xFFE5E4E2),
      'icon': '💎',
      'title': 'Platinum Fundraiser'
    },
    'diamond': {
      'threshold': 50000,
      'color': Color(0xFF185ADB),
      'icon': '💠',
      'title': 'Diamond Fundraiser'
    },
  };
  
  // Rewards Data
  static const List<Map<String, dynamic>> rewardsData = [
    {
      'title': 'Certificate',
      'description': 'Completion Certificate',
      'icon': '📜',
      'unlocked': true,
      'threshold': 0,
    },
    {
      'title': 'Recommendation',
      'description': 'Letter of Recommendation',
      'icon': '🏅',
      'unlocked': true,
      'threshold': 5000,
    },
    {
      'title': 'Appreciation',
      'description': 'Certificate of Appreciation',
      'icon': '🎖️',
      'unlocked': false,
      'threshold': 10000,
    },
    {
      'title': 'Top Performer',
      'description': 'Top Performer Badge',
      'icon': '⭐',
      'unlocked': false,
      'threshold': 25000,
    },
  ];
  
  // Animation Curves
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Curve bounceAnimationCurve = Curves.bounceOut;
  static const Curve elasticAnimationCurve = Curves.elasticOut;
  
  // Input Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  static const String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  
  // Networking (for future use)
  static const Duration networkTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;
  
  // Local Storage Keys
  static const String userDataKey = 'user_data';
  static const String settingsKey = 'app_settings';
  static const String onboardingKey = 'onboarding_completed';
  
  // Feature Flags
  static const bool enableAnimations = true;
  static const bool enableHapticFeedback = true;
  static const bool enableNotifications = true;
  
  // Bottom Navigation
  static const List<Map<String, dynamic>> bottomNavItems = [
    {
      'icon': Icons.dashboard_rounded,
      'label': 'Dashboard',
      'activeIcon': Icons.dashboard_rounded,
    },
    {
      'icon': Icons.leaderboard_outlined,
      'label': 'Leaderboard',
      'activeIcon': Icons.leaderboard_rounded,
    },
    {
      'icon': Icons.campaign_outlined,
      'label': 'Announcements',
      'activeIcon': Icons.campaign_rounded,
    },
  ];
}