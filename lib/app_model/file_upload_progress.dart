class FileUploadProgress {
  int sent;
  int total;
  String? tag;

  FileUploadProgress(this.sent, this.total, {this.tag});

  @override
  String toString() {
    return "Sent: $sent -- total: $total :: for $tag";
  }
}
