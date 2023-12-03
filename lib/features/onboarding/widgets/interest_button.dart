import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nc_flutter_twitter/constants/gaps.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';

class InterestButton extends StatelessWidget {
  final String interest;
  final bool isSelected;

  InterestButton({
    super.key,
    required this.interest,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.48,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(
          Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(
              0.1,
            ),
          ),
        ),
        duration: Duration(
          milliseconds: 200,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Colors.white,
                  size: Sizes.size18,
                ),
              ],
            ),
            Gaps.v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  interest,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
