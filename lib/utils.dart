// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:gocart/rickroll.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Entities/address_entity.dart';
import 'Entities/debitcard_entity.dart';
import 'Screens/Account Screen Pages/Account Main/account_main_page.dart';

// Logo
// ignore: camel_case_types, must_be_immutable
class logo extends StatelessWidget {
  // logo({Key? key}) : super(key: key);
  logo(
      {this.primaryColor = Colors.black87,
      this.secondaryColor = Colors.redAccent,
      this.fontSize = -1,
      Key? key})
      : super(key: key);
  final Color primaryColor; //= const Color.fromARGB(255, 59, 59, 61);
  final Color secondaryColor; //= const Color.fromARGB(255, 232, 72, 85);
  double fontSize;

  @override
  Widget build(BuildContext context) {
    if (fontSize == -1) {
      fontSize = MediaQuery.of(context).size.height * 0.08;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'GO',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            color: primaryColor,
          ),
        ),
        Text(
          'C',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
        Text(
          'AR',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: secondaryColor,
          ),
        ),
        Text(
          'T',
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.implyLeading}) : super(key: key);
  final bool implyLeading;

  @override
  Widget build(BuildContext context) {
    //double screenSizeW = MediaQuery.of(context).size.width;
    double screenSizeH = MediaQuery.of(context).size.height;

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 59, 59, 61),
      // automaticallyImplyLeading: implyLeading,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      title: logo(
        primaryColor: Colors.white,
        secondaryColor: Colors.yellow,
        fontSize: screenSizeH * 0.035,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 26.0),
        child: !implyLeading
            ? IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountMain()),
                  );
                },
                icon: const Icon(Icons.account_circle_outlined),
                color: Colors.white,
                iconSize: 28,
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                iconSize: 28,
              ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 26.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RickRoll(),
                ),
              );
            },
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            iconSize: 28,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// Header with back button
class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenSizeW = MediaQuery.of(context).size.width;
    double screenSizeH = MediaQuery.of(context).size.height;
    // returns a container with a back button and a title
    return SizedBox(
        width: screenSizeW,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: screenSizeH * 0.04,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: screenSizeH * 0.03,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 59, 59, 61),
              ),
            ),
            Container(width: screenSizeW * 0.1),
          ],
        ));
  }
}

// Dialog for confirm delete
// ignore: camel_case_types
class dialogs {
  static errorToast({required String error}) {
    error = TextFormatter.errorFormatter(text: error);
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static messageToast({required String error}) {
    error = TextFormatter.errorFormatter(text: error);
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future errorDialog(
      BuildContext context, String title, String message) {
    message = TextFormatter.errorFormatter(text: message);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                // color: const Color.fromARGB(255, 59, 59, 61),
                color: Colors.redAccent),
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 59, 59, 61),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 59, 59, 61),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 232, 72, 85),
          title: const Text("Are you sure you want to delete this?",
              style: TextStyle(color: Colors.white)),
          // content: const Text('Please confirm that you want to delete this!'),
          actions: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:
                        const Text('No', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Yes',
                        style: TextStyle(color: Colors.black87)),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ])
          ],
        );
      },
    );
  }

  // popup dialog for returning the selected debit card option
  // takes list of debit cards and returns the selected debit card
  static Future<Object?> showSwapDialog(
      BuildContext context, List<Object> listObject) async {
    // Address Tile for Address swap
    Widget addressTile(Address address) {
      return ListTile(
        leading: const Icon(Icons.home, size: 30),
        title: Text(
          address.name,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: const Color.fromARGB(255, 59, 59, 61),
          ),
        ),
        subtitle: Text(
          address.phone + ", " + address.city + ", " + address.zip,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 59, 59, 61),
          ),
        ),
      );
    }

    // Card Tile for Card Swap
    Widget cardTile(DebitCard card) {
      return ListTile(
        leading: const Icon(Icons.sim_card_rounded, size: 30),
        title: Text(
          // last 4 digits of card number
          card.cardNumber.substring(card.cardNumber.length - 4).padLeft(8, "*"),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: const Color.fromARGB(255, 59, 59, 61),
          ),
        ),
        subtitle: Text(
          card.bankName,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 59, 59, 61),
          ),
        ),
      );
    }

    return showDialog<Object>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 232, 72, 85),
          title: Text(
              listObject is List<DebitCard>
                  ? "Select a Debit Card"
                  : "Select an Address",
              style: const TextStyle(color: Colors.white)),
          actions: <Widget>[
            for (int i = 0; i < listObject.length; i++)
              TextButton(
                child: listObject[i] is DebitCard
                    ? cardTile(listObject[i] as DebitCard)
                    : addressTile(listObject[i] as Address),
                onPressed: () {
                  Navigator.of(context).pop(listObject[i]);
                },
              ),
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 59, 59, 61),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Elevted Button Template
// ignore: camel_case_types
class coolButton extends StatelessWidget {
  const coolButton({
    required this.text,
    required this.functionToComply,
    this.primaryColor = Colors.redAccent,
    Key? key,
  }) : super(key: key);
  final String text;
  final void Function() functionToComply;
  final Color primaryColor;
  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    final double textSize = screenSizeH * 0.03;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(screenSizeH * 0.25, screenSizeH * 0.07),
        primary: primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
        shadowColor: Colors.grey.shade900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
            style: GoogleFonts.poppins(
                fontSize: textSize, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center),
      ),
      onPressed: functionToComply,
    );
  }
}

