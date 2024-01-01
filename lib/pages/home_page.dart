import 'package:flutter/material.dart';

import 'package:shop_app_flutter/widgets/product_list.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
  ];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
            label: "",
          )
        ],
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        currentIndex: selectedPage,
      ),
    );
  }
}
