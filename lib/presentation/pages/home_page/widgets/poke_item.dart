import 'package:flutter/material.dart';
import '../../../../constants/api_routes.dart';
import '../../../../constants/consts_app.dart';
import '../../../widgets/custom_text.dart';

class PokeItem extends StatelessWidget {
  const PokeItem(
      {super.key, this.name, this.index, this.color, this.num, this.types});

  final String? name;
  final int? index;
  final Color? color;
  final String? num;
  final List<String>? types;

  Widget setTipos() {
    List<Widget> lista = [];
    for (var nome in types!) {
      lista.add(
        Column(
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
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lista,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsUi.getColorType(type: types![0])!.withOpacity(0.7),
              ColorsUi.getColorType(type: types![0])!
            ],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children:[
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: '${name}roatation',
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      ColorsUi.whitePokeball,
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: CustomText(
                          text: name ?? "",
                          fontSize: 16,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: setTipos(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: name ?? "",
                  child: Image.network(
                    '${ApiRoutes.getImage}$num.png',
                    alignment: Alignment.bottomRight,
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
