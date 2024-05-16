import 'dart:async';
import 'package:flutter/services.dart';

class Xtremepush {
  static const platform = const MethodChannel('ie.imobile.xtremepush/flutter');

  static void hitEvent(String xpEvent) async {
    final int result = await platform
        .invokeMethod('hitEvent', <String, dynamic>{'xpEvent': xpEvent});
  }

  static void hitEventWithValue(String xpEventw, xpEventValue) async {
    final int result = await platform.invokeMethod('hitEventWithValue',
        <String, dynamic>{'xpEventw': xpEventw, 'xpEventValue': xpEventValue});
  }

  static void hitTag(String xpTag) async {
    final int result = await platform
        .invokeMethod('hitTag', <String, dynamic>{'xpTag': xpTag});
  }

  static void hitTagWithValue(String xpTag, xpValue) async {
    final int result = await platform.invokeMethod('hitTagWithValue',
        <String, dynamic>{'xpTag': xpTag, 'xpTagValue': xpValue});
  }

  static void setUser(String user_id) async {
    final int result = await platform
        .invokeMethod('setUser', <String, dynamic>{'xp_user_id': user_id});
  }

  static void setTempUser(String temp_user_id) async {
    final int result = await platform.invokeMethod(
        'setTempUser', <String, dynamic>{'xp_temp_user_id': temp_user_id});
  }

  static void openInbox() async {
    final int result = await platform.invokeMethod('openInbox');
  }

  static void setSubscription(bool sub_status) async {
    final int result = await platform.invokeMethod(
        'setSubscription', <String, dynamic>{'subscription_flag': sub_status});
  }

  // Request Notification Prompt
  static void requestNotificationPermissions() async {
    final int result =
        await platform.invokeMethod('requestNotificationPermissions');
  }

  static void setEmail(String email) async {
    final int result = await platform
        .invokeMethod('setEmail', <String, dynamic>{'email': email});
  }

  // Get Inbox List
  static void getInboxList(int offset, int limit) async {
    try {
      final int result = await platform
          .invokeMethod('getInboxList', {'offset': offset, 'limit': limit});
    } catch (e) {
      print(e);
    }
  }
}
