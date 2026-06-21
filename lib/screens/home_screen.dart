import 'package:flutter/material.dart';
import 'package:banco_digital/screens/extrato_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Paleta de Cores de Alta Fidelidade Visual
  static const Color corPrimaria = Color(0xFF820AD1);
  static const Color corTextoEscuro = Color(0xFF191919);
  static const Color corTextoCinza = Color(0xFF767676);

  // Estado para controle de visibilidade do saldo (métrica de usabilidade)
  bool _saldoVisivel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: corPrimaria,
        elevation: 0,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Olá, Jovem Aprendiz',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Conta • Agência 0001 • CC 98765-4',
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_saldoVisivel ? Icons.visibility_outlined : Icons.visibility_off_outlined),
            color: Colors.white,
            onPressed: () {
              setState(() {
                _saldoVisivel = !_saldoVisivel;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.account_circle_outlined, color: Colors.white, size: 28),
          ),
        ],
      ),
      
      // Métrica de Layout: Área de Rolagem Vertical Global
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CARD 1: SALDO DA CONTA
              Card(
                color: Colors.white,
                elevation: 0.5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Saldo disponível',
                        style: TextStyle(color: corTextoCinza, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _saldoVisivel ? 'R\$ 3.842,50' : '••••',
                        style: const TextStyle(color: corTextoEscuro, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      
                      // Métrica de Navegação: Navigator.push
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: corPrimaria,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ExtratoScreen()),
                          );
                        },
                        icon: const Icon(Icons.receipt_long, size: 18),
                        label: const Text('Acessar Extrato', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // SEÇÃO: ROLAGEM HORIZONTAL (Ações Rápidas)
              const Text(
                'Ações rápidas',
                style: TextStyle(color: corTextoEscuro, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildBotaoAcao(Icons.pix_outlined, 'Área Pix'),
                    _buildBotaoAcao(Icons.qr_code_scanner_outlined, 'Pagar'),
                    _buildBotaoAcao(Icons.swap_horiz_outlined, 'Transferir'),
                    _buildBotaoAcao(Icons.phone_android_outlined, 'Recargas'),
                    _buildBotaoAcao(Icons.trending_up_outlined, 'Investir'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // CARD 2: DETALHES DO CARTÃO DE CRÉDITO (Novo detalhe de fidelidade visual)
              Card(
                color: Colors.white,
                elevation: 0.5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.credit_card, color: corPrimaria),
                          SizedBox(width: 8),
                          Text('Cartão de Crédito', style: TextStyle(color: corTextoEscuro, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Fatura atual', style: TextStyle(color: corTextoCinza, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text(
                        _saldoVisivel ? 'R\$ 640,22' : '••••',
                        style: const TextStyle(color: Color(0xFF0073E6), fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text('Limite disponível: R\$ 4.359,78', style: TextStyle(color: corTextoCinza, fontSize: 12)),
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

  // Widget utilitário para modularizar os botões da Home
  Widget _buildBotaoAcao(IconData icone, String rotulo) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFF0E6F7),
            foregroundColor: corPrimaria,
            child: Icon(icone, size: 24),
          ),
          const SizedBox(height: 8),
          Text(rotulo, style: const TextStyle(color: corTextoEscuro, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}