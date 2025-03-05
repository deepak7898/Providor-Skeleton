

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../services/theme/theme_controller.dart';



class CustomDropdown extends StatelessWidget {
  final List? list;
  final String? hintText;
  final bool? showSearchBox;
  final void Function(dynamic)? onChanged ;
  const CustomDropdown({super.key,this.list,this.hintText,this.onChanged,this.showSearchBox});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppThemes.lightTheme(context).primaryColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.7),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 2),
            ),
          ]),
      child: DropdownSearch(
        dropdownButtonProps: const DropdownButtonProps(
          color: Colors.blue
        ),

        popupProps:  PopupProps.menu(
          fit: FlexFit.loose,
            showSearchBox: showSearchBox??false,
         searchFieldProps: TextFieldProps(
           style:const TextStyle(color: Colors.black54,fontSize: 13,fontWeight: FontWeight.w500)  ,
           decoration:  InputDecoration(
             hintText: 'Search',
             hintStyle: const TextStyle(color: Colors.black54,fontSize: 17,fontWeight: FontWeight.w500),
             contentPadding: const EdgeInsets.only(bottom: 5,left: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
             borderSide:  const BorderSide(color: Colors.blue,style: BorderStyle.solid,width: 1),
            ),
             suffixIcon: const Icon(Icons.search,color: Colors.blue,size: 16,),
             constraints: BoxConstraints(
               maxHeight: size.height*0.05
             ),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(5),
                   borderSide:  const BorderSide(color: Colors.blue,style: BorderStyle.solid,width: 1),
             ),

           )
         ),

         // itemBuilder: (context, item, isSelected) {
         //   return Align(
         //     alignment: Alignment.centerLeft,
         //     child: Padding(
         //       padding:  EdgeInsets.only(left: kPaddingForBox,top:kPaddingForBox,bottom: kPaddingForBox ),
         //       child: CustomText(
         //         text: '$item',
         //         fontSize: 14,
         //         fontWeight: FontWeight.w600,
         //
         //       ),
         //     ),
         //   );
         // },
          menuProps: const MenuProps(
            backgroundColor: Colors.white,
          )
        ),

        onChanged:onChanged ,
        dropdownDecoratorProps:  DropDownDecoratorProps(
          baseStyle:const TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600) ,
          dropdownSearchDecoration: InputDecoration(
             border: InputBorder.none,
            hintText: hintText,
            counterStyle:  const TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.only(left: 8,top: 10),
            hintStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: '',
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                fontSize: 17)
          ),
        ),
        items: list??[],
      ),
    );
  }
}
