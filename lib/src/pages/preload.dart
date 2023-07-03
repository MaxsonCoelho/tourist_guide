import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  void requestInfo() async {
    //atrasar montagem de tela para aguardar chamada       
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    //chamar um método asyncrono (http) de outra classe widget
    // ignore: use_build_context_synchronously
    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if(req) {
      //navega e esconde o botão voltar
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
      //navega sem esconder o botão voltar
      // Navigator.pushNamed(context, '/home');
    }else {
      setState(() {
      loading = false;
    });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

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