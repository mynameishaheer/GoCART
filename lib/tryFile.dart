import 'package:flutter/material.dart';
import 'package:gocart/Main%20Screen%20Pages/checkout_page.dart';
import 'package:gocart/utils.dart';

class tryMe extends StatefulWidget {
  tryMe({Key? key}) : super(key: key);

  @override
  State<tryMe> createState() => _tryMeState();
}

class _tryMeState extends State<tryMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(implyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Splash screen'),
            const Text('Delay'),
            const Text('Onboarding Screen'),
            const Text('Navigate to Login page'),
            logo(),
            gocartTextField(hint: "hint", control: TextEditingController()),
            ElevatedButton(
              onPressed: () {
                dialogs.showDeleteConfirmationDialog(context);
              },
              child: const Text('Try Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckoutPage()));
              },
              child: const Text("Checkout Page"),
            ),
            // ListTile(
            // onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => AssetsObject()));
            // },
            // title: Text("Custom sfb object"),
            // ),
          ],
        ),
      ),
    );
  }
}
