
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:order_app/models/Product.dart';
import '../models/auth_token.dart';

import 'firebase_service.dart';

class ProductsService extends FirebaseService {
  ProductsService([AuthToken? authToken]) : super(authToken);



  Future<bool> updateProduct(Product product) async {
    try {
      final url =
          Uri.parse('$databaseUrl/products/${product.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(product.toJson()),
      );
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      // print(error);
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/products/$id.json?auth=$token');
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<List<Product>> fetchProducts([bool filterByUser = false]) async {
    final List<Product> products = [];

    try {
      // final filters =
      // filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      print(1234567890);
      print(token);
      final productsUrl = Uri.parse('$databaseUrl/products.json?auth=$token');
      final response = await http.get(productsUrl);
      final productsMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        print(" ${productsMap['error']}");
        return products;
      }

      // final userFavoriteUrl =
      //     Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      // final userFavoritesResponse = await http.get(userFavoriteUrl);
      // final userFavoritesMap = json.decode(userFavoritesResponse.body);

      productsMap.forEach((productId, product) {
        // final isFavorite = (userFavoritesMap == null)
        //     ? false
        //     : (userFavoritesMap[productId] ?? false);
        products.add(Product.fromJson({
          'id': productId,
          ...product,
        })
            // .copyWith(isFavorite: isFavorite),
            );
      });
      return products;
    } catch (error) {
      print("${error}");
      return products;
    }
  }

  Future<Product?> addProduct(Product product) async {
    try {
      print(userId);
      final url = Uri.parse('$databaseUrl/products.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(
          product.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );
      print(response.statusCode);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      print(response.body);
      return product.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }
}
