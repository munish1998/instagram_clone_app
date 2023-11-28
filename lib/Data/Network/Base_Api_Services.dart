abstract class BaseApiServices {

  Future<dynamic> getGetApiResponse(String url, {required Map<String, String> header , String? params});
 
  Future<dynamic> getPostApiResponse(String url , dynamic data,{Map<String,String>? header});

   Future<dynamic> getPatchApiResponse(String url , dynamic data,{Map<String,String>? header});

    Future<dynamic> getDeleteApiResponse(String url , dynamic data,{Map<String,String>? header});


}