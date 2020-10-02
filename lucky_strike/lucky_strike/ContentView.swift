//
//  ContentView.swift
//  lucky_strike
//
//  Created by Adam Khalifa on 28/09/2020.
//  Copyright © 2020 Adam Khalifa. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    // Properties
    // ==========
    let midnightBlue = Color(red: 0,
                             green: 0.2,
                             blue: 0.4)
    
    // User interface views
    @State var score  = 0
    @State var round = 1
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    //computed methods
    var sliderValueRounded: Int {
        return Int(sliderValue.rounded())
    }
    var sliderTargetDifference: Int {
        abs(self.sliderValueRounded - self.target)
        
    }
    
    
    // User interface content and layout
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Target row
                // ===========================================
                HStack {
                    Text("Put the bullseye as close as you can to:")
                        .modifier(TextStyle())
                    Text("\(self.target)")
                        .modifier(ValueStyle())
                }
                
                //#1 spacer
                Spacer()
                
                // Slider row
                //============================================
                HStack {
                    Text("1")
                        .modifier(TextStyle())
                    Slider(value: self.$sliderValue, in: 1...100)
                        .accentColor(Color.green)
                    Text("100")
                        .modifier(TextStyle())
                }
                //#2 spacer
                Spacer()
                
                // Button row
                //============================================
                Button(action: {
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                        .modifier(ButtonBigTextStyle())
                    
                }
                .background(Image("Button")
                .modifier(Shadow())                )
                .alert(isPresented: self.$alertIsVisible) {
                    Alert(title: Text(alertTitle()),
                          message: Text(self.scoringMessage()),
                          dismissButton: .default(Text("Awesome!")){
                            self.startNewRound()
                            
                        })
                    
                }
                
                Spacer()
                
                // Score row
                //============================================
                HStack {
                    Button(action: {self.StartNewGame()
                        
                    }) {
                        HStack{
                            Image("StartOverIcon")
                            Text("Start over")
                                .modifier(ButtonSmallTextStyle())
                                .modifier(Shadow())
                        }
                    }
                    .background(Image("Button")
                    .modifier(Shadow())
                    )
                    Spacer()
                    
                    //Score View
                    //============================================
                    Text("Score:")
                        .modifier(TextStyle())
                    Text("\(self.score)")
                        .modifier(ValueStyle())
                    Spacer()
                    //Rounds view
                    //============================================
                    Text("Round")
                        .modifier(TextStyle())
                    Text("\(self.round)")
                        .modifier(ValueStyle())
                    
                    Spacer()
                    //Info Button
                    //============================================
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image("InfoIcon")
                            Text("Info").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button")
                        
                    .modifier(Shadow())
                    )
                }
                .padding(.bottom, 20)
                .accentColor(midnightBlue)
            }
            .onAppear() {
                self.StartNewGame()
            }
            .background(Image("Background"))
         
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
    
    
    
    
    
    
    
    
    
    
    // Methods
    // =======
    
    func pointsForCurrentRound() -> Int {
        let maxScore: Int = 100
        
        let points: Int
        
        if self.sliderTargetDifference == 0  {
            points = 200
        } else if self.sliderTargetDifference == 1 {
            points = 150
        } else {
            points = maxScore - self.sliderTargetDifference
        }
        return points
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(self.sliderValueRounded).\n" +
            "The target value is \(self.target).\n" +
        "You scored \(self.pointsForCurrentRound()) points this round."
    }
    func alertTitle() -> String {
        
        let title: String
        if self.sliderTargetDifference == 0 {
            title = "Perfect!"
        }else if self.sliderTargetDifference < 5 {
            title = "You almost had it!"
        }else if self.sliderTargetDifference <= 10{
            title = "not bad"
            
        }else{
            title = "Are you even trying?!"
        }
        return title
    }
    func StartNewGame(){
        self.score = 0
        self.round = 1
        self.sliderValue = 50.0
        randomizeTargetAndSlider()
    }
    func startNewRound () {
        self.score = self.score + self.pointsForCurrentRound()
        randomizeTargetAndSlider()
        self.round = self.round + 1
    }
    func randomizeTargetAndSlider(){
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
    }
    
}




//view modifier
//=============

struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 18 ))
            .foregroundColor(Color.white)
    }
    
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(Color.black)
        
    }
    
}

struct ButtonBigTextStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Rounded MT Bold", size: 22))
            .foregroundColor(Color.black)
            .shadow(color: Color.yellow, radius: 3, x: 2, y: 2)
    }
}


// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

