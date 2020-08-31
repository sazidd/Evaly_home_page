import 'package:evaly_home_page/confiq.dart';
import 'package:evaly_home_page/models/functionModel.dart';
import 'package:evaly_home_page/models/productCategoryModel.dart';
import 'package:evaly_home_page/widgets/categories.dart';
import 'package:evaly_home_page/widgets/drawer.dart';
import 'package:evaly_home_page/widgets/functionality.dart';
import 'package:evaly_home_page/widgets/productCategoryCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Evaly",
          style: TextStyle(
            color: ColorMaterial.lightBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _searchBar(),
          _buildOfferContainer(),
          Container(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: functionality.length,
              itemBuilder: (context, index) => Functionality(
                functionModel: functionality[index],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Categories(),
          Container(
            height: 200,
            child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: productCategoryModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // mainAxisSpacing: 10,
                // crossAxisSpacing: 10,
                childAspectRatio: 0.80,
              ),
              itemBuilder: (context, index) => ProductCategoryCard(
                product: productCategoryModel[index],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: ColorMaterial.lightColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Just For You                                                                                  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 200,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     color: Colors.red,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.search),
          Flexible(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5),
                hintText: "Search Product",
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildOfferContainer() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/images/evaly.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
