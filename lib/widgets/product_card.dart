import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductCard(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "\$$price",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Center(
                child: Image(
                  image: AssetImage(image),
                  height: 150,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
