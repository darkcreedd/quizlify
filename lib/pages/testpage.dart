import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_isConnected)
          ? const Center(
              child: Text(
                "You're connected to the internet",
                style: TextStyle(color: Colors.black),
              ),
            )
          : const Center(
              child: Text("No Internet Connection",
                  style: TextStyle(color: Colors.black)),
            ),
    );
  }
}
