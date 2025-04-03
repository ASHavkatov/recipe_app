class Instructions{
  final String title;

  final int order;

  Instructions({
    required this.title,
    required this.order
});
  factory Instructions.fromJson(Map<String,dynamic>json){
    return Instructions(
        title: json['text'],
        order: json['order']
    );

  }

  Map<String, dynamic>toJson(){
    return{
      "text": title,
      "order": order,
    };
  }
}