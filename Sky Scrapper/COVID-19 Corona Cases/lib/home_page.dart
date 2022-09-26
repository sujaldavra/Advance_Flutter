import 'package:flutter/material.dart';
import 'package:flutter_app/helper/covid_data_api_helper.dart';
import 'package:flutter_app/modals/modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selectedCountry;
  List allCountry = [];
  dynamic i;

  TextStyle TitelStyle1 = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle TitelStyle2 = const TextStyle(
    fontSize: 20,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text("COVID-19"),
      ),
      body: FutureBuilder(
        future: Covid19ApiHelper.covid19ApiHelper.fetchCovid19DataAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<Covid19Data> data = snapshot.data as List<Covid19Data>;
            allCountry = data.map((e) => e.name).toList();

            return Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            hint: const Text("Please Select Country."),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            value: selectedCountry,
                            onChanged: (val) {
                              setState(() {
                                selectedCountry = val;
                                i = allCountry.indexOf(val);
                              });
                            },
                            items: allCountry.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  child: Text(e),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    (i != null)
                        ? Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Text("Today", style: TitelStyle1),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.only(),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Confirmed : ${data[i].todayConfirmed}",
                                        style: TitelStyle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Deaths : ${data[i].todayDeaths}",
                                        style: TitelStyle2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text("All Over Cases", style: TitelStyle1,),
                                const SizedBox(height: 15),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Confirmed : ${data[i].totalConfirmed}",
                                        style: TitelStyle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Deaths : ${data[i].totalDeaths}",
                                        style: TitelStyle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Recovered : ${data[i].totalRecovered}",
                                        style: TitelStyle2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Critical : ${data[i].totalCritical}",
                                        style: TitelStyle2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 25),
                                (data[i].recoveryRate != null)
                                    ? Column(
                                      children: [
                                        Text(
                                          "Recovery Rate :",
                                          style: TitelStyle1,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "${data[i].recoveryRate}",
                                          style: TitelStyle2,
                                        ),
                                      ],
                                    )
                                    : Container(),
                                const SizedBox(height: 40),
                              ],
                            ),
                          )
                        : Column(),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
