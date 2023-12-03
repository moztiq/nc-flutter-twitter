import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/password_screen.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/form_button.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  final Map<String, String> formData;

  const OtpScreen({super.key, required this.formData});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _num01Controller = TextEditingController();
  final TextEditingController _num02Controller = TextEditingController();
  final TextEditingController _num03Controller = TextEditingController();
  final TextEditingController _num04Controller = TextEditingController();
  final TextEditingController _num05Controller = TextEditingController();
  final TextEditingController _num06Controller = TextEditingController();
  final FocusNode _num01FocusNode = FocusNode();
  final FocusNode _num02FocusNode = FocusNode();
  final FocusNode _num03FocusNode = FocusNode();
  final FocusNode _num04FocusNode = FocusNode();
  final FocusNode _num05FocusNode = FocusNode();
  final FocusNode _num06FocusNode = FocusNode();

  bool _isAllEntered = false;

  void _onBackTap() {
    Navigator.of(context).pop();
  }

  void _removeFocus() {
    _num01FocusNode.unfocus();
    _num02FocusNode.unfocus();
    _num03FocusNode.unfocus();
    _num04FocusNode.unfocus();
    _num05FocusNode.unfocus();
    _num06FocusNode.unfocus();
  }

  @override
  void initState() {
    super.initState();
    _num01Controller.addListener(() {
      if (_num01Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(_num02FocusNode);
      }
    });
    _num02Controller.addListener(() {
      if (_num02Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(_num03FocusNode);
      }
    });
    _num03Controller.addListener(() {
      if (_num03Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(_num04FocusNode);
      }
    });
    _num04Controller.addListener(() {
      if (_num04Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(_num05FocusNode);
      }
    });
    _num05Controller.addListener(() {
      if (_num05Controller.text.length == 1) {
        FocusScope.of(context).requestFocus(_num06FocusNode);
      }
    });
    _num06Controller.addListener(() {
      if (_num06Controller.text.length == 1) {
        setState(() {
          _isAllEntered = true;
        });

        _num06FocusNode.unfocus();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _num01FocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _num01Controller.dispose();
    _num02Controller.dispose();
    _num03Controller.dispose();
    _num04Controller.dispose();
    _num05Controller.dispose();
    _num06Controller.dispose();
    _num01FocusNode.dispose();
    _num02FocusNode.dispose();
    _num03FocusNode.dispose();
    _num04FocusNode.dispose();
    _num05FocusNode.dispose();
    _num06FocusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (!_isAllEntered) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size32,
        ),
        leading: GestureDetector(
          onTap: _onBackTap,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: Sizes.size8,
              ),
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _removeFocus,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v28,
              const Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v14,
              Text(
                'Enter it below to verify',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Sizes.size18,
                ),
              ),
              Text(
                widget.formData['email']!,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Sizes.size18,
                ),
              ),
              Gaps.v36,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTextWidget(
                    controller: _num01Controller,
                    focusNode: _num01FocusNode,
                  ),
                  OtpTextWidget(
                    controller: _num02Controller,
                    focusNode: _num02FocusNode,
                  ),
                  OtpTextWidget(
                    controller: _num03Controller,
                    focusNode: _num03FocusNode,
                  ),
                  OtpTextWidget(
                    controller: _num04Controller,
                    focusNode: _num04FocusNode,
                  ),
                  OtpTextWidget(
                    controller: _num05Controller,
                    focusNode: _num05FocusNode,
                  ),
                  OtpTextWidget(
                    controller: _num06Controller,
                    focusNode: _num06FocusNode,
                  ),
                ],
              ),
              Container(
                height: Sizes.size96,
                alignment: Alignment.center,
                child: _isAllEntered
                    ? const FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.green,
                        size: Sizes.size28,
                      )
                    : null,
              ),
              Expanded(child: Container()),
              SizedBox(
                height: Sizes.size32,
                child: Text(
                  "Didn't receive email?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                child: FormButton(
                  text: 'Next',
                  bgColor: _isAllEntered ? Colors.black : Colors.grey.shade600,
                  onTap: _onSubmit,
                ),
              ),
              Gaps.v20,
            ],
          ),
        ),
      ),
    );
  }
}
