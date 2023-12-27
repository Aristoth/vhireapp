import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sélection de Plage de Prix'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtrage de prix',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  PriceSearchBar(label: 'Min'),
                  SizedBox(width: 16.0),
                  PriceSearchBar(label: 'Max'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceSearchBar extends StatefulWidget {
  final String label;

  const PriceSearchBar({Key? key, required this.label}) : super(key: key);

  @override
  _PriceSearchBarState createState() => _PriceSearchBarState();
}

class _PriceSearchBarState extends State<PriceSearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0, // Ajustez la largeur selon vos besoins
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          // Vous pouvez traiter la valeur ici si nécessaire
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: '${widget.label} Price',
          hintText: 'Enter ${widget.label} Price',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
