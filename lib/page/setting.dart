import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/provider/preferences.dart';
import 'package:restaurant_app/provider/scheduling.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Consumer<PreferencesProvider>(
        builder: (_, preferences, __) {
          return Consumer<SchedulingProvider>(
            builder: (_, scheduled, __) {
              return SwitchListTile(
                title: const Text('Pengingat Harian'),
                value: preferences.isDailyReminderActive,
                onChanged: (value) async {
                  scheduled.scheduleReminder(value);
                  preferences.enableDailyReminder(value);
                },
              );
            },
          );
        },
      ),
    );
  }
}
