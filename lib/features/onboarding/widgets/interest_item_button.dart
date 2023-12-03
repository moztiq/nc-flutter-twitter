import 'package:flutter/material.dart';
import 'package:nc_flutter_twitter/constants/sizes.dart';

class InterestItemButton extends StatelessWidget {
  final bool isSelected;
  final String interest;

  const InterestItemButton({
    super.key,
    required this.interest,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size24,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(
          Sizes.size32,
        ),
        border: Border.all(
          color: Colors.black.withOpacity(
            0.1,
          ),
        ),
      ),
      duration: const Duration(
        milliseconds: 200,
      ),
      child: Text(
        interest,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
