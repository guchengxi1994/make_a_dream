class SimpleChatState {
  final String dialog;
  final bool conversationDone;

  SimpleChatState({
    required this.dialog,
    required this.conversationDone,
  });

  SimpleChatState copyWith({bool? conversationDone, String? dialog}) {
    return SimpleChatState(
      conversationDone: conversationDone ?? this.conversationDone,
      dialog: dialog ?? this.dialog,
    );
  }
}
