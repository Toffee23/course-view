import 'package:course_view/router/route.dart';
import 'package:flutter/material.dart';

import '../manage_profile/page.dart';
import '../notifications/page.dart';
import '../payments/page.dart';

mixin ProfileController on Widget {
  void onAchievement(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onManageProfile(BuildContext context) {
    pushTo(context, const ManageProfilePage());
  }

  void onNotification(BuildContext context) {
    pushTo(context, const NotificationPage());
  }

  void onPayments(BuildContext context) {
    pushTo(context, const PaymentsPage());
  }

  void onPrivacyPolicy(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onSupport(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onToggleViewMode(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onLogout(BuildContext context) {
    // pushTo(context, const Placeholder());
  }
}
