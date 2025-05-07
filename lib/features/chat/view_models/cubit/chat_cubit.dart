import 'dart:async';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:easy_pass/features/chat/models/message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.id}) : super(ChatLoading()) {
    _loadMessages();
  }

  final String id;
  StreamSubscription? _streamSubscription;
  final supabase = getIt<SupabaseClient>();
  final messageController = TextEditingController();

  void _loadMessages() {
    _streamSubscription = streamDataWithSpecificId(
      tableName: "chats",
      id: id,
      primaryKey: 'id',
    ).listen((data) {
      if (data.isNotEmpty) {
        final dynamic messagesData = data[0]['messages'];
        final List<dynamic> messagesJson =
            (messagesData is List) ? messagesData : [];
        final List<ChatMessage> messages =
            messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
        emit(ChatLoaded(messages: messages));
      } else {
        emit(ChatLoaded(messages: []));
      }
    });
  }

  Future<void> addMessage({required String text}) async {
    if (messageController.text.isNotEmpty) {
      try {
        final chatData = await supabase
            .from("chats")
            .select("messages")
            .eq("id", id)
            .single();
        final dynamic messagesData = chatData['messages'];
        final List<dynamic> messagesJson =
            (messagesData is List) ? messagesData : [];
        final List<ChatMessage> messages =
            messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
        final newMessage =
            ChatMessage(message: text, id: supabase.auth.currentUser!.id);
        messages.add(newMessage);
        await supabase.from("chats").update({
          "messages": messages.map((m) => m.toJson()).toList(),
        }).eq("id", id);
        messageController.clear();
        emit(ChatLoaded(messages: messages));
      } catch (e) {
        emit(ChatFailed(error: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
