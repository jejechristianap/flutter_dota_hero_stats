class Resource<T> {
  Status status;
  T? data;
  String? error;

  Resource.loading() : status = Status.LOADING;

  Resource.completed(this.data) : status = Status.SUCCESS;

  Resource.error(this.error) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message :  \n Data : $data Error : $error";
  }
}

// ignore: constant_identifier_names
enum Status { LOADING, SUCCESS, ERROR }
