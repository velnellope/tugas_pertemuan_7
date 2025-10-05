import 'package:flutter/material.dart';

void main() => runApp(const InkWellApp());

class InkWellApp extends StatelessWidget {
  const InkWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InkWell Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InkWell Demo'),
          backgroundColor: Colors.pink[100],
        ),
        body: const InkWellDemo(),
      ),
    );
  }
}

class InkWellDemo extends StatefulWidget {
  const InkWellDemo({super.key});

  @override
  State<InkWellDemo> createState() => _InkWellDemoState();
}

class _InkWellDemoState extends State<InkWellDemo> {
  int _tapCount = 0;
  int _doubleTapCount = 0;
  int _longPressCount = 0;
  Color _currentColor = Colors.orange;

  void _handleTap() {
    setState(() {
      _tapCount++;
      _currentColor = Colors.green;
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _doubleTapCount++;
      _currentColor = Colors.orange;
    });
  }

  void _handleLongPress() {
    setState(() {
      _longPressCount++;
      _currentColor = Colors.purple;
    });
  }

  void _resetCounters() {
    setState(() {
      _tapCount = 0;
      _doubleTapCount = 0;
      _longPressCount = 0;
      _currentColor = Colors.orange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // InkWell interactive box
          InkWell(
            onTap: _handleTap,
            onDoubleTap: _handleDoubleTap,
            onLongPress: _handleLongPress,
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.3),
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.touch_app, size: 60, color: Colors.white),
                  SizedBox(height: 15),
                  Text(
                    'Touch Me!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Try different gestures',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Counter cards
          Row(
            children: [
              Expanded(child: _buildCounterCard('Taps', _tapCount, Colors.green)),
              const SizedBox(width: 10),
              Expanded(child: _buildCounterCard('Double Taps', _doubleTapCount, Colors.orange)),
              const SizedBox(width: 10),
              Expanded(child: _buildCounterCard('Long Press', _longPressCount, Colors.purple)),
            ],
          ),

          const SizedBox(height: 30),

          // Reset button
          ElevatedButton.icon(
            onPressed: _resetCounters,
            icon: const Icon(Icons.refresh),
            label: const Text('Reset Counters'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),

          const SizedBox(height: 20),

          // Instructions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gesture Instructions:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text('• Tap: Increment tap counter'),
                Text('• Double Tap: Increment double tap counter'),
                Text('• Long Press: Increment long press counter'),
                Text('• Notice the ripple effect on each interaction!'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterCard(String title, int count, Color color) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
