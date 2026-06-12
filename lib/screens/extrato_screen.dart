import 'package:flutter/material.dart';

class ExtratoScreen extends StatelessWidget {
  const ExtratoScreen({super.key});

  static const Color corPrimaria = Color(0xFF6A1B9A);
  static const Color corFundo    = Color(0xFFF3E5F5);
  static const Color corTexto    = Color(0xFF4A148C);

  @override
  Widget build(BuildContext context) {
    // Lista de dados 
    final List<Map<String, dynamic>> historicoTransacoes = [
      {'descricao': 'Pix recebido de João Silva', 'data': 'Hoje, 14:32', 'valor': 'R\$ 150,00', 'tipo': 'credito'}, 
      {'descricao': 'Supermercado Compre Bem', 'data': 'Ontem, 19:15', 'valor': '- R\$ 84,90', 'tipo': 'debito'},
      {'descricao': 'Posto de Combustível Aliança', 'data': '10 JUN', 'valor': '- R\$ 120,00', 'tipo': 'debito'},

    ];

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: corTexto,
        elevation: 1,
        title: const Text('Extrato da Conta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: historicoTransacoes.length,
        itemBuilder: (context, index) {
          final transacao = historicoTransacoes[index];
          final bool ehCredito = transacao['tipo'] == 'credito';

          return Card(
            color: Colors.white,
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              
              // Ícone indicativo baseado no tipo da transação financeira
              leading: CircleAvatar(
                backgroundColor: ehCredito ? Colors.green[50] : Colors.red[50],
                child: Icon(
                  ehCredito ? Icons.arrow_downward : Icons.arrow_upward,
                  color: ehCredito ? Colors.green[700] : Colors.red[700],
                  size: 18,
                ),
              ),

              title: Text(
                transacao['descricao'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
              ),
              
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(transacao['data'], style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const SizedBox(height: 4),

                ],
              ),

              // valor com cor dinâmica (verde para entrada, preto para saída)
              trailing: Text(
                transacao['valor'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ehCredito ? Colors.green[700] : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}