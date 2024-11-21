import 'package:flutter/material.dart';

import '../models/transferencia.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List<Transferencia>.from([
    Transferencia(valor: 90.0, numeroConta: '3453-90'),
    Transferencia(valor: 390.0, numeroConta: '2453-90'),
    Transferencia(valor: 1240.0, numeroConta: '8953-90'),
  ]);

  ListaTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        backgroundColor: Colors.green[900],
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(widget._transferencias[index]);
        },
        itemCount: widget._transferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          _navigateToFormularioTransferencia(context)
              .then((value) => atualiza(value));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Set<Set<void>> atualiza(Transferencia? value) {
    return {
      if (value != null)
        {
          setState(() {
            widget._transferencias.add(value);
          })
        }
    };
  }
}

Future<Transferencia?> _navigateToFormularioTransferencia(
    BuildContext context) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop
  final transferencia = await Navigator.pushNamed(
    context,
    '/formularioTransferencia',
  ) as Transferencia;

  // When a BuildContext is used from a StatefulWidget, the mounted property
  // must be checked after an asynchronous gap.
  if (!context.mounted) return null;

  // show the new result.
  debugPrint(
      'Transferência para adicionar na lista: ${transferencia.valor} reais para conta ${transferencia.numeroConta}');
  return transferencia;
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta),
      ),
    );
  }
}
