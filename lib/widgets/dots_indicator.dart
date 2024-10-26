import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.only(left: 8.0),
          height: 8.0,
          width: currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? Color(0xFF1E4FF1) : Color(0xFFD3D3D3),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
