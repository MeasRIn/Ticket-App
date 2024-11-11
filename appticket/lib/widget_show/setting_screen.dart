import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false;
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Settings Section
          ListTile(
            title: const Text("Profile"),
            leading: const Icon(Icons.person),
            onTap: () {
              // Navigate to profile screen
            },
          ),
          const Divider(),

          // Notifications Settings Section
          ListTile(
            title: const Text("Notifications"),
            leading: const Icon(Icons.notifications),
            trailing: Switch(
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            onTap: () {
              // Navigate to notification settings if needed
            },
          ),
          const Divider(),

          // Dark Mode Settings Section
          ListTile(
            title: const Text("Dark Mode"),
            leading: const Icon(Icons.dark_mode),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
            onTap: () {
              // Trigger dark mode toggle if needed
            },
          ),
          const Divider(),

          // Language Settings Section
          ListTile(
            title: const Text("Language"),
            leading: const Icon(Icons.language),
            onTap: () {
              // Navigate to language settings
            },
          ),
          const Divider(),

          // About Section
          ListTile(
            title: const Text("About"),
            leading: const Icon(Icons.info),
            onTap: () {
              // Navigate to about screen
            },
          ),
          const Divider(),

          // Logout Section
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              // Handle logout functionality
            },
          ),
        ],
      ),
    );
  }
}
