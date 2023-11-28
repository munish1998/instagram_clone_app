import 'package:demo_projectapp/Data/Response/Status.dart';

class ApiResponse<T>{
  Status?status;
  T?data;
  String?message;
  ApiResponse(this.status,this.data,this.message);

  ApiResponse.LOADING():status=Status.LOADING;

  ApiResponse.COMPLETED():status=Status.COMPLETED;

   ApiResponse.ERROR():status=Status.ERROR;

String toString(){
  return " status:$status \n message:$message \n Data:$data";
}

}