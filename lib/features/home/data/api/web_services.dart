import 'package:dio/dio.dart';
import 'package:mk_stationery/features/home/data/models/product/category.dart';

import 'package:mk_stationery/features/home/data/models/product/product.dart';

import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("products")
  Future<List<Product>> getAllProducts();

  @GET("categories")
  Future<List<Category>> getCategories();

  @GET("categories/{id}")
  Future<Category> getCategoryById(@Path("id") int id);

  @GET("/categories/{id}/products")
  Future<List<Product>> getProductsByCategory(@Path("id") int categoryId);
  // @GET("users/{id}")
  // Future<UserModel> getUserById(@Path("id") int id);

  // @POST("users")
  // Future<UserModel> createUser(
  //   @Body() UserModel user,
  //   @Header("Authorization") String? token,
  // );

  // @DELETE('users/{id}')
  // Future<HttpResponse> deleteUser(
  //   @Path() String id,
  //   @Header("Authorization") String? token,
  // );
}
