import 'package:edu_app/core/extensions/context_extension.dart';
import 'package:edu_app/core/res/colours.dart';
import 'package:edu_app/core/res/fonts.dart';
import 'package:edu_app/src/on_boarding/domain/page_conent.dart';
import 'package:edu_app/src/on_boarding/presentation/cubit/on_board_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pageContent.image, height: context.height * .4),
        SizedBox(height: context.height * .03),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: Fonts.aeonix,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.height * .02),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(height: context.height * .05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 17,
                  ),
                  backgroundColor: Colours.primaryColour,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  context.read<OnBoardCubit>().cacheFirstTimer();
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: Fonts.aeonix,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
