
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget productCard(String name, String image, String price) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: const Offset(2, 2),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child:
            SizedBox(
              height: 400,
                width: 300,
                child: Image.asset(image, fit: BoxFit.cover, width: double.infinity)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            price,
            style: const TextStyle(color: Colors.blue, fontSize: 13),
          ),
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}