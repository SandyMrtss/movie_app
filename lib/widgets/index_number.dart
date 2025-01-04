import 'package:flutter/material.dart';

class IndexNumber extends StatelessWidget {
  const IndexNumber({
    super.key,
    required this.number,
  });
  final int number;
  @override
  Widget build(BuildContext context) {
    return Text(
      (number).toString(),
      style: const TextStyle(
        fontSize: 120,
        fontWeight: FontWeight.w600,
        shadows: [
          Shadow(
            offset: Offset(-1.5, -1.5),
            color: Color(0xFFE8E44E),
          ),
          Shadow(
            offset: Offset(1.5, -1.5),
            color: Color(0xFFE8E44E),
          ),
          Shadow(
            offset: Offset(1.5, 1.5),
            color: Color(0xFFE8E44E),
          ),
          Shadow(
            offset: Offset(-1.5, 1.5),
            color: Color(0xFFE8E44E),
          ),
        ],
        color: Color(0xFF574D3F),
      ),
    );
  }
}