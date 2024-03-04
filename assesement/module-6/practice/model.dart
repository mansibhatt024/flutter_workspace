class QnA {
  final String question;
  final String answer;

  QnA({required this.question, required this.answer});

  factory QnA.fromJson(Map<String, dynamic> json) {
    return QnA(
      question: json['question'],
      answer: json['answer'],
    );
  }
}
