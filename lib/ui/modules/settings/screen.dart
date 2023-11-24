import 'dart:io';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_mvvm_design/ui/widgets/app_button.dart';
import '../../../core/enums/button_variant.dart';
import '../../../data/helper/db_conection.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static final DBConnection _databaseService = DBConnection();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButton(
              variant: ButtonVariantEnum.contained,
              text: 'Copy DB',
              onPress: () async {
                final dbFolder = await getDatabasesPath();
                File source1 = File('$dbFolder/assets/poets2.db');

                Directory copyTo =
                Directory("storage/emulated/0/Sqlite Backup");
                if ((await copyTo.exists())) {
                  // print("Path exist");
                  var status = await Permission.storage.status;
                  if (!status.isGranted) {
                    await Permission.storage.request();
                  }
                } else {
                  print("not exist");
                  if (await Permission.storage.request().isGranted) {
                    // Either the permission was already granted before or the user just granted it.
                    await copyTo.create();
                  } else {
                    print('Please give permission');
                  }
                }

                String newPath = "${copyTo.path}/doggie_database.db";
                await source1.copy(newPath);
              }
            ),
            const SizedBox(height: 10),
            AppButton(
              variant: ButtonVariantEnum.contained,
              onPress: () async {
                var databasesPath = await getDatabasesPath();
                var dbPath = join(databasesPath, 'doggie_database.db');
                await deleteDatabase(dbPath);
              },
              text: 'Delete DB',
            ),
            const SizedBox(height: 10),
            AppButton(
              variant: ButtonVariantEnum.contained,
              onPress: () async {
                var databasesPath = await getDatabasesPath();
                var dbPath = join(databasesPath, 'doggie_database.db');

                FilePickerResult? result =
                await FilePicker.platform.pickFiles();

                if (result != null) {
                  File source = File(result.files.single.path!);
                  await source.copy(dbPath);
                } else {
                  // User canceled the picker

                }
              },
              text: 'Restore DB',
            ),
          ],
        ),
      ),
    );
  }
}
