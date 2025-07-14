class Offering {
  final int userId;
  final String book;
  final String bookState;

  Offering({required this.userId, required this.book, required this.bookState});

  factory Offering.fromJson(Map<String, dynamic> json) => Offering(
    userId: json['userId'],
    book: json['book'],
    bookState: json['book_state'],
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'book': book,
    'book_state': bookState,
  };
}
