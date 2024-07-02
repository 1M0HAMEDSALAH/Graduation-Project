import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kidscontrol/shared/componants/componants.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../choose/choose_screen.dart';

class BoardingModel {

  final String image;
  final String title1;
  final String title2;

  BoardingModel({required this.image, required this.title1, required this.title2} );
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var broadController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/Kids playing with car toys-rafiki.png',
      title1: "Protect Your Child From",
      title2: ' Addition!',

    ),
    BoardingModel(
      image: 'assets/images/Going offline-amico.png',
      title1: 'Provide Your Child A Safe ',
      title2: 'Digital Experience....',

    ),
    BoardingModel(
      image: 'assets/images/Parents-rafiki.png',
      title1: "Help you set dos and don'ts for ",
      title2: 'their online word...',

    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller:broadController ,
          onPageChanged:(int index) {
            if(index == boarding.length-1)
              {
                setState(() {
                  isLast = true;
                });
              }
            else{
              isLast = false;
            }
          },
          itemBuilder: (context, index) => builderBroadingItem(boarding[index]),
            itemCount: boarding.length,),
      ),

      );
  }
  Widget builderBroadingItem(BoardingModel model)=> Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SafeArea(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(height: 100,),
             Container(
               width: 300,
               height: 300,
               child: Image.asset(model.image),
             ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('${model.title1}',
                   style: const  TextStyle(
                     color: defaultColor,
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                     fontFamily: 'Default',
                   ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  Text('${model.title2}',
                   style: const TextStyle(
                     color: defaultColor,
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                     fontFamily: 'Default',
                   ),
                 ),
               ],
             ),
           ],
         ),
        ),
        const Spacer(),
        Center(
          child: SmoothPageIndicator(
              controller: broadController,
              effect:const  ExpandingDotsEffect(
                dotColor:defaultColor,
                expansionFactor: 3,
                dotWidth: 10,
                dotHeight: 10,
                spacing: 5.0,
              ),
              count: boarding.length,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
         const Spacer(),
         isLast ? Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
                      width: 300,
                      height: 50,
                decoration:  BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                      onPressed: (){
                        if(isLast)
                        {
                          navigateAndFinish(context, const ChooseScreen(),);
                        }else
                        {
                          broadController.nextPage(
                            duration:const Duration(milliseconds: 750,
                            ),
                            curve:Curves.fastEaseInToSlowEaseOut,
                          );
                        }
                      },
                child: const Text('Continue',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                  ),
                ),
           ],
         ) :Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: TextButton(
                onPressed: (){
                navigateAndFinish(context, const ChooseScreen(),);

              },
                  child: const Text("Skip",
                    style: TextStyle(
                      fontSize: 25,
                      color:defaultColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Default',
                    ),
                  ),
              ),
            ),
            const Spacer(),
            Container (
                child: FloatingActionButton(
                  backgroundColor:defaultColor,
                  onPressed: (){
                    if(isLast)
                    {
                      navigateAndFinish(context, const ChooseScreen(),);
                    }else
                    {
                      broadController.nextPage(
                        duration:const Duration(milliseconds: 750,
                        ),
                        curve:Curves.fastEaseInToSlowEaseOut,
                      );
                    }
                  },
                  child: const Icon(FontAwesomeIcons.arrowRight,color: Colors.white,),
                ),
              ),
          ],
        ),
      ],
    ),
  );
}

