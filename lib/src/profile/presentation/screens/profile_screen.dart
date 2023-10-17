import 'package:edu_app/core/common/widgets/background_gradient.dart';
import 'package:edu_app/core/res/media_res.dart';
import 'package:edu_app/src/profile/presentation/refactors/profile_body.dart';
import 'package:edu_app/src/profile/presentation/refactors/profile_header.dart';
import 'package:edu_app/src/profile/presentation/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScren extends StatelessWidget {
  const ProfileScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(),
      body: GradientBackground(
        image: MediaRes.profileGradientBackground,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            ProfileHeader(),
            SizedBox(height: 20),
            ProfileBody(),
          ],
        ),
      ),
    );
  }
}
