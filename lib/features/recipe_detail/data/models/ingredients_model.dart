class IngerdientsModel {
  final String amount, name;
  final int order;

  IngerdientsModel({required this.amount, required this.name, required this.order});

  factory IngerdientsModel.fromJson(Map<String, dynamic> json) {
    return IngerdientsModel(
      amount: json['amount'],
      name: json['name'],
      order: json['order'],
    );
  }
}
