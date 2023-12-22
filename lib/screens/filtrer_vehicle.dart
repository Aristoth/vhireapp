import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/authentication/login_page.dart';
import 'package:vhireapp/screens/home/home_page.dart';

import '../models/vehicles.dart';

//Filtrage pour l'apk v_hire

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilterScreen(),
    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Vehicle> vehicles = [
    // Ajoutez vos véhicules ici
    Vehicle(
      id: '1',
      agency_id: 'A001',
      brand: 'Toyota',
      model: 'Camry',
      type: 'Sedan',
      price: 25000,
      status: 'Available',
      limit_date: null,
    ),
    Vehicle(
      id: '2',
      agency_id: 'A002',
      brand: 'Honda',
      model: 'Civic',
      type: 'Sedan',
      price: 22000,
      status: 'Rented',
      limit_date: null,
    ),
    Vehicle(
      id: '1',
      agency_id: 'A001',
      brand: 'Toyota',
      model: 'Camry',
      type: 'Sedan',
      price: 25000,
      status: 'Available',
      limit_date: Timestamp.now(),
    ),
    Vehicle(
      id: '2',
      agency_id: 'A002',
      brand: 'Honda',
      model: 'Civic',
      type: 'Sedan',
      price: 22000,
      status: 'Rented',
      limit_date: Timestamp.now(),
    ),
    Vehicle(
      id: '3',
      agency_id: 'A003',
      brand: 'Ford',
      model: 'Fusion',
      type: 'Sedan',
      price: 28000,
      status: 'Available',
      limit_date: Timestamp.now(),
    ),
    // ...
  ];

  double minPrice = 0;
  double maxPrice = 30000;
  String selectedBrand = '';

  List<Vehicle> filteredVehicles() {
    return vehicles.where((vehicle) {
      bool priceInRange = vehicle.price >= minPrice && vehicle.price <= maxPrice;
      bool brandMatches = selectedBrand.isEmpty || vehicle.brand.toLowerCase() == selectedBrand.toLowerCase();
      return priceInRange && brandMatches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrage d\'informations'),
      ),
      body: Column(
        children: [
          // Widget pour la marge de prix
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Min Price: $minPrice'),
                Slider(
                  value: minPrice,
                  min: 0,
                  max: 30000,
                  onChanged: (value) {
                    setState(() {
                      minPrice = value;
                    });
                  },
                ),
                Text('Max Price: $maxPrice'),
                Slider(
                  value: maxPrice,
                  min: 0,
                  max: 30000,
                  onChanged: (value) {
                    setState(() {
                      maxPrice = value;
                    });
                  },
                ),
              ],
            ),
          ),
          // Widget pour la marque du véhicule
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  selectedBrand = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Marque du véhicule',
                hintText: 'Entrez une marque...',
              ),
            ),
          ),
          // Liste filtrée des véhicules
          Expanded(
            child: ListView.builder(
              itemCount: filteredVehicles().length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredVehicles()[index].brand),
                  subtitle: Text('Prix: ${filteredVehicles()[index].price}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}