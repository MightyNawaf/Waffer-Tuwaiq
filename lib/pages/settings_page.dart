import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waffer/components/scaffold.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/constants/spacings.dart';
import 'package:waffer/utils/extensions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return WScaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: WColors.blue,
        elevation: 0,
      ),
      child: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('View and change your avatar here!'),
            kVSpace24,
            WAvatar(file: file),
            kVSpace24,
            TextButton(
              onPressed: () async {
                final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image?.path != '') {
                  file = File(image?.path ?? '');
                  setState(() {});
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('user_avatar', image?.path ?? '');
                }
              },
              child: const Text('Upload image'),
            ),
          ],
        ),
      ),
    );
  }
}

class WAvatar extends StatelessWidget {
  const WAvatar({
    super.key,
    this.file,
    this.size = 75,
  });

  final File? file;
  final double size;

  @override
  Widget build(BuildContext context) {
    const first =
        '/Users/mightynawaf/Library/Developer/CoreSimulator/Devices/48EB7E0A-79A3-4085-A1DA-FDC43022C6C7/data/Containers/Data/Application/7BEA3E0C-4965-4E31-80A4-3E75BAC01DB9/tmp/image_picker_6C22103C-2598-43E8-956B-6DAF15FDCA7E-97561-0000E5D94A5D2B25.jpg';

    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (first != snapshot.data?.getString('user_avatar')) {
              log('it is the same');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data != null) {
                return Image.file(
                  File(snapshot.data?.getString('user_avatar') ?? ''),
                  fit: BoxFit.cover,
                );
              } else {
                return const Center(child: Text('Error'));
              }
            }
          },
        ),
      ),
    );
  }
}

class IfTrue extends StatelessWidget {
  const IfTrue({
    super.key,
    required this.condition,
    required this.child,
    required this.orChild,
  });

  final bool condition;
  final Widget child;
  final Widget orChild;

  @override
  Widget build(BuildContext context) {
    if (condition) return child;
    return orChild;
  }
}
