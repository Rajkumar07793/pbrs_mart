import 'package:dio/dio.dart';
import 'package:pbrs_mart/models/product_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pbrsmart.com/api/users/',
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<ProductCategoryModel> getProductByProductCategory(String token) async {
    final response = await _dio.get(
      'product-by-product-category',
      options: Options(headers: {'Authorization': token}),
    );
    return ProductCategoryModel.fromJson(response.data);
  }

  Future<ProductModel> getProductDetail(String token, String id) async {
    final response = await _dio.get(
      'product-details/$id',
      options: Options(headers: {'Authorization': token}),
    );
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel2> getProductBySubCategory(String token, String id) async {
    final response = await _dio.get(
      'product-by-sub-category/$id',
      options: Options(headers: {'Authorization': token}),
    );
    return ProductModel2.fromJson(response.data);
  }

  Future<MyCartModel> getMyCart(String token) async {
    final response = await _dio.get(
      'my-cart',
      options: Options(headers: {'Authorization': token}),
    );
    return MyCartModel.fromJson(response.data);
  }

  Future<String> getCartTotal(String token) async {
    final response = await _dio.get(
      'cart-total',
      options: Options(headers: {'Authorization': token}),
    );
    return response.data.toString();
  }

  Future<MyCartItemMode> getMyOrderItems(String token, String id) async {
    final response = await _dio.get(
      'my-order-items/$id',
      options: Options(headers: {'Authorization': token}),
    );
    return MyCartItemMode.fromJson(response.data);
  }

  Future<String> getOtpOfOrder(String token, String orderId) async {
    final response = await _dio.get(
      'get-otp-of-order/$orderId',
      options: Options(headers: {'Authorization': token}),
    );
    return response.data.toString();
  }

  Future<ProductModel2> getProductsByBrand(String token, String id) async {
    final response = await _dio.get(
      'products-by-brand/$id',
      options: Options(headers: {'Authorization': token}),
    );
    return ProductModel2.fromJson(response.data);
  }

  Future<LanguageModel> getLanguages(String token) async {
    final response = await _dio.get(
      'language',
      options: Options(headers: {'Authorization': token}),
    );
    return LanguageModel.fromJson(response.data);
  }

  Future<PostModel> getPosts(String token, String page) async {
    final response = await _dio.get(
      'post-list',
      queryParameters: {'page': page},
      options: Options(headers: {'Authorization': token}),
    );
    return PostModel.fromJson(response.data);
  }

  Future<PostModel> getNews(String token, String page) async {
    final response = await _dio.get(
      'news-list',
      queryParameters: {'page': page},
      options: Options(headers: {'Authorization': token}),
    );
    return PostModel.fromJson(response.data);
  }

  Future<CommentModel> getComments(
    String token,
    String postId,
    String page,
  ) async {
    final response = await _dio.get(
      'get-comments/$postId',
      queryParameters: {'page': page},
      options: Options(headers: {'Authorization': token}),
    );
    return CommentModel.fromJson(response.data);
  }
}
