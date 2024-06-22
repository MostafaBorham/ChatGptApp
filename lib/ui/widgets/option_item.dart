import 'package:chat_gpt_app/ui/widgets/medium_labeled_icon.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key, required this.optionName, required this.optionIcon, this.optionColor, this.optionOnTap,
  });
  final String optionName;
  final String optionIcon;
  final Color? optionColor;
  final GestureTapCallback? optionOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: optionOnTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: MediumLabeledIcon(icon: optionIcon,label: optionName,color: optionColor,),
        ));
  }
}