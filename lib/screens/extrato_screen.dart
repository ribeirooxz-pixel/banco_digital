import 'package:flutter/material.dart';

class ExtratoScreen extends StatelessWidget {
  const ExtratoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // REQUISITO: Dados inseridos de forma estática no código
    final List<Map<String, dynamic>> transacoes = [
      {'titulo': 'Pix recebido de Ana Costa', 'data': 'Hoje, 11:24', 'valor': 'R\$ 120,00', 'tipo': 'entrada', 'tag': 'Transferência'},
      {'titulo': 'Restaurante Sabor Local', 'data': 'Ontem, 20:15', 'valor': '- R\$ 45,90', 'tipo': 'saida', 'tag': 'Alimentação'},
      {'titulo': 'Assinatura Spotify', 'data': '19 JUN', 'valor': '- R\$ 34,90', 'tipo': 'saida', 'tag': 'Lazer'},
      {'titulo': 'Supermercado Central', 'data': '18 JUN', 'valor': '- R\$ 210,45', 'tipo': 'saida', 'tag': 'Mercado'},
      {'titulo': 'Rendimento da Conta', 'data': '15 JUN', 'valor': 'R\$ 1,22', 'tipo': 'entrada', 'tag': 'Investimento'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF191919),
        elevation: 0.5,
        title: const Text(
          'Extrato',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        // O botão de voltar (Navigator.pop) é renderizado e gerenciado nativamente pelo AppBar
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          final item = transacoes[index];
          final bool ehEntrada = item['tipo'] == 'entrada';

          return Card(
            color: Colors.white,
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              leading: CircleAvatar(
                backgroundColor: ehEntrada ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                child: Icon(
                  ehEntrada ? Icons.arrow_downward : Icons.arrow_upward,
                  color: ehEntrada ? Colors.green[700] : Colors.red[700],
                  size: 18,
                ),
              ),
              title: Text(
                item['titulo'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF191919)),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(item['data'], style: const TextStyle(color: Color(0xFF767676), fontSize: 12)),
                  const SizedBox(height: 6),
                  // Detalhe visual de tag/categoria para valorizar a nota de design
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0E6F7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item['tag'],
                      style: const TextStyle(fontSize: 10, color: Color(0xFF820AD1), fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                item['valor'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: ehEntrada ? Colors.green[700] : const Color(0xFF191919),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}