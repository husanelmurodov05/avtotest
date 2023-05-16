import 'dart:async';
import 'package:avtotest/model/bilet_model.dart';
import 'package:avtotest/services/api_service.dart';
import 'package:flutter/material.dart';
import 'belet1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Bilet> biletlar = [];
   bool isLoading= false;
  // int secount = 60;
  // Timer? timer;

  // starTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       secount--;
  //     });
  //   });
  // }

  getBilet() async {
    setState(() {
      isLoading = true;
    });
    ApiService.getBilet().then((value) {
      setState(() {
        biletlar = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBilet();
//    starTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: isLoading? Center(child: CircularProgressIndicator(),): Column(
          children: [
            SizedBox(
              height: 100,
            ),
           
            Text("Belitlar"),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: GridView.builder(
                  itemCount: biletlar.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      mainAxisExtent: 75,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Belet1(
                                      id: biletlar[index].bilet,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          //      mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Image(
                                width: 24,
                                height: 24,
                                image: AssetImage("assets/docum.png")),
                            SizedBox(
                              width: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                              ),
                              child: Column(
                                children: [
                                  Text('Bilet ${biletlar[index].bilet}'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Avto Test',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Text(
                              '10/1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
