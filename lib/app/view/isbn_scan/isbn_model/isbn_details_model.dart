class BookVerification {
  final String message;
  final bool verified;
  final OriginalData? originalData;

  BookVerification({
    required this.message,
    required this.verified,
    this.originalData,
  });

  factory BookVerification.fromJson(Map<String, dynamic> json) {
    return BookVerification(
      message: json['message'] ?? '',
      verified: json['success'] ?? false,
      originalData: json['data'] != null ? OriginalData.fromJson(json['data']) : null,
    );
  }
}

class OriginalData {
  final int id;
  final String isbn;
  final String publisherName;
  final String classNumber;
  final String subject;
  final int medium;

  OriginalData({
    required this.id,
    required this.isbn,
    required this.publisherName,
    required this.classNumber,
    required this.subject,
    required this.medium,
  });

  factory OriginalData.fromJson(Map<String, dynamic>? json) {
    return OriginalData(
      id: json?['id'] ?? 0,
      isbn: json?['isbn_code'] ?? '',
      publisherName: json?['publisher_name'] ?? '',
      classNumber: json?['class_level'] ?? "",
      subject: json?['subject_name'] ?? '',
      medium: json?['medium'] ?? 0,
    );
  }
}
