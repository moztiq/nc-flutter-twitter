import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/otp_screen.dart';
import 'package:nc_flutter_twitter/features/authentication/signup_intro_screen.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/form_button.dart';

class SignupCompleteScreen extends StatefulWidget {
  final Map<String, String> formData;

  const SignupCompleteScreen({super.key, required this.formData});

  @override
  State<SignupCompleteScreen> createState() => _SignupCompleteScreenState();
}

class _SignupCompleteScreenState extends State<SignupCompleteScreen> {
  void _onSubmit() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          formData: widget.formData,
        ),
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
              "Create your account",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v28,
            TextFormField(
              initialValue: widget.formData['name'],
              enabled: false,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Theme.of(context).primaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Name',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                suffixIcon: const Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green,
                    size: Sizes.size28,
                  ),
                ),
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              initialValue: widget.formData['email'],
              enabled: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Theme.of(context).primaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                suffixIcon: const Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green,
                    size: Sizes.size28,
                  ),
                ),
              ),
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              initialValue: widget.formData['date'],
              enabled: false,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Theme.of(context).primaryColor,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Date of birth',
                hintText: 'Date of birth',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                suffixIcon: const Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.green,
                    size: Sizes.size28,
                  ),
                ),
              ),
              validator: (value) {
                return null;
              },
            ),
            Gaps.v10,
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'By signing up, you agree to the ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      const TextSpan(
                        text: ' and ',
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
                        text: ', including ',
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
                            '. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ',
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
                      const TextSpan(
                        text:
                            '. Others will be able to find you by email or phone number, when provided, unless you choose otherwise ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      TextSpan(
                        text: 'here',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: FormButton(
          text: 'Sign up',
          bgColor: Theme.of(context).primaryColor,
          onTap: _onSubmit,
        ),
      ),
    );
  }
}
