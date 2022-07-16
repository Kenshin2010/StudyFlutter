import 'package:flutter/material.dart';
import 'transition.dart';

class TransitionList extends StatelessWidget {
  List<Transaction> transitonList = <Transaction>[];
  TransitionList({required this.transitonList});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transitonList.length,
        itemBuilder: (context, index) {
          return Container(
              height: 60,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.pink,
                  elevation: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Icon(Icons.favorite),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Line title 2",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            "Line sub title",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: const Text('17/07//2022',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          Padding(padding: EdgeInsets.all(10))
                        ],
                      ))
                    ],
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 500,
      child: _buildListView(),
    );
  }
}
