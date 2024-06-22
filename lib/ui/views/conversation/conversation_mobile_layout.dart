import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_gpt_app/controllers/conversation/conversation_bloc.dart';
import 'package:chat_gpt_app/core/localization/constants.dart';
import 'package:chat_gpt_app/core/localization/strings.dart';
import 'package:chat_gpt_app/ui/resources/app_images.dart';
import 'package:chat_gpt_app/ui/resources/app_responsive.dart';
import 'package:chat_gpt_app/ui/resources/app_styles.dart';
import 'package:chat_gpt_app/ui/widgets/chat_answer_box.dart';
import 'package:chat_gpt_app/ui/widgets/chat_box_list.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_item.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_feature_page_view.dart';
import 'package:chat_gpt_app/ui/widgets/chat_gpt_logo.dart';
import 'package:chat_gpt_app/ui/widgets/chat_question_box.dart';
import 'package:chat_gpt_app/ui/widgets/chat_text_field.dart';
import 'package:chat_gpt_app/ui/widgets/conversation_header.dart';
import 'package:chat_gpt_app/ui/widgets/custom_full_wide_thin_divider.dart';
import 'package:chat_gpt_app/ui/widgets/medium_labeled_icon.dart';
import 'package:chat_gpt_app/ui/widgets/semi_bold_labeled_icon.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_footer_section.dart';
import 'package:chat_gpt_app/ui/widgets/welcome_header_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ConversationMobileLayout extends StatefulWidget {
  const ConversationMobileLayout({super.key});

  @override
  State<ConversationMobileLayout> createState() => _ConversationMobileLayoutState();
}

class _ConversationMobileLayoutState extends State<ConversationMobileLayout> {
  final _chatInputController = TextEditingController();

  late final ScrollController _scrollController;


  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      builder: (context, state) {
        print('Here Builder');
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConversationHeader(),
            ),
            CustomFullWideThinDivider(),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: ConversationBloc.getInstance(context).chat.chats.isEmpty
                  ? AutoSizeText(
                      AppStrings.askAnythingGetYourAnswer,
                      style: AppStyles.getSemiBoldStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    )
                  : ChatBoxList(scrollController: _scrollController,),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ChatTextField(
                chatInputFieldController: _chatInputController,
                onTap: () {
                  if (_chatInputController.text.isNotEmpty) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ConversationBloc.getInstance(context).add(AskChatGptEvent(
                        question: _chatInputController.text.toString()));
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
