import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/models/cart.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.notes, required this.cart});
  
  final Note notes;
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotePage(note: notes, cart: cart),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(205, 255, 255, 255),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: const Color.fromARGB(115, 255, 255, 255),
              width: 4.0,
            ),
          ),
          width: double.infinity,
          constraints: const BoxConstraints(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    notes.title,
                    style: const TextStyle(fontSize: 34, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                const SizedBox(height: 2), // Уменьшено расстояние
                Image(
                  image: AssetImage(notes.photo_id),
                  height: 600,
                ),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    'Цена: ${notes.price} ₽',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                const SizedBox(height: 20), // Увеличиваем пространство
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150, // Фиксированная ширина кнопки
                      height: 50, // Фиксированная высота кнопки
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotePage(note: notes, cart: cart),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey, // Цвет фона кнопки "Купить сейчас"
                          foregroundColor: Colors.white, // Цвет текста кнопки
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Закругленные углы
                          ),
                        ),
                        child: const Text('Купить сейчас'),
                      ),
                    ),
                    const SizedBox(width: 10), // Разделение между кнопками
                    SizedBox(
                      width: 150, // Фиксированная ширина кнопки
                      height: 50, // Фиксированная высота кнопки
                      child: ElevatedButton(
                        onPressed: () {
                          cart.addItem(notes); // Добавление товара в корзину
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Вы добавили в корзину ${notes.title} за ${notes.price}')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow, // Цвет фона кнопки "Добавить в корзину"
                          foregroundColor: Colors.black, // Цвет текста кнопки
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Закругленные углы
                          ),
                        ),
                        child: const Text(
                          'В корзину',
                          style: TextStyle(fontSize: 16), // Уменьшение размера текста
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
