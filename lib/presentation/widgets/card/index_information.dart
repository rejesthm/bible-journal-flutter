import 'package:bible_journal/presentation/widgets/texts/description_text.dart';
import 'package:flutter/material.dart';

class IndexInformation extends StatelessWidget {
  final IconData icon;
  final String label;

  const IndexInformation({Key key, this.icon, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 10.0,
            ),
            DescriptionText(
              text: label ?? "",
            )
          ],
        ),
      ),
    );
  }
}
