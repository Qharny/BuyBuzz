import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPushNotificationsEnabled = false;
  bool isFaceIdEnabled = false;
  String? userEmail;
  String? userName;
  int storeCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUserPreferences();
    _loadUserData();
  }

  Future<void> _loadUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isPushNotificationsEnabled = prefs.getBool('pushNotifications') ?? false;
      isFaceIdEnabled = prefs.getBool('faceId') ?? false;
    });
  }

  // Save user preferences to local storage
  Future<void> _saveUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('pushNotifications', isPushNotificationsEnabled);
    await prefs.setBool('faceId', isFaceIdEnabled);
  }

  // Load user data from backend
  Future<void> _loadUserData() async {
    // TODO: Implement API call to fetch user data

    
    setState(() {
      // TODO: Replace with actual API data
      userEmail = 'info@buzzbuy.com';
      userName = 'BuzzBuy';
      storeCount = 2;
    });
  }

  // Handle logout
  Future<void> _handleLogout() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (shouldLogout == true) {
      // TODO: Implement API call to logout

      
      // Clear local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Navigate to login screen
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  // Handle edit profile
  Future<void> _handleEditProfile() async {
    // TODO: Navigate to edit profile screen and handle the result
    final result = await Navigator.pushNamed(context, '/edit-profile');
    if (result == true) {
      _loadUserData();
    }
  }

  // Handle PIN code
  Future<void> _handlePinCode() async {
    // TODO: Navigate to PIN code setup screen
  }

  // Handle store navigation
  void _navigateToStores() {
    // TODO: Navigate to stores screen
  }

  // Handle support
  void _navigateToSupport() {
    // TODO: Navigate to support screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Top section with time
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      TimeOfDay.now().format(context),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Profile section
                const SizedBox(height: 20),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF90EE90),
                      backgroundImage: null,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  userName ?? 'Loading...',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userEmail ?? 'Loading...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _handleEditProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Inventories',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // My stores button
                _buildListTile(
                  icon: Icons.store,
                  title: 'My stores',
                  onTap: _navigateToStores,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          storeCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),

                // Support button
                _buildListTile(
                  icon: Icons.support_agent,
                  title: 'Support',
                  onTap: _navigateToSupport,
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                ),

                // Preferences Section
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Push notifications switch
                _buildListTile(
                  icon: Icons.notifications_none,
                  title: 'Push notifications',
                  trailing: Switch(
                    value: isPushNotificationsEnabled,
                    onChanged: (value) async {
                      setState(() => isPushNotificationsEnabled = value);
                      await _saveUserPreferences();
                      // TODO: Update push notification settings on backend
                    },
                    activeColor: Colors.green,
                  ),
                ),

                // Face ID switch
                _buildListTile(
                  icon: Icons.face,
                  title: 'Face ID',
                  trailing: Switch(
                    value: isFaceIdEnabled,
                    onChanged: (value) async {
                      // TODO: Implement biometric check
                      setState(() => isFaceIdEnabled = value);
                      await _saveUserPreferences();
                    },
                    activeColor: Colors.green,
                  ),
                ),

                // PIN Code button
                _buildListTile(
                  icon: Icons.lock_outline,
                  title: 'PIN Code',
                  onTap: _handlePinCode,
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                ),

                // Logout button
                _buildListTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  titleColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: _handleLogout,
                ),

                // // Bottom Navigation
                // const SizedBox(height: 32),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     IconButton(
                //       icon: const Icon(Icons.home_outlined, size: 28),
                //       onPressed: () => Navigator.pushNamed(context, '/home'),
                //     ),
                //     IconButton(
                //       icon: const Icon(Icons.history, size: 28),
                //       onPressed: () => Navigator.pushNamed(context, '/history'),
                //     ),
                //     const Icon(Icons.person, size: 28, color: Colors.green),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color iconColor = Colors.black,
    Color titleColor = Colors.black,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: trailing,
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}