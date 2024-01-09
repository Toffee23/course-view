import 'package:course_view/core/constants/images.dart';
import 'package:course_view/widgets/list_tile.dart';
import 'package:flutter/material.dart';

import 'controller.dart';

class ProfilePage extends StatelessWidget with ProfileController {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox.square(
                          dimension: 110.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
                      const SizedBox(width: 8.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Akinyemi'),
                          Text('Simisola'),
                          Text('@simibullet'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      const Expanded(child: Divider()),
                      const SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text('Quick Review'),
                      ),
                      const SizedBox(width: 8.0),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.pages_outlined),
                                Text('0'),
                              ],
                            ),
                            Text('Course Completed')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.pages_outlined),
                                Text('0'),
                              ],
                            ),
                            Text('Course Completed')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            SettingsListTile(
              onTap: () => onAchievement(context),
              leading: AssetImages.achievement,
              title: 'Achievements',
              subtitle: 'Tournaments wins, certificates etc',
            ),
            SettingsListTile(
              onTap: () => onManageProfile(context),
              leading: AssetImages.profile,
              title: 'Manage Profile',
              subtitle: 'Change your personal details',
            ),
            SettingsListTile(
              onTap: () => onNotification(context),
              leading: AssetImages.notification2,
              title: 'Notification',
              subtitle: 'See latest notifications',
            ),
            SettingsListTile(
              onTap: () => onPayments(context),
              leading: AssetImages.payment,
              title: 'Payments',
              subtitle: 'An highly secure with payments',
            ),
            SettingsListTile(
              onTap: () => onPrivacyPolicy(context),
              leading: AssetImages.policy,
              title: 'Privacy Policy',
              subtitle: 'Read our policy regarding the platform',
            ),
            SettingsListTile(
              onTap: () => onSupport(context),
              leading: AssetImages.support,
              title: 'Support',
              subtitle: 'Get all available help from us',
            ),
            SettingsListTile(
              onTap: () => onToggleViewMode(context),
              leading: AssetImages.darkMode,
              title: 'Dark mode view',
              subtitle: 'Switch display view',
            ),
            SettingsListTile(
              onTap: () => onLogout(context),
              leading: AssetImages.logout,
              title: 'Logout',
              subtitle: 'Exits. We would want to see you again',
              textColor: const Color(0xFFDA2949),
              hideTrailing: true,
            ),
            const SizedBox(height: 30.0),
            Text('Version'),
            Text(
              '1.0.0.102',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
