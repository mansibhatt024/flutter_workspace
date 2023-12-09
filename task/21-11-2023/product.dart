import 'package:flutter/material.dart';
import 'first.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("My First Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ProductWidget(
              text: "Product 1",
              imageUrl:
              "https://www.cosmeticsdesign-asia.com/var/wrbm_gb_food_pharma/storage/images/publications/cosmetics/cosmeticsdesign-asia.com/headlines/formulation-science/pulp-fact-coffee-by-product-can-help-wound-healing-twice-as-fast-as-nature/9798651-1-eng-GB/Pulp-fact-Coffee-by-product-can-help-wound-healing-twice-as-fast-as-nature.jpg",

            description:"Coffee is a beverage brewed from the roasted and ground seeds of the tropical evergreen coffee plant. Coffee is one of the three most popular beverages in the world",
            ),
            ProductWidget(
              text: "Product 2",
              imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOhwqiozQQjydVx3SUj3nEwsGV24nUfaAyFw&usqp=CAU",
                description:"A smartphone is a mobile device that facilitates the combination of cellular and mobile computing functions into one single unit. Moreover, smartphones have stronger hardware capabilities and extensive mobile operating systems in comparison to feature phones.",
            ),
            ProductWidget(
              text: "Product 3",
              imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqYeZnwMFg3ajNpZG0nGmjnAE6PfS_T-p8QQ&usqp=CAU",
              description: "A car, or an automobile, is a motor vehicle with wheels. Most definitions of cars state that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people, not cargo.",
            ),
            ProductWidget(
              text: "Product 4",
              imageUrl:
              "https://cdn.shopify.com/s/files/1/0070/7032/files/diy-product-photography.jpg?v=1599161908",
              description: "A camera is an optical instrument used to capture and store images and videos, either digitally via an electronic image sensor, or chemically via a light-sensitive material such as photographic film."

            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String description;

  const ProductWidget({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        SizedBox(
          width: 100,
          height: 100,
          child: InkWell(child: Image.network(imageUrl),onTap: (){
            print(Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ProductDescriptionPage(
                  productName: text,
                  productImageUrl: imageUrl,
                  productDescription: description,
                ),
              ),
            ));
          },),
        ),
        ElevatedButton(
          onPressed: () {
            print("Clicked Successfully");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ProductDescriptionPage(
                  productName: text,
                  productImageUrl: imageUrl,
                  productDescription: description,
                ),
              ),
            );
          },
          child: const Text("next"),
        ),
      ],
    );
  }
}
