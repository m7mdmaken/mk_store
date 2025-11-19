abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? queryParams,
  });

  Future<bool> isDocumentExists({
    required String path,

    required String documentId,
  });
}
