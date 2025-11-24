import 'package:flutter/material.dart';

class CutomeAppBar extends StatelessWidget {
  const CutomeAppBar(
      {super.key, required this.title, required this.icon, this.ontap});
  final String title;
  final IconData icon;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(.05),
              //color: Colors.grey[850]
            ),
            child: Center(
              child: IconButton(
                onPressed: ontap,
                icon: Icon(
                  color: Colors.white,
                  icon,
                  size: 28,
                ),
              ),
            ))
      ],
    );
  }
}
