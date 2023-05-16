import 'package:avtotest/model/savol_model.dart';
import 'package:avtotest/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Belet1 extends StatefulWidget {
  final int id;
  const Belet1({super.key, required this.id});

  @override
  State<Belet1> createState() => _Belet1State();
}

class _Belet1State extends State<Belet1> {
  PageController _pagecontroller = PageController();
  int _hozirgiIndex = 0;
  bool isLoading = false;
  List<Savol> savollar = [];
  getSavollar() async {
    setState(() {
      isLoading = true;
    });
    ApiService.getSavollar(widget.id).then((value) {
      setState(() {
        savollar = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSavollar();
  }

  List<Map<String, dynamic>> selectedAnswer =
      List.generate(10, (index) => {"answer": "", "isTrue": ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (_hozirgiIndex != 0) {
                  _pagecontroller.animateToPage(_hozirgiIndex - 1,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                }
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.grey.shade200)),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              child: Container(
                child: Center(
                  child: Text(
                    "Комментария",
                    style: TextStyle(color: Color(0Xff344054), fontSize: 12),
                  ),
                ),
                width: 143,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.shade200,
                    )),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (savollar.length - 1 != _hozirgiIndex) {
                  _pagecontroller.animateToPage(_hozirgiIndex + 1,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                }
                print(selectedAnswer[_hozirgiIndex]);
                print(savollar[_hozirgiIndex].javob);
              },
              child: Container(
                child: Center(
                    child: Text(
                  'Далее',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                )),
                width: 120,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF145FC1)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 5),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Text(
                        'Билеты ${widget.id}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.schedule,
                            size: 30,
                            color: Color.fromARGB(255, 9, 85, 147),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '18:12',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                      controller: _pagecontroller,
                      onPageChanged: (index) {
                        setState(() {
                          _hozirgiIndex = index;
                        });
                      },
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: savollar.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Image(image: AssetImage("assets/images.png")),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 12, top: 13, bottom: 13),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 200),
                                        child: Text(
                                          'ВОПРОС ${savollar[index].raqam} ИЗ ${savollar.length}',
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        savollar[index].savol!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * 0.95,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: selectedAnswer[index]["answer"] == ""
                                        ? Colors.white
                                        : (savollar[index].javob == "A"
                                            ? Colors.green
                                            : Colors.red),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: RadioListTile(
                                            title:
                                                Text(savollar[index].javobA!),
                                            value: "A",
                                            groupValue: selectedAnswer[index]
                                                ["answer"],
                                            onChanged: (value) {
                                              if (selectedAnswer[index]
                                                      ["answer"] !=
                                                  "") {
                                                return null;
                                              }
                                              if (value ==
                                                  savollar[index].javob) {
                                                setState(() {
                                                  selectedAnswer[index]
                                                      ["isTrue"] = true;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Siz to'g'ri javob berdingiz")));
                                              } else {
                                                setState(() {
                                                  selectedAnswer[index]
                                                      ["isTrue"] = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Notog'ri javob berdingiz")));
                                              }
                                              setState(() {
                                                selectedAnswer[index]
                                                    ["answer"] = value!;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * 0.95,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: selectedAnswer[index]["answer"] == ""
                                        ? Colors.white
                                        : (savollar[index].javob == "B"
                                            ? Colors.green
                                            : Colors.red),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: RadioListTile(
                                            title:
                                                Text(savollar[index].javobB!),
                                            value: "B",
                                            groupValue: selectedAnswer[index]
                                                ["answer"],
                                            onChanged: (value) {
                                              if (selectedAnswer[index]
                                                      ["answer"] !=
                                                  "") {
                                                return null;
                                              }
                                              if (value ==
                                                  savollar[index].javob) {
                                                setState(() {
                                                  selectedAnswer[index]
                                                      ["isTrue"] = true;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Siz to'g'ri javob berdingiz")));
                                              } else {
                                                setState(() {
                                                  selectedAnswer[index]
                                                      ["isTrue"] = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Notog'ri javob berdingiz")));
                                              }
                                              setState(() {
                                                selectedAnswer[index]
                                                    ["answer"] = value!;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              savollar[index].javobC == ""
                                  ? Container()
                                  : Container(
                                      padding: EdgeInsets.all(16),
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: selectedAnswer[index]
                                                      ["answer"] ==
                                                  ""
                                              ? Colors.white
                                              : (savollar[index].javob == "C"
                                                  ? Colors.green
                                                  : Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: RadioListTile(
                                                  title: Text(
                                                      savollar[index].javobA!),
                                                  value: "C",
                                                  groupValue:
                                                      selectedAnswer[index]
                                                          ["answer"],
                                                  onChanged: (value) {
                                                    if (selectedAnswer[index]
                                                            ["answer"] !=
                                                        "") {
                                                      return null;
                                                    }
                                                    if (value ==
                                                        savollar[index].javob) {
                                                      setState(() {
                                                        selectedAnswer[index]
                                                            ["isTrue"] = true;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Siz to'g'ri javob berdingiz")));
                                                    } else {
                                                      setState(() {
                                                        selectedAnswer[index]
                                                            ["isTrue"] = false;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Notog'ri javob berdingiz")));
                                                    }
                                                    setState(() {
                                                      selectedAnswer[index]
                                                          ["answer"] = value!;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              savollar[index].javobD == ""
                                  ? Container()
                                  : Container(
                                      padding: EdgeInsets.all(16),
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: selectedAnswer[index]
                                                      ["answer"] ==
                                                  ""
                                              ? Colors.white
                                              : (savollar[index].javob == "D"
                                                  ? Colors.green
                                                  : Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: RadioListTile(
                                                  title: Text(
                                                      savollar[index].javobA!),
                                                  value: "D",
                                                  groupValue:
                                                      selectedAnswer[index]
                                                          ["answer"],
                                                  onChanged: (value) {
                                                    if (selectedAnswer[index]
                                                            ["answer"] !=
                                                        "") {
                                                      return null;
                                                    }
                                                    if (value ==
                                                        savollar[index].javob) {
                                                      setState(() {
                                                        selectedAnswer[index]
                                                            ["isTrue"] = true;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Siz to'g'ri javob berdingiz")));
                                                    } else {
                                                      setState(() {
                                                        selectedAnswer[index]
                                                            ["isTrue"] = false;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Notog'ri javob berdingiz")));
                                                    }
                                                    setState(() {
                                                      selectedAnswer[index]
                                                          ["answer"] = value!;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
