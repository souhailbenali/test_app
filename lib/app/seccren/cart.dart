import 'package:flutter/material.dart';
import 'package:test_app/app/components/custom_header.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  final List<Map<String, String>> foods = [
    {
      'name': 'Salade de Fruits',
      'price': '15.00 €',
      'rate': '4.8',
      'clients': 'John Doe (Cocuisineur)',
      'image': 'images/salade.jpg'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget renderAddList() {
    return ListView.builder(
      itemCount: this.foods.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, String> food = foods[index];
        Color primaryColor = Theme.of(context).primaryColor;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'details',
                    arguments: {
                      'product': food,
                      'index': index,
                    },
                  );
                },
                child: Hero(
                  tag: 'detail_food$index',
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(food['image']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      food['name'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(food['clients']),
                                Text(food['price']),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.remove),
                                    Container(
                                      color: primaryColor,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 3.0,
                                        horizontal: 12.0,
                                      ),
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomHeader(
            title: 'Panier',
            quantity: this.foods.length,
            internalScreen: true,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 35.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Colors.orange[400],
                            Color(0xFFE85852),
                          ])),
                  child: Text(
                    'Solde',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("€0.00")
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mon Panier",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: renderAddList()),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Commande"),
                        Text("Commission"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Text("15.00€"), Text("20%")],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Click and collect",
                          style: TextStyle(fontSize: 15),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                            ),
                            Text("      ")
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Livraison"),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                            ),
                            Text("+3€")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total"),
                    Text("18€"),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 35.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.orange[400],
                  ),
                  child: Text(
                    'Payer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
