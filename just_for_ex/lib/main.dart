import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping app',
      home: new ShoppingList(
      products:<Product>[
      Product(name: "apples"),
      Product(name: "chocolate"),
        Product(name: "pizza")
      ]
      ),
    );
  }
}

class Product{
  final String name ;
  Product({this.name});
}

class ShoppingList extends StatefulWidget {

  final List<Product> products;
  ShoppingList({this.products});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
 Set<Product> ShoppingCard = Set<Product>();

 void cardChange(Product product , bool iscard){
   setState(() {
     if(iscard){
       ShoppingCard.remove(product);
     }else{
       ShoppingCard.add(product);
     }
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('shopping list'),
      ),

      body: ListView(
      padding: EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map(
            (Product product) {
              return ShoppingListItem(
                product: product,
                onCardChanged : cardChange,
                incart: ShoppingCard.contains(product) ,
              );
            }).toList(),
      )
    );
  }
}


class ShoppingListItem extends StatelessWidget {

  final Product product ;
  final onCardChanged;
  final bool incart ;
  Color getColor(BuildContext context){
   return incart ? Colors.greenAccent : Colors.amberAccent;
  }

  TextStyle getTextStyle(BuildContext context){
    if(incart){
      return TextStyle(
        color: Colors.orange ,
        decoration: TextDecoration.lineThrough,
      );
    }
    else
      {
        return null ;
      }
  }



  ShoppingListItem({this.incart, this.onCardChanged,this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
       print(incart);
       onCardChanged(product , incart);
      },

      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(product.name[0],
        style:TextStyle(color: Colors.black)),
      ),
      title: Text(product.name ,
              style : getTextStyle(context)),
    );
  }
}

