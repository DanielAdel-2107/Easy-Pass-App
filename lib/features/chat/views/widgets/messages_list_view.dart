import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/chat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key, required this.messages,
  });
  final List<ChatMessage> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return BubbleSpecialThree(
              isSender: messages[index].id ==
                  getIt<SupabaseClient>().auth.currentUser!.id,
              text: messages[index].message,
              color: messages[index].id ==
                      getIt<SupabaseClient>().auth.currentUser!.id
                  ? Colors.black87
                  : Colors.grey.shade300,
              tail: true,
              textStyle: messages[index].id ==
                      getIt<SupabaseClient>().auth.currentUser!.id
                  ? AppTextStyles.title18White
                  : AppTextStyles.title18Black54);
        },
      ),
    );
  }
}
