 import 'package:flutter/material.dart';

class FAQDetailsAppbarWidget extends StatelessWidget {
  final image;
  final title;
  const FAQDetailsAppbarWidget({super.key, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
          child: Image.asset(
            image,
          height: 266,
           width: double.infinity,
            fit: BoxFit.cover,
          )
        ),
        Container(
          padding: const EdgeInsets.only(right: 15, left: 15 ,bottom: 15, top: 50),
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.clear, size: 22, color: Color(0xff1D1B23),),
                ),
              ),
              const Spacer(),
               Text(title, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 22
              ),),
              Spacer(),
              Container(width: 30,),
            ],
          ),
        )
      ],
    );
  }
}
