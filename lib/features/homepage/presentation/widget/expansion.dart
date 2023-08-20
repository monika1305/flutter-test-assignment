import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  List<int> numbers = [];

  @override
  void initState() {
    for (int i = 0; i < 100; i++) {
      numbers.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ExpansionTile demo"),
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: Text('List 1'),
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child:    ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numbers.length,
                    itemBuilder: (context, index) => Text(
                        "${numbers[index]}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:  const TextStyle(fontWeight: FontWeight.bold)

                    ),

                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text('List 2'),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      print(numbers[index]);
                      return ListTile(
                        title: Text(
                          "${numbers[index]}",
                        ),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
