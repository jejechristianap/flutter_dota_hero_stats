import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';

class ErrorConnection extends StatelessWidget {
  const ErrorConnection({
    Key? key,
    required this.errorMessage,
    required this.onPressed,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 150,
        ),
        const Text(
          'Error',
          style: AppTextStyles.title,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            left: 24,
            right: 24,
          ),
          child: Text(
            errorMessage,
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: SizedBox(
            width: 200,
            height: 54,
            child: ElevatedButton(
              onPressed: onPressed, //controller.getHeroStats(),
              child: const Text('Retry'),
            ),
          ),
        )
      ],
    );
  }
}
