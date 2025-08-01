import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../data/mock_data.dart';
import '../leaderboard/leaderboard_screen.dart';
import '../announcements/announcements_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildDashboard(),
          LeaderboardScreen(),
          AnnouncementsScreen(),
          _buildProfile(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  Widget _buildDashboard() {
    final user = MockData.currentUser;
    
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            FadeInDown(
              duration: Duration(milliseconds: 800),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(user.profileImage),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${user.name.split(' ')[0]}! 👋',
                          style: AppTextStyles.heading2,
                        ),
                        Text(
                          'Ready to make a difference today?',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Stats Cards
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.1,
              children: [
                StatCard(
                  title: 'Total Raised',
                  value: '₹${user.totalDonations.toStringAsFixed(0)}',
                  icon: Icons.trending_up,
                  gradient: AppColors.primaryGradient,
                  animationDelay: 200,
                ),
                StatCard(
                  title: 'Your Rank',
                  value: '#${user.rank}',
                  icon: Icons.emoji_events,
                  gradient: AppColors.secondaryGradient,
                  animationDelay: 400,
                ),
                StatCard(
                  title: 'Referrals',
                  value: '24',
                  icon: Icons.people,
                  gradient: AppColors.accentGradient,
                  animationDelay: 600,
                ),
                StatCard(
                  title: 'Achievements',
                  value: '${user.achievements.length}',
                  icon: Icons.stars,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFB347), Color(0xFFFFCC02)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  animationDelay: 800,
                ),
              ],
            ),
            
            SizedBox(height: 30),
            
            // Referral Code Section
            FadeInUp(
              delay: Duration(milliseconds: 1000),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.1),
                      AppColors.secondary.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Your Referral Code',
                          style: AppTextStyles.heading3.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              user.referralCode,
                              style: AppTextStyles.heading3.copyWith(
                                color: AppColors.primary,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Referral code copied!'),
                                  backgroundColor: AppColors.success,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.copy,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Share Referral Code',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sharing referral code...'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      },
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 30),
            
            // Achievements Section
            FadeInUp(
              delay: Duration(milliseconds: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Achievements',
                    style: AppTextStyles.heading3,
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: user.achievements.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140,
                          margin: EdgeInsets.only(right: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange.withOpacity(0.8),
                                Colors.deepOrange.withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.3),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.military_tech,
                                color: Colors.white,
                                size: 32,
                              ),
                              SizedBox(height: 8),
                              Text(
                                user.achievements[index],
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Quick Actions
            FadeInUp(
              delay: Duration(milliseconds: 1400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: AppTextStyles.heading3,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionCard(
                          'View Reports',
                          Icons.analytics,
                          AppColors.primaryGradient,
                          () {},
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildQuickActionCard(
                          'Help Center',
                          Icons.help_outline,
                          AppColors.secondaryGradient,
                          () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    String title,
    IconData icon,
    Gradient gradient,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    final user = MockData.currentUser;
    
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            FadeInDown(
              duration: Duration(milliseconds: 800),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.profileImage),
                  ),
                  SizedBox(height: 16),
                  Text(
                    user.name,
                    style: AppTextStyles.heading2,
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.email,
                    style: AppTextStyles.bodyMedium,
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Rank #${user.rank}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40),
            
            // Profile Stats
            FadeInUp(
              delay: Duration(milliseconds: 400),
              child: Row(
                children: [
                  Expanded(
                    child: _buildProfileStat(
                      'Total Raised',
                      '₹${user.totalDonations.toStringAsFixed(0)}',
                      Icons.trending_up,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: AppColors.divider,
                  ),
                  Expanded(
                    child: _buildProfileStat(
                      'Achievements',
                      '${user.achievements.length}',
                      Icons.emoji_events,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40),
            
            // Profile Menu
            FadeInUp(
              delay: Duration(milliseconds: 600),
              child: Column(
                children: [
                  _buildProfileMenuItem(
                    'Edit Profile',
                    Icons.person_outline,
                    () {},
                  ),
                  _buildProfileMenuItem(
                    'Settings',
                    Icons.settings_outlined,
                    () {},
                  ),
                  _buildProfileMenuItem(
                    'Help & Support',
                    Icons.help_outline,
                    () {},
                  ),
                  _buildProfileMenuItem(
                    'Privacy Policy',
                    Icons.privacy_tip_outlined,
                    () {},
                  ),
                  _buildProfileMenuItem(
                    'Logout',
                    Icons.logout,
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              },
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    },
                    isDestructive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 28,
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.heading3,
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: AppTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? AppColors.error : AppColors.textSecondary,
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyLarge.copyWith(
            color: isDestructive ? AppColors.error : AppColors.textPrimary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.textSecondary,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}