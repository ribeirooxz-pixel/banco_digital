import 'package:flutter/material.dart';
import 'extrato_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const Color corPrimaria   = Color(0xFF6A1B9A); // Roxo escuro institucional
  static const Color corSecundaria = Color(0xFFE1BEE7); // Roxo claro para detalhes
  static const Color corFundo      = Color(0xFFF3E5F5); // Fundo lilás bem suave
  static const Color corTexto      = Color(0xFF4A148C); // Roxo muito escuro para leitura

  // visibilidade do saldo
  bool _saldoVisivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      
      appBar: AppBar(
        backgroundColor: corPrimaria,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá Lilia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Agência 0001 • Conta 12345-6', style: TextStyle(fontSize: 12, color: corSecundaria)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_saldoVisivel ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _saldoVisivel = !_saldoVisivel;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Área da Conta e Saldo
              Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Conta', style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.w500)),
                          Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _saldoVisivel ? 'R\$ 2.450,85' : '••••',
                        style: TextStyle(
                          fontSize: 26, 
                          fontWeight: FontWeight.bold, 
                          color: corTexto,
                          letterSpacing: _saldoVisivel ? 0 : 4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Botão para ir ao Extrato
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: corPrimaria,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          // Chamada obrigatória do Navigator.push para empilhar a tela
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ExtratoScreen()),
                          );
                        },
                        icon: const Icon(Icons.receipt_long_outlined, size: 20),
                        label: const Text('Ver Extrato Completo', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // SEÇÃO: Ações Rápidas
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBotaoAcao(Icons.pix, 'Área Pix'),
                    _buildBotaoAcao(Icons.qr_code_scanner, 'Pagar'),
                    _buildBotaoAcao(Icons.phone_android, 'Recarga'),
                    _buildBotaoAcao(Icons.monetization_on_outlined, 'Transferir'),
                    _buildBotaoAcao(Icons.trending_up, 'Investir'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // CARD SECUNDÁRIO: Cartão de Crédito
              Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: corPrimaria),
                          const SizedBox(width: 8),
                          Text('Meus cartões', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para estruturar os botões redondos de ação rápida
  Widget _buildBotaoAcao(IconData icone, String rotulo) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            foregroundColor: corPrimaria,
            child: Icon(icone, size: 24),
          ),
          const SizedBox(height: 8),
          Text(rotulo, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[800])),
        ],
      ),
    );
  }
}