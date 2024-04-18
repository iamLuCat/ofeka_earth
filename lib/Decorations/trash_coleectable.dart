// import 'package:angola_sustentavel/Decorations/decoration_sprite_sheet.dart';
// import 'package:bonfire/bonfire.dart';

// abstract class TrashCollectablesIcones extends GameDecoration
//     with DragGesture, ObjectCollision {

//   final Vector2 position;
//   final double width;
//   final double height;
//   final Future<Sprite> trashIcon;

//   TrashCollectablesIcones(
//       Vector2 position, double width, double height, Future<Sprite> trashIcon)
//       : super.withSprite(
//           trashIcon,
//           position: position,
//           width: width,
//           height: height,
//         ){}

//   void positionDiference() {}
// }

//Abstract classe - creating a shape

// abstract class Shape { 
//   //declaring propreties  
//   int height;
//   int width;
  
//   //declaring abstract method  
//   void area();    
// }  
// class Rectangle extends Shape{  
//   Rectangle(int a, int b) {
//     height = a;
//     width = b;
//   }
//   // Overriding method 
//   @override 
//   void area() {  
//     print("Area of rectangle is ${height * width}");  
  
//   }  
  
// }  
  
// class Triangle extends Shape{  
   
//   Triangle(int a, int b) {
//     height = a;
//     width = b;
//   }
//   // Overriding method
//   @override
//   void area() {  
//     print("Area of triangle is ${height * width * 0.5}");  
  
//   }  
  
// }  
  
// void main() {  
//   // Creating Object of class Rectangle 
//   Rectangle rect = new Rectangle(6, 3); 
//   // Creating Object of class Triangle  
//   Triangle triangle = new Triangle(21, 6);    
  
//   rect.area();  
//   triangle.area();  
// }  

