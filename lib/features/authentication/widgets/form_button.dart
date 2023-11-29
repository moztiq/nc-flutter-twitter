import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final GestureTapCallback onTap;

  const FormButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size28,
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
