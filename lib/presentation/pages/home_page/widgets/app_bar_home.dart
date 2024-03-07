import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 13, right: 5),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
