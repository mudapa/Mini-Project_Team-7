import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/cart_model.dart';

class CartRepository {
  final String apiUrl = "https://fakestoreapi.com/carts";

  Future<List<CartModel>> fetchCart() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<CartModel> cart = (json.decode(response.body) as List)
          .map((data) => CartModel.fromJson(data))
          .toList();
      return cart;
    } else {
      throw Exception('Failed to load cart');
    }
  }
}
