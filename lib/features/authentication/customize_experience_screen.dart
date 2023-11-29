import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/signup_complete_screen.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/form_button.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  final Map<String, String> formData;

  const CustomizeExperienceScreen({super.key, required this.formData});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isAgreed = false;

  void _onSubmit() {
    if (!_isAgreed) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupCompleteScreen(formData: widget.formData),
      ),
    );
  }

  void _onBackTap() {
    Navigator.of(context).pop();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v28,
            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v28,
            const Text(
              'Track where you see Twitter content across the web',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Text(
                      'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                      style: TextStyle(
                        fontSize: Sizes.size18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Switch(
                  value: _isAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _isAgreed = !_isAgreed;
                    });
                  },
                  activeTrackColor: Colors.green,
                )
              ],
            ),
            Gaps.v24,
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  const TextSpan(
                    text: ', ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  const TextSpan(
                    text: ', and ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  TextSpan(
                    text: 'Cookie Use',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  const TextSpan(
                    text:
                        '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  TextSpan(
                    text: 'Learn more',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: FormButton(
          text: 'Next',
          bgColor: _isAgreed ? Colors.black : Colors.grey.shade600,
          onTap: _onSubmit,
        ),
      ),
    );
  }
}
