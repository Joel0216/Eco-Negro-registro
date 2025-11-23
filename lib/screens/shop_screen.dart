import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/product_card.dart';
import '../widgets/payment_dialog.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Map<String, dynamic>> _products = [
    {
      'id': 'coins_100',
      'name': '100 Monedas',
      'description': 'Pack básico de monedas',
      'price': 0.99,
      'coins': 100,
      'icon': Icons.monetization_on,
    },
    {
      'id': 'coins_500',
      'name': '500 Monedas',
      'description': 'Pack popular de monedas',
      'price': 3.99,
      'coins': 500,
      'icon': Icons.monetization_on,
      'popular': true,
    },
    {
      'id': 'coins_1000',
      'name': '1000 Monedas',
      'description': 'Pack premium de monedas',
      'price': 6.99,
      'coins': 1000,
      'icon': Icons.monetization_on,
    },
    {
      'id': 'vip_month',
      'name': 'VIP Mensual',
      'description': 'Acceso VIP por 30 días',
      'price': 9.99,
      'icon': Icons.star,
    },
    {
      'id': 'power_pack',
      'name': 'Pack de Poder',
      'description': 'Mejoras especiales',
      'price': 4.99,
      'icon': Icons.flash_on,
    },
    {
      'id': 'skin_legendary',
      'name': 'Skin Legendaria',
      'description': 'Apariencia única',
      'price': 12.99,
      'icon': Icons.style,
    },
  ];

  void _showPaymentDialog(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) => PaymentDialog(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A0E27),
              const Color(0xFF1A1F3A),
              const Color(0xFF0A0E27),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 8),
                    FadeInLeft(
                      child: Text(
                        'TIENDA',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index),
                      child: ProductCard(
                        product: product,
                        onTap: () => _showPaymentDialog(product),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
