import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/onboarding/interests_item_screen.dart';
import 'package:nc_flutter_twitter/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Music",
  "Movie",
  "Sports",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final selectedInterests = [];

  void _onSelect(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.removeWhere((element) => element == interest);
    } else {
      selectedInterests.add(interest);
    }
    setState(() {});
  }

  void _onSubmit() {
    if (selectedInterests.length < 3) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InterestsItemScreen(),
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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v28,
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v14,
              Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v48,
              Wrap(
                runSpacing: Sizes.size14,
                spacing: Sizes.size14,
                children: [
                  for (var interest in interests)
                    GestureDetector(
                      onTap: () => _onSelect(interest),
                      child: InterestButton(
                        interest: interest,
                        isSelected: selectedInterests.contains(interest),
                      ),
                    ),
                ],
              ),
              Gaps.v48,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedInterests.length} of 3 selected',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: Sizes.size16,
              ),
            ),
            GestureDetector(
              onTap: _onSubmit,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size8,
                  horizontal: Sizes.size24,
                ),
                decoration: BoxDecoration(
                  color: selectedInterests.length >= 3
                      ? Colors.black
                      : Colors.grey.shade500,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: Sizes.size1,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.size28,
                  ),
                ),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
