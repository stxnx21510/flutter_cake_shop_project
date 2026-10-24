// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class CakeShopDetailUI extends StatefulWidget {
  //recieve data from cake shop list ui
  CakeShop? cakeShop;

  CakeShopDetailUI({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUI> createState() => _CakeShopDetailUIState();
}

class _CakeShopDetailUIState extends State<CakeShopDetailUI> {
  //method call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  //method app
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 6, 6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.cakeShop!.name!,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 50,
            left: 45,
            right: 45,
          ),
          child: Center(
            child: Column(
              children: [
                //show first image of shop
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    widget.cakeShop!.image1!,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //show second and third
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        widget.cakeShop!.image2!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        widget.cakeShop!.image3!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //name shop
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.name!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด 🕝',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.openCloseTime!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดของร้าน 📝',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.description!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน📍',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.address!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //show phone number
                ElevatedButton(
                  onPressed: () {
                    //use method call
                    _makePhoneCall(widget.cakeShop!.phone!);
                  },
                  child: Text(
                    ' 📞 : ${widget.cakeShop!.phone!}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.45,
                      50.5,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //show website
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.website!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.amber,
                    size: 30,
                  ),
                  trailing: Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  title: Text(
                    widget.cakeShop!.website!,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.facebook!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 30,
                  ),
                  trailing: Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  title: Text(
                    widget.cakeShop!.facebook!,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //show map and marker
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FlutterMap(
                    //latlong
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!.latitude!),
                        double.parse(widget.cakeShop!.longitude!),
                      ),
                      initialZoom: 15.0,
                    ),
                    //layer on map
                    children: [
                      //map
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      //marker
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShop!.latitude!),
                              double.parse(widget.cakeShop!.longitude!),
                            ),
                            width: 80,
                            height: 80,
                            child: GestureDetector(
                              onTap: () {
                                //open google Map
                                _launchInBrowser(
                                  Uri.parse(
                                    'https://www.google.com/maps/@${widget.cakeShop!.latitude!},${widget.cakeShop!.longitude!},15.55z',
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
