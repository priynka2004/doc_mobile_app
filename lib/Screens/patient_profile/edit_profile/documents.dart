import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtether_clinic_app/utils/CustomTextField.dart';
import 'package:healtether_clinic_app/utils/customButton.dart';

class Document_Details extends StatefulWidget {
   Document_Details({super.key});

  @override
  State<Document_Details> createState() => _Document_DetailsState();
}

class _Document_DetailsState extends State<Document_Details> {
  String? documentText="Aadhar";
 final TextEditingController _number1controller=TextEditingController(text:"9658 4521 6563 8954" );

final TextEditingController _number2controller=TextEditingController(text: "+91 9865 632142");

final TextEditingController _emailcontroller=TextEditingController(text: "Jana Doe");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:  SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
               const Text(
                "Documents ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 7,),
              Container(
                height: 70,
                color: Color(0xffF5F5F5),
               
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 10,),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    value: documentText,
                    items: ['Aadhar', 'VoterId', 'PanCard']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color:
                                 Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        documentText = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 7,),
              CustomTextField(
                controller: _number1controller,
                hintText: "9658 4521 6563 8954",suffIcon:IconButton(onPressed: (){}, icon: Icon(Icons.minimize_outlined,color: Colors.black,)),),
              const SizedBox(height: 7,),
            
          
              
              TextButton(onPressed: (){}, child: Text("+  Add another ID",style: TextStyle(decoration: TextDecoration.underline,color: Color(0xff009394),fontSize: 16,fontWeight: FontWeight.w700),)),

               const Text(
                "Add Documents ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 7,),
               CustomButton(data: "browse Documents",color:const Color.fromARGB(221, 55, 55, 55),Textcolor: Colors.white,),
               TextButton(onPressed: (){}, child: Text("+  Add other Documnets",style: TextStyle(decoration: TextDecoration.underline,color: Color(0xff009394),fontSize: 16,fontWeight: FontWeight.w700),)),
               const Divider(thickness: 1,color: Colors.grey,),
             const Text(
                "List ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),


              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text((index+1).toString()+" Aadhar card"),
                  
                  Row(
                   
                    children: [IconButton(onPressed: (){}, icon: Icon(Icons.delete)),IconButton(onPressed: (){}, icon: Icon(Icons.image_search_sharp))],)],),);
                },)
            ],
          ),
        ),
      
    );
  }
}