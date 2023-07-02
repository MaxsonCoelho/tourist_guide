import 'package:flutter/material.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/travel_logo.png',
            width: 200,
            ),
            loading ? Container(
              margin: const EdgeInsets.all(30),
              child: const Text('Carregando informações',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ) : Container(),
            loading ? const CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ): Container(),
            !loading ? Container(
              margin: const EdgeInsets.all(30),
              child: OutlinedButton(
                child: const Text('Tentar Novamente'),
                onPressed: (){},
              ),
            ) : Container(),
          ],
        ), 
        ),
    );
  }
}