import 'package:course_view/pages/notifications/page.dart';
import 'package:course_view/pages/payments/page.dart';
import 'package:course_view/router/route.dart';
import 'package:flutter/cupertino.dart';

mixin ProfileController on Widget {
  void onAchievement(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onManageProfile(BuildContext context) {
    pushTo(context, const Placeholder());
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

  void onSecurity(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onLanguage(BuildContext context) {
    pushTo(context, const Placeholder());
  }

  void onLogout(BuildContext context) {
    pushTo(context, const Placeholder());
  }
}
