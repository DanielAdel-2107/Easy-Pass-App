import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/chat/view_models/cubit/chat_cubit.dart';
import 'package:easy_pass/features/chat/views/widgets/messages_list_view.dart';
import 'package:easy_pass/features/chat/views/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ChatScrrenBody extends StatelessWidget {
  const ChatScrrenBody({
    super.key,
    required this.arguments,
  });

  final String arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(id: arguments),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          if (state is ChatLoading) {
            Center(
              child: SizedBox(
                width: context.screenWidth * 0.5,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: const [Colors.white],
                  strokeWidth: 2,
                ),
              ),
            );
          }
          if (state is ChatLoaded) {
            return Column(
              children: [
                MessagesListView(
                  messages: state.messages,
                ),
                SendMessage(
                  onPressed: () {
                    cubit.addMessage(text: cubit.messageController.text);
                  },
                  controller: cubit.messageController,
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

