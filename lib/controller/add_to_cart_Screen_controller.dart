import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddToCartScreenController with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchCartItems() async {
    final snapshot = await _firestore.collection('cart').get();
    _cartItems = snapshot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }

  Future<void> addToCart(Map<String, dynamic> product) async {
    final docRef = _firestore.collection('cart').doc(product['id']);
    await docRef.set(product);
    _cartItems.add(product);
    notifyListeners();
  }

  Future<void> removeFromCart(String productId) async {
    await _firestore.collection('cart').doc(productId).delete();
    _cartItems.removeWhere((item) => item['id'] == productId);
    notifyListeners();
  }
}
