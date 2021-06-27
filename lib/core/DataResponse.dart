class DataResponse<T> {
  Status status = Status.Init;
  T? res; //dynamic
  String? loadingMessage;
  String? error;

  DataResponse(
      {this.status = Status.Init, this.res, this.loadingMessage, this.error});

  static DataResponse init() => DataResponse(status: Status.Init);

  static DataResponse onLoading(String? message) =>
      DataResponse(status: Status.Loading, loadingMessage: message);

  static DataResponse onError(String message) =>
      DataResponse(status: Status.Error, error: message);

  static DataResponse onSuccess<T>(T data) =>
      DataResponse(status: Status.Success, res: data);

  @override
  String toString() {
    return "Status : $status \n Message : $loadingMessage \n Data : $res";
  }
}

enum Status {
  Init,
  Loading,
  Success,
  Error,
}
