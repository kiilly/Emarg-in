//set constant configuration

import 'package:flutter/material.dart'

class config{ 
    static MediaQueryData? MediaQueryData;
    static double? screenWidth;
    static double? screenHeight;

    void init(BuildContext context){
        MediaQueryData = MediaQueryData.of(context);
        screenWidth = MediaQueryData!.size.width;
        screenHeight = MediaQueryData!.size.height;

    }


static get widthSize{
    return screenWidth;
}

static get heightSize{
    return screenHeight;
}

//defining space height

static const spaceSmall = sizedBox(height: 25,);
static final spaceMedium = sizedBox(height: screenHeight! * 0.05,);
static final spaceBig = sizedBox(height: screenHeight! * 0.08,);

//text field border
static const outlinedBorder = OutlinedBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
);
static const focusBorder = OutlinedBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
        color: Colors.greenAccent,
    ));
static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
        color: Colors.red,
    ));  //BorderSide   //OutlineInputBorder
    
    static const primaryColor = Colors.greenAccent;
}
