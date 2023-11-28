class AppException implements Exception{
  final message;
  final prefix;
  AppException([this.message,this.prefix]);
  @override
  String toString(){
    return '$message$prefix';
  }
}
class FetchDataException extends AppException{
  FetchDataException([String?message]):super(message,'error during communication');
}
class BedRequestException extends AppException{
  BedRequestException([String?message]):super(message,'invalid request');
}
class UnauthorisedException extends AppException{
   UnauthorisedException([String?message]):super(message,'unauthorised request');
}
class TimeOutException extends AppException{
  TimeOutException ([String?message]):super(message,'timeout exceed');
}

class Uint8ListConvertException extends AppException{
  Uint8ListConvertException([String?message]):super(message,'Error int8');
}

class AWSBucketException extends AppException{
  AWSBucketException([String?message]):super(message,'AWS Bucket error');
}
