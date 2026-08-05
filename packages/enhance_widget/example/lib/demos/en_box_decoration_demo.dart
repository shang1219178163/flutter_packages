import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

class EnBoxDecorationDemo extends StatelessWidget {
  const EnBoxDecorationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnBoxDecoration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Outer + inner box shadows',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            alignment: Alignment.center,
            decoration: EnBoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 0),
                  color: Colors.red,
                ),
              ],
              innerBoxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 0),
                  color: Colors.blue,
                ),
              ],
            ),
            child: const Text('EnBoxDecoration'),
          ),
          const SizedBox(height: 32),
          Text(
            'Circle + inner shadow',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              decoration: const EnBoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black26,
                  ),
                ],
                innerBoxShadow: [
                  BoxShadow(
                    blurRadius: 18,
                    color: Colors.orange,
                  ),
                ],
              ),
              child: const Text('circle'),
            ),
          ),
        ],
      ),
    );
  }
}
