import 'package:flutter/material.dart';
import 'custom_text.dart';

class SetTypesWidget extends StatelessWidget {
  final List<String> types;

  const SetTypesWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: setTypes(),
    );
  }

  List<Widget> setTypes() {
    List<Widget> lista = [];
    for (var nome in types) {
      lista.add(
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomText(
                  text: nome.trim(),
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      );
    }
    return lista;
  }
}
