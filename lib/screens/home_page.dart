import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evaly_home_page/models/functionModel.dart';
import 'package:evaly_home_page/models/productCategoryModel.dart';
import 'package:evaly_home_page/models/productModel.dart';
import 'package:evaly_home_page/widgets/drawer.dart';
import 'package:evaly_home_page/widgets/functionality.dart';
import 'package:evaly_home_page/widgets/itemCard.dart';
import 'package:evaly_home_page/widgets/productCategoryCard.dart';
import 'package:flutter/material.dart';

import '../confiq.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Evaly",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            expandedHeight: 260.0,
            pinned: true,

            // snap: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: FlexibleSpaceBar(
                background: Column(
                  children: [
                    _searchBar(),
                    _buildOfferContainer(),
                  ],
                ),
                // title: TextField(
                //   cursorColor: Colors.black,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     contentPadding: EdgeInsets.all(5),
                //     hintText: "Search Product",
                //   ),
                // ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.message),
                tooltip: 'Add new entry',
                onPressed: () {/* ... */},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          // _searchBar(),
          // _buildOfferContainer(),
          SliverToBoxAdapter(
            child: Container(
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.67,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: ColorMaterial.lightColor,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.black,
            size: 20,
          ),
          Icon(
            Icons.sms,
            color: Colors.black,
            size: 20,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 20,
          ),
          Icon(
            Icons.person,
            color: Colors.black,
            size: 20,
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
    );
  }
}
