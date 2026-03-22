import 'package:flutter/material.dart';

class _OnboardPage {
  final String ImagePath;
  final String title;
  final String description;
  final Color themeColor;

  const _OnboardPage(
      {required this.ImagePath,
      required this.title,
      required this.description,
      required this.themeColor});
}

const pages = [
  _OnboardPage(
      ImagePath: 'assets/images/home1.png',
      title: 'Quality',
      description:
          'Sell your farm fresh products directly to consumers,cutting out the middleman and reducing emissions of the global supply chain.',
      themeColor: Color(0xFF4CAF50)),
  _OnboardPage(
      ImagePath: 'assets/images/home2.png',
      title: 'Convenient',
      description:
          'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
      themeColor: Color(0xFFD5715B)),
  _OnboardPage(
      ImagePath: 'assets/images/home3.png',
      title: 'Local',
      description:
          'We love the earth and know you do tool! Join us in reducing our local carbon footprint one order at a time.',
      themeColor: Color(0xFFFFD600))
];
