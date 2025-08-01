import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import '../../widgets/leaderboard_item.dart';
import '../../data/mock_data.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leaderboard = MockData.leaderboard;
    
    return SafeArea(
      child: Column(
        children: [
          // Header
          FadeInDown(
            duration: Duration(milliseconds: 800),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '🏆 Leaderboard',
                    style: AppTextStyles.heading1.copyWith(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Top performers this month',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // Top 3 Podium
          FadeInUp(
            delay: Duration(milliseconds: 400),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // 2nd Place
                  _buildPodiumItem(
                    leaderboard[1],
                    2,
                    140,
                    AppColors.secondaryGradient,
                  ),
                  // 1st Place
                  _buildPodiumItem(
                    leaderboard[0],
                    1,
                    180,
                    LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  // 3rd Place
                  _buildPodiumItem(
                    leaderboard[2],
                    3,
                    120,
                    LinearGradient(
                      colors: [Color(0xFFCD7F32), Color(0xFFB8860B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 30),
          
          // Full Leaderboard List
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Rankings',
                    style: AppTextStyles.heading3,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: leaderboard.length,
                      itemBuilder: (context, index) {
                        return LeaderboardItem(
                          user: leaderboard[index],
                          animationDelay: (index + 1) * 100,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(
    dynamic user,
    int rank,
    double height,
    Gradient gradient,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Profile
        CircleAvatar(
          radius: rank == 1 ? 35 : 30,
          backgroundImage: NetworkImage(user.profileImage),
        ),
        SizedBox(height: 8),
        Text(
          user.name.split(' ')[0],
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          '₹${user.donations.toStringAsFixed(0)}',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.success,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        // Podium
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: gradient.colors.first.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$rank',
                style: AppTextStyles.heading1.copyWith(
                  color: Colors.white,
                  fontSize: rank == 1 ? 36 : 28,
                ),
              ),
              if (rank == 1)
                Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 24,
                ),
            ],
          ),
        ),
      ],
    );
  }
}