// GocartTextField
// ignore: camel_case_types
class gocartTextField extends StatefulWidget {
  const gocartTextField({
    required this.hint,
    required this.control,
    this.pswd = false,
    this.textType = TextInputType.text,
    this.editable = true,
    this.length,
    this.onChangedFunction,
    Key? key,
  }) : super(key: key);
  final String hint;
  final TextEditingController control;
  final bool pswd;
  final TextInputType textType;
  final bool? editable;
  final int? length;
  final void Function(String)? onChangedFunction;

  @override
  State<gocartTextField> createState() => _gocartTextFieldState();
}

class _gocartTextFieldState extends State<gocartTextField> {
  late bool _obscured;
  late IconData _suffixIcon;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    // Set Initial Value
    _obscured = widget.pswd;
    _suffixIcon = Icons.visibility_off;
  }

  @override
  Widget build(BuildContext context) {
    final double screenSizeH = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: widget.length == null ? 20 : 0),
      child: TextField(
        autofocus: false,
        onChanged: widget.onChangedFunction,
        maxLength: widget.length,
        enabled: widget.editable,
        obscureText: _obscured,
        keyboardType: widget.textType,
        controller: widget.control,
        decoration: InputDecoration(
          // set size of input field
          contentPadding: EdgeInsets.symmetric(
              vertical: screenSizeH * 0.000, horizontal: 20),
          filled: true,
          fillColor: Colors.grey.shade300,
          hintText: widget.hint,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: screenSizeH * 0.02,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 2.0),
          ),
          // If its a password field, show a suffix icon
          suffixIcon: !widget.pswd
              ? null
              : IconButton(
                  icon: Icon(_suffixIcon),
                  onPressed: () {
                    // Toggle the suffix icon
                    _obscured = !_obscured;
                    setState(() {
                      _obscured
                          ? _suffixIcon = Icons.visibility_off
                          : _suffixIcon = Icons.visibility;
                    });
                  }),
        ),
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: screenSizeH * 0.02,
        ),
      ),
    );
  }
}

class JumpingLogo extends StatelessWidget {
  const JumpingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.black87;
    const Color secondaryColor = Colors.redAccent;
    // Screensize / some value
    double fontSize = MediaQuery.of(context).size.width * 0.13;
    return CollectionSlideTransition(children: [
      Text(
        'G',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: primaryColor,
        ),
      ),
      // Text(
      //   'O',
      //   style: GoogleFonts.poppins(
      //     fontSize: fontSize,
      //     fontWeight: FontWeight.w300,
      //     color: primaryColor,
      //   ),
      // ),
      SizedBox(
        width: fontSize / 2 + 10,
        height: fontSize / 2 + 10,
        child: const CircularProgressIndicator(color: primaryColor),
      ),
      Text(
        'C',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: primaryColor,
        ),
      ),
      Text(
        'A',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: secondaryColor,
        ),
      ),
      Text(
        'R',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: secondaryColor,
        ),
      ),
      Text(
        'T',
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: primaryColor,
        ),
      ),
    ]);
  }
}

class TextFormatter {
  static String removeSpecialCharacters(String input) {
    return input.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  static String firebaseError(String input) {
    return input.toString().split("]").last.trim();
  }

  static String errorFormatter({required String text}) {
    // Error messages Formatting
    text = text.split(" or ")[0];
    text = text.split(".")[0] + ".";
    text = text.replaceAll("String", "Field");
    text = text.replaceAll("null", "blank");
    text = text.replaceAll("badly", "incorrectly");
    text = text.replaceAll("identifier", "email");
    return text;
  }

  static productNameFormatter(String name) {
    name = name.split(" ").first + " " + name.split(" ").last;
    // if both first and last name are same, remove last name
    if (name.split(" ").first == name.split(" ").last) {
      name = name.split(" ").first;
    }
    // capetalise first letter
    name = name.split(" ").map((e) {
      return e.substring(0, 1).toUpperCase() + e.substring(1);
    }).join(" ");
    return name;
  }
}

class OpenURL extends StatefulWidget {
  const OpenURL({Key? key, required this.webURL}) : super(key: key);

  final String webURL;

  @override
  State<OpenURL> createState() => _OpenURLState();
}

class _OpenURLState extends State<OpenURL> {
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(scheme: 'https', host: widget.webURL, path: '/');
    return TextButton(
      onPressed: () => setState(() {
        _launched = _launchInBrowser(toLaunch);
      }),
      child: Text(widget.webURL),
    );
  }
}
