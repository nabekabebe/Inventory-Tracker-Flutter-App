import 'package:flutter/material.dart';

class TransactionListItem extends StatelessWidget {
  final bool isPositive;
  final int soldCount;
  final String title;
  final String time;
  final String money;

  const TransactionListItem(
      {super.key,
      required this.soldCount,
      required this.time,
      required this.title,
      required this.money,
      this.isPositive = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const FlutterLogo(size: 72.0),
        title: Text(title),
        subtitle: Text('Sold $soldCount'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time),
            RichText(
              text: TextSpan(
                  text: isPositive ? '+ ' : "- ",
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "$money ",
                    ),
                    const TextSpan(
                      text: "ETB",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
