import 'package:credit_card/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class MySample extends StatefulWidget {
  const MySample({Key? key}) : super(key: key);

  @override
  _MySampleState createState() => _MySampleState();
}

class _MySampleState extends State<MySample> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorpism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRED BOT",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "CRED BOT",
                style: TextStyle(
                  fontFamily: 'Sf',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/appbar.png',
                height: 40,
                width: 40,
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: !useBackgroundImage
                ? const DecorationImage(
                    image: ExactAssetImage('assets/bg.jpg'),
                    fit: BoxFit.fill,
                  )
                : null,
            color: Colors.indigo,
          ),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              CreditCardWidget(
                glassmorphismConfig:
                    useGlassMorpism ? Glassmorphism.defaultConfig() : null,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardCvv: true,
                obscureCardNumber: false,
                isHolderNameVisible: true,
                cardBgColor: Colors.black,
                backgroundImage:
                    useBackgroundImage ? 'assets/cardbg.jpg' : null,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/mcard.png',
                      height: 70,
                      width: 70,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      cardNumber: cardNumber,
                      obscureCvv: true,
                      obscureNumber: true,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: onCreditCardModelChange,
                      themeColor: Colors.blue,
                      textColor: Colors.white,
                      formKey: formKey,
                      cardNumberDecoration: InputDecoration(
                        labelText: "Number",
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        labelText: "Expired Date",
                        hintText: 'XX/XX',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      cvvCodeDecoration: InputDecoration(
                        labelText: "CVV",
                        hintText: 'XXX',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      cardHolderDecoration: InputDecoration(
                        labelText: "Card Holder",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sf',
                        ),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Glassmorphism',
                          style: TextStyle(
                            fontFamily: 'Sf',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Switch(
                          value: useGlassMorpism,
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.green,
                          activeColor: Colors.white,
                          onChanged: (bool value) => setState(() {
                            useGlassMorpism = value;
                          }),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Card Image',
                          style: TextStyle(
                            fontFamily: 'Sf',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Switch(
                          value: useBackgroundImage,
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.green,
                          activeColor: Colors.white,
                          onChanged: (bool value) => setState(() {
                            useBackgroundImage = value;
                          }),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Invalid(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.cyan,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Text(
                          'Validate',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
