import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_Content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {// enums
  male,
  female,
}

class InputPage extends StatefulWidget {// mutable
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;

  /*
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  //1=male , 2=female
  void updateColour(Gender selectedGender){

    if(selectedGender == Gender.male){
      if(maleCardColour == inactiveCardColor){
        maleCardColour = color;
        femaleCardColour = inactiveCardColor;
      }else{
        maleCardColour = inactiveCardColor;
      }
    }

    if(selectedGender == Gender.female){
      if(femaleCardColour == inactiveCardColor){
        femaleCardColour = color;
        maleCardColour = inactiveCardColor;
      }else{
        femaleCardColour = inactiveCardColor;
      }
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(//extraction used
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male ? color : inactiveCardColor,//ternary operator
                      cardChild: IconContent(font: FontAwesomeIcons.mars,text: "MALE"),
                    ),
                  ),

                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female ? color : inactiveCardColor,//ternary operator
                      cardChild: IconContent(font: FontAwesomeIcons.venus,text: "FEMALE"),
                    ),
                  ),
                ],
          )),
          Expanded(
            child: ReusableCard(
              colour: color,
              cardChild: Column(

                mainAxisAlignment: MainAxisAlignment.center,//vertical

                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,//horizontal
                    crossAxisAlignment: CrossAxisAlignment.baseline,//will align elements along baseline
                    textBaseline: TextBaseline.alphabetic,//necessary for use of crossAxis Alignment
                    children: <Widget>[
                      Text(
                        height.toString(),//Text need string
                        style: NumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(//for configuring the slider
                    data: SliderTheme.of(context).copyWith(//shorter way of assigning SliderThemeData values
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),

                    child: Slider(
                        value: height.toDouble(),//starting value of slider
                        min: 120.0,//minimum value of slider
                        max: 220.0,//maximum value of slider
                        onChanged: (double newValue){// newValue is the new value of slider
                          setState(() {
                            height = newValue.round();//need's to rebuild the parent widget
                          });
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: ReusableCard(
                      colour: color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: NumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                  ),
            );
          },
          ),
        ],
      ),

      /*floatingActionButton: Theme(//Theme widget will customize the specfic widget of floatingActionButton
        data: ThemeData(colorScheme: ColorScheme(primary: Colors.purple, primaryVariant: Colors.purple, secondary: Colors.purple, secondaryVariant: Colors.purple, surface: Colors.purple, background: Colors.purple, error: Colors.purple, onPrimary: Colors.purple, onSecondary: Colors.purple, onSurface: Colors.purple, onBackground: Colors.purple, onError: Colors.purple, brightness: Brightness.dark)),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ), */
    );
  }
}




//creating custom widgets from scrach using the idea of composition
//read internal docs to understand



