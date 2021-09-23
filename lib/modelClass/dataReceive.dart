
class Book {
  late final String description;
  late final String title;
  Book({
    required this.description,
    required this.title,
  });
 factory Book.fromJson(Map<String, dynamic> json){
   return Book(description: json['description'], title:  json['title']);
  }
}
class SendBook {
  late final String description;
  late final String title;
  SendBook({
    required this.description,
    required this.title,
  });
  factory SendBook.toJson(Map<String, dynamic> json){
    return SendBook(description: json['description'], title:  json['title']);
  }
}