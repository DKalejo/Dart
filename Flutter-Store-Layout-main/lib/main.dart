import 'package:flutter/material.dart';
import 'package:flutter_layout_store/Menu.dart';
import 'package:flutter_layout_store/Budget.dart';
import 'package:flutter_layout_store/Income.dart';
import 'package:flutter_layout_store/Spending.dart';
import 'package:flutter_layout_store/CategoriesAndTransactions.dart';
import 'package:flutter_layout_store/Products.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFF3F6FF),
        appBar: const Menu(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // main body
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xFF3561FE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Column(children: const [Budget(), Income(), Spending()]),
              ),
              const CategoriesAndTransactions(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF0047ff),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Products(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
