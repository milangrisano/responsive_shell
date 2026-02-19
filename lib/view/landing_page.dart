import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Colors
  final Color _backgroundColor = const Color(0xFF1E1E1E); // Dark background
  final Color _panelColor = const Color(0xFF2C2C2C); // Slightly lighter for panels
  final Color _goldColor = const Color(0xFFD4AF37); // Gold accent

  // Data for mockup
  final List<Map<String, dynamic>> _activeOrders = [
    {'id': '710092021', 'name': 'Marrika Cocino', 'status': 'Selected'},
    {'id': '710092074', 'name': 'Gnocchi alla Torrentina', 'status': 'Cooking'},
    {'id': '710092025', 'name': 'Brasab Bazolo', 'status': 'Ready'},
  ];

  int _selectedOrderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // LEFT PANEL - Active Orders
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: _panelColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    // Tabs
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTabItem('Para Llevar', true),
                          _buildTabItem('Mesas', false),
                          _buildTabItem('Barra', false),
                          _buildTabItem('Delivery', false),
                        ],
                      ),
                    ),

                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Active Takeaway Orders',
                          style: GoogleFonts.outfit(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),

                    // Order List
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _activeOrders.length,
                        itemBuilder: (context, index) {
                          final order = _activeOrders[index];
                          final isSelected = index == _selectedOrderIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOrderIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: isSelected 
                                    ? _goldColor.withOpacity(0.15) 
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: isSelected 
                                    ? Border.all(color: _goldColor.withOpacity(0.5)) 
                                    : Border.all(color: Colors.white10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        order['id'],
                                        style: GoogleFonts.outfit(
                                          color: isSelected ? _goldColor : Colors.white54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        order['name'],
                                        style: GoogleFonts.outfit(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isSelected)
                                    const Icon(Icons.circle, color: Color(0xFFD4AF37), size: 12),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // New Order Button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _goldColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'New Order',
                            style: GoogleFonts.outfit(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(width: 16),

            // RIGHT PANEL - Order Details
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: _panelColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Details',
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '7:31 PM',
                            style: GoogleFonts.outfit(
                              color: _goldColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.white10, height: 1),

                    // Customer Name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: Row(
                        children: [
                          Text(
                            'Customer Name: ',
                            style: GoogleFonts.outfit(color: Colors.white54),
                          ),
                          Text(
                            'Juan Pérez',
                            style: GoogleFonts.outfit(color: _goldColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    // Items List
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildOrderItem('1', 'Pizza Margherita', '\$16.00', Icons.local_pizza),
                          _buildOrderItem('2', 'Spaghetti Carbonara', '\$36.00', Icons.dinner_dining),
                          _buildOrderItem('1', 'Tiramisu', '\$10.00', Icons.cake),
                        ],
                      ),
                    ),

                    // Summary
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.black12,
                      child: Column(
                        children: [
                          _buildSummaryRow('Subtotal:', '\$81.00'),
                          const SizedBox(height: 8),
                          _buildSummaryRow('Tax (9%):', '\$4.88', isMuted: true),
                          const Divider(color: Colors.white10, height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: GoogleFonts.outfit(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '\$65.88',
                                style: GoogleFonts.outfit(
                                  color: _goldColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Pay Button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _goldColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'PAY',
                            style: GoogleFonts.outfit(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? _goldColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          color: isSelected ? Colors.black87 : Colors.white70,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildOrderItem(String qty, String name, String price, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(8),
              image: null, // Placeholder for image
            ),
            child: Icon(icon, color: Colors.white54),
          ),
          const SizedBox(width: 12),
          Text(
            qty,
            style: GoogleFonts.outfit(color: _goldColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
            ),
          ),
          Text(
            price,
            style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isMuted = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            color: isMuted ? Colors.white38 : Colors.white54,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}