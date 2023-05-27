import 'package:grocery_app/features/home/models/product_model.dart';

List<Map<String, dynamic>> groceryProducts = [
  {
    'name': 'Apples',
    'category': 'Fruits',
    'price': 2.99,
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcROfrXmo18Gj6CgTjGXo5ZrL4xPFmwOXJioSGXzKW6pYojo6DkLNnmPMe2rtStXe47DoL_3aiNKl9-mQD1Mr_1O4STpy5Ysxg&usqp=CAE',
  },
  {
    'name': 'Milk',
    'category': 'Dairy',
    'price': 1.99,
    'imageUrl':
        'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQtCmNzK-ZWwvtTf-cbVQBN3rZXp0Ftlmdrqif6li_rN3eywZFXCay1seWBPb5wZEstvXLJnuIqOqDNty_PCTqsILJX5hOWfbmeCrRog3IUxgFL-qoV6mh8&usqp=CAE',
  },
  {
    'name': 'Bread',
    'category': 'Bakery',
    'price': 3.49,
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT48XWFZq25b3Onl46HeevXXFkFHvxaGEvqEA&usqp=CAU',
  },
  {
    'name': 'Eggs',
    'category': 'Dairy',
    'price': 2.49,
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfiO7agvs5Xg3uKg-u0FIahDpYwib8Fj6giA&usqp=CAU',
  },
  {
    'name': 'Chicken',
    'category': 'Meat',
    'price': 6.99,
    'imageUrl':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSklEgYKYnoKCAYNv3xbQGA9ztc1tuy_8iacQ&usqp=CAU',
  },
];

List<Product> cartItems = [];
List<Product> wishlistItems = [];
