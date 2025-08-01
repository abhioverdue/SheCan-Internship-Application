import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../models/leaderboard_model.dart';

class LeaderboardItem extends StatelessWidget {
  final LeaderboardModel user;
  final int animationDelay;

  const LeaderboardItem({
    Key? key,
    required this.user,
    this.animationDelay = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(milliseconds: animationDelay),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: user.isCurrentUser 
              ? AppColors.primary.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: user.isCurrentUser 
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Rank Badge
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: _getRankGradient(user.rank),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${user.rank}',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            // Profile Image
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(user.profileImage),
            ),
            SizedBox(width: 16),
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.name,
                          style: AppTextStyles.heading3.copyWith(fontSize: 16),
                        ),
                      ),
                      if (user.isCurrentUser)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'You',
                            style: AppTextStyles.caption.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '₹${user.donations.toStringAsFixed(0)}',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Trophy Icon for top 3
            if (user.rank <= 3)
              Icon(
                Icons.emoji_events,
                color: _getRankColor(user.rank),
                size: 28,
              ),
          ],
        ),
      ),
    );
  }

  Gradient _getRankGradient(int rank) {
    switch (rank) {
      case 1:
        return LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 2:
        return LinearGradient(
          colors: [Color(0xFFC0C0C0), Color(0xFF999999)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 3:
        return LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFFB8860B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return AppColors.primaryGradient;
    }
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Color(0xFFFFD700);
      case 2:
        return Color(0xFFC0C0C0);
      case 3:
        return Color(0xFFCD7F32);
      default:
        return AppColors.primary;
    }
  }
}