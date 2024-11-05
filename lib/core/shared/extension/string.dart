extension ListStringExtension on List<String> {
  bool has({
    required String text,
  }) {
    if (isEmpty) return false;
    return any((string) => string.like(text: text));
  }
  
  List<String> get clone => [...this].toList();
}

extension NullableStringExtension on String? {
  bool like({
    required String? text,
  }) {
    if (this == null) return false;
    return this!.toLowerCase().trim() == text?.toLowerCase().trim();
  }

  bool has({
    required String? text,
  }) {
    if (this == null) return false;
    if (text == null) return false;
    return this!.toLowerCase().trim().contains(text.toLowerCase().trim());
  }

  String join({
    required String? text,
  }) {
    if (this != null && text != null) {
      return "$this$text";
    } else if (this != null) {
      return text!;
    } else {
      return this!;
    }
  }
}
