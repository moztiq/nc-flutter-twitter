import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';

class OtpTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const OtpTextWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size6),
      width: Sizes.size48,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        maxLength: 1,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        focusNode: focusNode,
        showCursor: false,
        style: const TextStyle(
          fontSize: Sizes.size32,
          fontWeight: FontWeight.w800,
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: Sizes.size3,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: Sizes.size3,
            ),
          ),
        ),
      ),
    );
  }
}
