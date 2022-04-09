import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/Widgets/item_list_widgets.dart';
import 'package:gocart/Models/order_history_model.dart';
import 'package:gocart/Models/order_history_provider.dart';
import 'package:gocart/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);

  List<OrderHistory> history = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    history = context.read<OrderHistoryProvider>().items;

    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: screenHeight * 0.05),
          const HeaderBar(title: "Order History"),
          SizedBox(height: screenHeight * 0.05),
          Expanded(
            child: ListView.separated(
              itemCount: history.length,
              itemBuilder: (context, index) => Card(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ItemThumbnail(item: history[index].cart.first),
                    // const SizedBox(
                    //   width: 24,
                    // ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.5),
                        color: const Color.fromARGB(255, 46, 44, 44),
                        image: DecorationImage(
                          image: NetworkImage(
                            history[index].cart.first.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildOrderHistoryDetail(
                            "Order ID: ", history[index].orderID),
                        buildOrderHistoryDetail(
                            "Status: ", history[index].status),
                        buildOrderHistoryDetail(
                            "Quantity: ", history[index].quantity.toString()),
                        buildOrderHistoryDetail(
                            "Total: ", "PKR ${history[index].total}"),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27))),
                      onPressed: () {},
                      child: const Text(
                        "View Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: Divider(
                  thickness: 1,
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildOrderHistoryDetail(String title, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(color: Colors.grey[600]),
        ),
        Text(text),
      ],
    );
  }
}
