import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:task_sm/widgets/custom_elevated_button.dart';

class EnableCountryView extends StatelessWidget {
  const EnableCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    List<Map> countryList = [
      {
        "name": "Afghanistan",
        "image": "assets/images/Afghanistan.png",
        "value": true,
      },
      {"name": "Algeria", "image": "assets/images/Algeria.png", "value": false},
      {
        "name": "Indonesia",
        "image": "assets/images/Indonesia.png",
        "value": false,
      },
      {
        "name": "Malaysia",
        "image": "assets/images/Malaysia.png",
        "value": false,
      },
      {"name": "UE", "image": "assets/images/UE.png", "value": false},
      {"name": "UA", "image": "assets/images/UA.png", "value": false},
    ];
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: CustomElevatedButton(title: "Continue", ontab: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width * .8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is Your Mother Language",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                    Text(
                      "Discover what is a podcast description and podcast summary",
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                        fontFamily: "Inter_Regular",
                      ),
                    ),
                  ],
                ),
              ),

              ListView.builder(
                itemCount: countryList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset(countryList[index]["image"]),
                      ),
                      title: Text(
                        countryList[index]["name"],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter_Regular",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color:
                              countryList[index]["value"] == true
                                  ? Color(0xFF1B6EF7)
                                  : Colors.black.withOpacity(.1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Text(
                            "Select",
                            style: TextStyle(
                              color:
                                  countryList[index]["value"] == true
                                      ? Colors.white
                                      : Colors.black.withOpacity(.7),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
