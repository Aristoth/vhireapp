import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vhireapp/models/vehicles.dart';

void main() {
  // Exemple de liste de véhicules
  List<Vehicle> vehicles = [
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
    // Ajoutez d'autres véhicules selon vos besoins
  ];

  // Affichage des informations des véhicules
  vehicles.forEach((vehicle) {
    print('ID: ${vehicle.id}');
    print('Agency ID: ${vehicle.agency_id}');
    print('Brand: ${vehicle.brand}');
    print('Model: ${vehicle.model}');
    print('Type: ${vehicle.type}');
    print('Price: ${vehicle.price}');
    print('Status: ${vehicle.status}');
    print('Limit Date: ${vehicle.limit_date?.toDate()}');
    print('\n');
  });
}