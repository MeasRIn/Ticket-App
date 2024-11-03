import 'package:flutter/material.dart';

Widget buildCard(BuildContext context,
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 70,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    icon,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}