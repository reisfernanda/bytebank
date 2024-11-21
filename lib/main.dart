import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      // home: Scaffold(
      //   body: ListaTransferencia(),
      // ),
      title: 'ByteBank',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => ListaTransferencia(),
        '/formularioTransferencia': (BuildContext context) =>
            FormularioTransferencia(),
      },
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.green[900],
            secondary: Colors.green[700],
          ),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.greenAccent[700],
              textTheme: ButtonTextTheme.primary)),
    );
  }
}
