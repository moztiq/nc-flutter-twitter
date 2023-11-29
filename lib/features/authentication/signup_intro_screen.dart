import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/authentication/create_account_screen.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/auth_button.dart';
import 'package:nc_flutter_twitter/features/authentication/widgets/form_button.dart';

class SignupIntroScreen extends StatelessWidget {
  const SignupIntroScreen({super.key});

  void _onCreateTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          children: [
            Gaps.v96,
            const Text(
              "See what's happening in the world right now.",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v96,
            AuthButton(
              text: 'Continue with Google',
              icon: SizedBox(
                width: Sizes.size24,
                height: Sizes.size24,
                child: SvgPicture.asset(
                  'assets/images/google-logo.svg',
                  semanticsLabel: 'Google Logo',
                ),
              ),
            ),
            Gaps.v10,
            const AuthButton(
              text: 'Continue with Apple',
              icon: FaIcon(
                FontAwesomeIcons.apple,
                size: Sizes.size28,
              ),
            ),
            Gaps.v20,
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: Sizes.size1,
                  color: Colors.grey.shade400,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size14),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            Gaps.v5,
            FormButton(
              text: 'Create account',
              bgColor: Colors.black,
              onTap: () => _onCreateTap(context),
            ),
            Gaps.v20,
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  const TextSpan(
                    text: ', ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  const TextSpan(
                    text: ', and ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  TextSpan(
                    text: 'Cookie Use',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size18,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v20,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Have an account already?',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h5,
              Text(
                'Log in',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
