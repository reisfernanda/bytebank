import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloCampoValor = 'Valor';
const _rotuloNumeroConta = 'Número da conta';
const _dicaCampoValor = 'R\$90.00';
const _dicaNumeroConta = '00003-04';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({super.key});

  final TextEditingController _controllerCampoNumero = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[900],
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _controllerCampoNumero,
                rotulo: _rotuloNumeroConta,
                dica: _dicaNumeroConta),
            Editor(
              controller: _controllerCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: const Text(_botaoConfirmar))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _controllerCampoNumero.text;
    final double? valor = double.tryParse(_controllerCampoValor.text);
    if (valor != null) {
      final transferenciaCriada =
          Transferencia(valor: valor, numeroConta: numeroConta);
      debugPrint(
          'Transferência criada: ${transferenciaCriada.valor} reais para conta ${transferenciaCriada.numeroConta}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Transferência criada: ${transferenciaCriada.valor} reais para conta ${transferenciaCriada.numeroConta}')));
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
