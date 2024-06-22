import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/domains/entities/chat_gpt_feature.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/feature_service_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatGptFeatureItem extends StatelessWidget {
  const ChatGptFeatureItem({
    super.key,
    required this.feature,
  });

  final ChatGptFeature feature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          feature.icon,
          width: 20.w(),
          height: 20.w(),
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryFixed, BlendMode.srcIn),
        ),
        const SizedBox(
          height: 12,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: AutoSizeText(
            feature.title.tr(),
            style: AppStyles.getMediumStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 20.s()),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          children: feature.services
              .map<Widget>((service) => FeatureServiceBox(
                    serviceDetail: service.tr(),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
