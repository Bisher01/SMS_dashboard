void main() {
  request('FMentorClassrooms', 'getMentorClassroomsResponse', 'getMentorClassrooms');
}

void request(String model, String response, String funcName) {
  print('''
   ApiResponse<$model>? _$response;
      ApiResponse<$model>? get $response => _$response;
      set $response(ApiResponse<$model>? value) {
    _$response = value;
    notifyListeners();
  }

  Future<ApiResponse<$model>> $funcName() async {
    ApiService apiService = ApiService(Dio());
    if (await checkInternet()) {
      $response = ApiResponse.loading('');
      try {
        $model ${model.toLowerCase()} = await apiService.$funcName();
        $response = ApiResponse.completed(${model.toLowerCase()});
      } catch (e) {
        if (e is DioError) {
          try {
            throwCustomException(e);
          } catch (forcedException) {
            return $response =
                ApiResponse.error(forcedException.toString());
          }
        }
        return $response = ApiResponse.error(e.toString());
      }
    } else {
      return $response = ApiResponse.error('No Internet Connection');
    }
    return $response!;
  }
  ''');
}
