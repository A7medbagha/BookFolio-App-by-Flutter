import 'package:bookapp/Core/Functions/CustomLauncherUrl.dart';
import 'package:bookapp/Features/Home/Data/models/books_model/books_model.dart';
import 'package:bookapp/Features/Home/presentation/views/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class CustomButtonAction extends StatelessWidget {
  const CustomButtonAction({super.key, required this.booksModel});
  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Row(
        children: [
          const Expanded(
            child: CustomBookButton(
              text: "Free",
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomBookButton(
              onPressed: (){
                customUrlLauncher(context, booksModel.volumeInfo.previewLink);
              },
              text: getText(booksModel),
              backgroundColor: const Color.fromARGB(255, 228, 159, 56),
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }
  
 String getText(BooksModel booksModel) {
  if(booksModel.volumeInfo.previewLink == null){
    return 'No Preview';
  }else{
    return 'Preview';
  }
 }
}
