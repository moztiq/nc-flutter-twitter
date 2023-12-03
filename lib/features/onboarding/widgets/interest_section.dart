import 'package:flutter/material.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';
import 'package:nc_flutter_twitter/features/onboarding/widgets/interest_item_button.dart';

class InterestSection extends StatefulWidget {
  final String title;
  final List interests;
  final Function onSelect;

  const InterestSection({
    super.key,
    required this.interests,
    required this.title,
    required this.onSelect,
  });

  @override
  State<InterestSection> createState() => _InterestSectionState();
}

class _InterestSectionState extends State<InterestSection> {
  final List selectedInterests = [];

  void _onSelect(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.removeWhere((element) => element == interest);
      } else {
        selectedInterests.add(interest);
      }
    });
    widget.onSelect(selectedInterests);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Gaps.v20,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Gaps.h16,
              SizedBox(
                width: MediaQuery.of(context).size.width * 1.6,
                child: Wrap(
                  direction: Axis.horizontal,
                  runSpacing: Sizes.size14,
                  spacing: Sizes.size14,
                  children: [
                    for (var interest in widget.interests)
                      GestureDetector(
                          onTap: () => _onSelect(interest),
                          child: InterestItemButton(
                            interest: interest,
                            isSelected: selectedInterests.contains(interest),
                          )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gaps.v48,
      ],
    );
  }
}
