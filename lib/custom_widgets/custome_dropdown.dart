

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../core/constant/colors.dart';
import '../services/theme/theme_controller.dart';



class CustomDropdown extends StatelessWidget {
  final List? list;
  final String? hintText;
  final bool? showSearchBox;
  final bool? darkTheme;
  final String? selectedItem;
  final void Function(dynamic)? onChanged ;
  const CustomDropdown({super.key,this.list,this.hintText,this.onChanged,this.showSearchBox,this.darkTheme,this.selectedItem});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color:darkTheme==true?Colors.black: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color:darkTheme==true?LocalThemes.darkThemeButtonContainerColor :primaryColor, width: 1),
          boxShadow:darkTheme==true?[]: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(0, 1),
            ),
          ]),
      child: DropdownSearch(
        selectedItem: selectedItem,

        dropdownButtonProps:  DropdownButtonProps(
          color:darkTheme==true?LocalThemes.darkThemeButtonContainerColor:AppThemes.lightTheme(context).primaryColor
        ),

        popupProps:  PopupProps.menu(
          fit: FlexFit.loose,
            showSearchBox: showSearchBox??false,
         searchFieldProps: TextFieldProps(
           style: TextStyle(
               color:darkTheme==true?LocalThemes.darkTextColor:LocalThemes.lightTextColor,
               fontFamily: '',
               fontWeight: FontWeight.w300,
               letterSpacing: 0,
               fontSize: 15) ,
           decoration:  InputDecoration(
             hintText: 'Search',
             hintStyle: TextStyle(
                 color:darkTheme==true?LocalThemes.darkTextColor:LocalThemes.lightTextColor,
                 fontFamily: '',
                 fontWeight: FontWeight.w300,
                 letterSpacing: 0,
                 fontSize: 10),
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
          menuProps: const MenuProps(
            backgroundColor: Colors.white,
          )
        ),
        onChanged:onChanged ,
        dropdownDecoratorProps:  DropDownDecoratorProps(
          baseStyle: TextStyle(color: darkTheme==true?Colors.white:LocalThemes.lightTextColor,fontSize: 14,fontWeight: FontWeight.w600) ,
          dropdownSearchDecoration: InputDecoration(
             border: InputBorder.none,
            hintText: hintText,
            counterStyle:  const TextStyle(color: Colors.black54,fontSize: 12,fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.only(left: 8,top: 10),
            hintStyle:TextStyle(
                color:darkTheme==true?LocalThemes.darkTextColor:LocalThemes.lightTextColor,
                fontFamily: '',
                fontWeight: FontWeight.w300,
                letterSpacing: 0,
                fontSize: 15)
          ),
        ),
        items: list??[],
      ),
    );
  }
}
