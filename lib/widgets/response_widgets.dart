import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const [
            Icon(
              Icons.check_circle,
              color: Color(0xff08AB5D),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sucessful',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Failed',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
