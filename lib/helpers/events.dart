import '../app_model/file_upload_progress.dart';

class LogoutEvent {
  String message;

  LogoutEvent(this.message);
}

class FileUploadProgressEvent {
  FileUploadProgress uploadProgress;

  FileUploadProgressEvent(this.uploadProgress);
}
