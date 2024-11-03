class OrderStatus {
  final String stage;
  final String date;
  final bool completed;

  const OrderStatus({
    required this.stage,
    required this.date,
    required this.completed,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      stage: json['stage'],
      date: json['date'],
      completed: json['completed'],
    );
  }
}
