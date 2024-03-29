import 'package:flutter/material.dart';
import 'package:gocart/Controllers/wishlist_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Entities/item_entity.dart';
import 'Widgets/wishlist_builder_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Item> list = [];

  @override
  Widget build(BuildContext context) {
    list = context.watch<WishListProvider>().getWishListItems;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Wishlist",
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 33, 32, 32),
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          WishListBuilder(wishlist: list),
        ],
      ),
    );
  }
}
