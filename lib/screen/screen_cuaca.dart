import 'package:intl/intl.dart';
import 'package:cuaca/provider/provider_cuaca.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProviderCuaca cuacaProvider = ProviderCuaca();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy')
        .format(now); // Menambahkan Nama Bulan, Tanggal, dan Tahun
    String dayOfWeek = DateFormat('EEEE').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Aplikasi Cuaca"),
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2019/05/12/20/11/mountains-4199004_1280.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Consumer<ProviderCuaca>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: provider.cityNameText,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nama Kota",
                        labelText: "Nama Kota",
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        provider.showWeatherData();
                      },
                      child: Text(
                        "Tampilkan Data Cuaca",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 80),
                    Text(
                      provider.modelCuaca.name ?? "Waiting Data",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$dayOfWeek, $formattedDate",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${provider.modelCuaca.main?.temp?.toStringAsFixed(0)}°c",
                          style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      provider.modelCuaca.weather?.first.main ?? "Waiting data",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${provider.modelCuaca.main?.tempMin?.toStringAsFixed(0)}°c",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: "/",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${provider.modelCuaca.main?.tempMax?.toStringAsFixed(0)}°c",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
