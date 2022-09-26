import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/helpers/CurrencyConvert_api_helpers.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/modals/Currency_Convert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CurrencyConvert?> future;
  TextEditingController amountController = TextEditingController();

  TextStyle textStyle1 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  void initState() {
    super.initState();
    future = CurrencyConvertAPIHelpers.currencyConvertAPIHelpers
        .currencyConvertorAPI(countryFrom: "USD", countryTo: "INR", amount: 1);

    amountController.text = "1";
  }

  String fromCountryCurrency = "USD";
  String toCountryCurrency = "INR";

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.grey,
              centerTitle: true,
              title: const Text("Currency Convertor"),
              actions: [
                Switch(
                    inactiveThumbColor: Colors.black,
                    onChanged: (val) {
                      Global.isIOS = val;
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                          (route) => false);
                    },
                    value: Global.isIOS),
              ],
            ),
            body: FutureBuilder(
              future: future,
              builder: (context, AsyncSnapshot snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text("${snapShot.error}"),
                  );
                } else if (snapShot.hasData) {
                  CurrencyConvert? data = snapShot.data;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text("Amount", style: textStyle1),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    label: const Text(
                                      'Amount',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  controller: amountController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("From", style: textStyle1),
                                    DropdownButtonFormField(

                                      value: fromCountryCurrency,
                                      onChanged: (val) {
                                        setState(() {
                                          fromCountryCurrency = val.toString();
                                        });
                                      },
                                      items: Global.currencyName.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("To", style: textStyle1),
                                    DropdownButtonFormField(
                                      value: toCountryCurrency,
                                      onChanged: (val) {
                                        setState(() {
                                          toCountryCurrency = val.toString();
                                        });
                                      },
                                      items: Global.currencyName.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Total :  ${data!.total}",
                            style: textStyle1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (amountController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    content:
                                        const Text("Please Enter Your Amount"),
                                  ),
                                );
                              } else {
                                int amt = int.parse(amountController.text);
                                setState(() {
                                  future = CurrencyConvertAPIHelpers
                                      .currencyConvertAPIHelpers
                                      .currencyConvertorAPI(
                                    countryFrom: fromCountryCurrency,
                                    countryTo: toCountryCurrency,
                                    amount: amt,
                                  );
                                });
                              }
                            },
                            child: const Text(
                              "Convert",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              trailing: CupertinoSwitch(
                  activeColor: CupertinoColors.activeBlue.withOpacity(0.5),
                  onChanged: (val) {
                    Global.isIOS = val;
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false);
                  },
                  value: Global.isIOS),
              middle: const Text(
                "Currency Convertor",
                style: TextStyle(color: CupertinoColors.black),
              ),
            ),
            backgroundColor: CupertinoColors.white,
            child: FutureBuilder(
              future: future,
              builder: (context, AsyncSnapshot snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Text("${snapShot.error}"),
                  );
                } else if (snapShot.hasData) {
                  CurrencyConvert? data = snapShot.data;

                  return Container(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Text("Amount", style: textStyle1),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(
                                      10    ),
                                  child: CupertinoTextField(
                                    padding: const EdgeInsets.all(15),
                                    keyboardType: TextInputType.number,
                                    controller: amountController,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("From", style: textStyle1),
                                      GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (_) => SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.60,
                                                    height: 250,
                                                    child: CupertinoPicker(
                                                      backgroundColor:
                                                          Colors.white,
                                                      itemExtent: 30,
                                                      children: Global
                                                          .currencyName
                                                          .map((e) {
                                                        return Text(e);
                                                      }).toList(),
                                                      onSelectedItemChanged:
                                                          (value) {
                                                        setState(() {
                                                          fromCountryCurrency =
                                                              Global.currencyName[
                                                                  value];
                                                        });
                                                      },
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                          height: 45,
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              Text(
                                                fromCountryCurrency,
                                              ),
                                              const Spacer(),
                                              const Icon(CupertinoIcons
                                                  .chevron_down),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("To", style: textStyle1),
                                      GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                            context: context,
                                            builder: (_) => SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.60,
                                              height: 250,
                                              child: CupertinoPicker(
                                                backgroundColor: Colors.white,
                                                itemExtent: 30,
                                                children: Global.currencyName
                                                    .map((e) {
                                                  return Text(e);
                                                }).toList(),
                                                onSelectedItemChanged: (value) {
                                                  setState(() {
                                                    toCountryCurrency = Global
                                                        .currencyName[value];
                                                  });
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 45,
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              Text(
                                                toCountryCurrency,
                                              ),
                                              const Spacer(),
                                              const Icon(CupertinoIcons
                                                  .chevron_down),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              "Total  :  ${data!.total}",
                              style: textStyle1,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CupertinoButton.filled(
                              borderRadius: BorderRadius.circular(15),
                              onPressed: () {
                                if (amountController.text.isEmpty) {
                                } else {
                                  int amt = int.parse(amountController.text);
                                  setState(() {
                                    future = CurrencyConvertAPIHelpers
                                        .currencyConvertAPIHelpers
                                        .currencyConvertorAPI(
                                      countryFrom: fromCountryCurrency,
                                      countryTo: toCountryCurrency,
                                      amount: amt,
                                    );
                                  });
                                }
                              },
                              child: const Text(
                                "Convert",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
  }
}
