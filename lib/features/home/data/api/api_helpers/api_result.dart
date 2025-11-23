import 'api_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success<T>;

  factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}

class Success<T> implements ApiResult<T> {
  final T data;
  Success(this.data);
}

class Failure<T> implements ApiResult<T> {
  final ApiErrorModel apiErrorModel;
  Failure(this.apiErrorModel);
}
