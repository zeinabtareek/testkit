import 'package:flutter/material.dart';
import 'package:newapexproject/controller/base_controller.dart';

class SettingController extends BaseController {
  final List<String> labels = [
    'Coupons ',
    'Offers ',
    'Notifications',
    'Contact Us',
    'About Us',
    'Languages',
  ];

  final List<IconData> icons=[
    Icons.account_balance_wallet_outlined ,
    Icons.local_offer_outlined,
    Icons.notification_add_outlined,
    Icons.headset_mic_outlined ,
    Icons.speaker_notes_outlined ,
    Icons.language
  ];

}
