//
//  ContentView.swift
//  Mariam v2
//
//  Created by Seam Boleslawski on 01.09.23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var menuappear: Bool=true
    @State private var audioPlayer: AVAudioPlayer?
    @State private var menuimage: String="firstscreenbackgroundeay1"
    @State private var imagestate: Int=1
    @State private var imageint: String="1"
    @State private var fix1: Bool=false
    @State private var isSheetPresented = false
    private func loop() {
        audioPlayer = playSong()
    }
    private func imageswap() {
        DispatchQueue.global(qos: .background).async {
            while menuappear {
                if fix1 == false {
                    imagerealswap()
                }
            }
        }
    }
    private func imagerealswap() {
        fix1 = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            // Code to be executed after a 2-second delay
            // Code to be executed after a 2-second delay
            imageint = String(imagestate)
            menuimage = "firstscreenbackgroundeay" + imageint
            if imagestate==41 {
                imagestate=1
            } else {
                imagestate = imagestate + 1
            }
            fix1 = false
        }
    }
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(menuimage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
                        .edgesIgnoringSafeArea(.all)
            VStack {
                Text("OpenMariam")
                    .font(.system(size: 50, weight: .thin))
                    .foregroundColor(.white)
                    .onAppear() {
                        menuappear = true
                        loop()
                        imageswap()
                    }
                    .fullScreenCover(isPresented: $isSheetPresented) {
                        Story()
                    }
                Text("OpenSource and Enhanced")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .thin))
                Text("By.SeanIsTethered")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .thin))
                Text("V.0.1-Indev.1")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .thin))
                Spacer().frame(height: 60)
                Button("Play"){
                    menuappear = false
                    isSheetPresented = true
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(10)
                .opacity(0.7)
                Spacer().frame(height: 20)
                Button("Settings"){
                    
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(10)
                .opacity(0.7)
                Spacer().frame(height: 20)
                Button("About"){
                    
                }
                .frame(width: 200, height: 50)
                .foregroundColor(.white)
                .background(Color.purple)
                .cornerRadius(10)
                .opacity(0.7)
            }
        }
    }
    private func playSong() -> AVAudioPlayer? {
        if let audioUrl = Bundle.main.url(forResource: "sad", withExtension: "mp3", subdirectory: "sounds") {
            do {
                let player = try AVAudioPlayer(contentsOf: audioUrl)
                player.numberOfLoops = -1 // Set the number of loops to -1 for infinite loop (repeat)
                player.prepareToPlay()
                player.play()
                return player
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
        return nil
    }
}

struct Story: View {
    @State private var audioPlayer: AVAudioPlayer?
    //variables about player info
    @State private var name_set: Bool=false
    @State private var name: String="0"
    //important gamestate stuff
    @State private var btn_n: Int=5
    @State private var gamestate: Int=0
    @State private var check: Int=0
    //read values
    @State private var button1: String=""
    @State private var button2: String=""
    @State private var msg: String=""
    @State private var image: String=""
    @State private var sound: String=""
    //opacity stuff :)
    @State private var opacity_group: Double=0.0
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Image(image)
                        .scaledToFill()
                        .opacity(opacity_group)
                        .frame(width: geometry.size.width - 20, height: geometry.size.height / 1.2)
                    if gamestate == 4 {
                        if name_set == false {
                            VStack {
                                TextField("click here", text: $name)
                                    .background(Color.gray)
                                    .foregroundColor(.black)
                                Spacer().frame(height: 50)
                            }
                        }
                    }
                }
                Text(msg)
                    .foregroundColor(.white)
                    .opacity(opacity_group)
                HStack {
                    if button1 == "" {
                        
                    } else {
                        Button(button1) {
                            buttonfunc1()
                        }
                        .frame(width: geometry.size.width / 2.2, height: 100)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .foregroundColor(.pink)
                        .cornerRadius(20)
                        .opacity(opacity_group)
                    }
                    if button2 == "" {
                    } else {
                        Button(button2) {
                            buttonfunc2()
                        }
                        .frame(width: geometry.size.width / 2.2, height: 100)
                        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .foregroundColor(.pink)
                        .cornerRadius(20)
                        .opacity(opacity_group)
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.black)
            .onAppear {
                if check == 0 {
                    gamecheck()
                }
            }
        }
    }
    private func opgrp_hide() {
        print("opgrp_hide executed")
        withAnimation {
            opacity_group=0.0
        }
    }
    private func opgrp_show() {
        print("opgrp_show executed")
        withAnimation {
            opacity_group=1.0
        }
    }
    private func buttonfunc1() {
        print("button1 => button1 press detected")
        print("button1 => turn all noises off")
        stopMusic()
        if gamestate == 21 {
            print("button2 => gamestate 21 detected")
            gamestate = 22
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 18 {
            print("button1 => gamestate 18 detected")
            gamestate = 19
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 14 {
            print("button1 => gamestate 14 detected")
            gamestate = 15
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 13 {
            print("button1 => gamestate 13 detected")
            gamestate = 14
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 12 {
            print("button1 => gamestate 12 detected")
            gamestate = 14
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 8 {
            print("button1 => gamestate 8 detected")
            gamestate = 12
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 11 {
            print("button1 => gamestate 11 detected")
            gamestate = 10
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 6 {
            print("button1 => gamestate 6 detected")
            gamestate = 8
            opgrp_hide()
            gamecheck()
        }
    }
    private func buttonfunc2() {
        print("button2 => button2 press detected")
        print("button2 => turn all noises off")
        stopMusic()
        if gamestate == 23 {
            print("button2 => gamestate 23 detected")
            gamestate = 24
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 21 {
            print("button2 => gamestate 21 detected")
            gamestate = 22
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 20 {
            print("button2 => gamestate 20 detected")
            gamestate = 21
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 19 {
            print("button2 => gamestate 19 detected")
            gamestate = 20
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 18 {
            print("button2 => gamestate 18 detected")
            gamestate = 19
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 17 {
            print("button2 => gamestate 17 detected")
            gamestate = 18
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 16 {
            print("button2 => gamestate 16 detected")
            gamestate = 17
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 15 {
            print("button2 => gamestate 15 detected")
            gamestate = 16
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 14 {
            print("button2 => gamestate 14 detected")
            gamestate = 15
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 13 {
            print("button2 => gamestate 12 detected")
            gamestate = 14
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 12 {
            print("button2 => gamestate 12 detected")
            gamestate = 13
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 9 {
            print("button2 => gamestate 19 detected")
            gamestate = 10
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 8 {
            print("button2 => gamestate 8 detected")
            gamestate = 9
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 7 {
            print("button2 => gamestate 7 detected")
            gamestate = 16
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 6 {
            print("button2 => gamestate 6 detected")
            gamestate = 7
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 5 {
            print("button2 => gamestate 5 detected")
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 4 {
            print("button2 => gamestate 4 detected")
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 3 {
            print("button2 => gamestate 3 detected")
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 2 {
            print("button2 => gamestate 2 detected")
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 1 {
            print("button2 => gamestate 1 detected")
            opgrp_hide()
            gamecheck()
        }
        if gamestate == 11 {
            print("button2 => gamestate 11 detected")
            gamestate = 5
            opgrp_hide()
            gamecheck()
        }
    }
    private func gamecheck() {
        print("gamecheck executed")
        if gamestate < 6 {
            if check == 1 { //addition to gamestate
                print("gamecheck => addition to gamestate")
                gamestate = gamestate + 1
            }
        }
        if gamestate < 7 {
            if gamestate == 0 {
                print("gamecheck => gamestate 0 detected trying to fix...")
                gamestate = 1
                check = 1
            }
            if gamestate == 1 {
                print("gamecheck => gamestate 1 detected")
                image = "ma"
                button1 = ""
                button2 = "OK"
                msg = "My name is Mariam"
                opgrp_show()
            } else if gamestate == 2 {
                print("gamecheck => gamestate 2 detected")
                image = "moon5"
                button1 = ""
                button2 = "OK"
                msg = "Close the light and turn up the volume"
                opgrp_show()
            } else if gamestate == 3 {
                print("gamecheck => gamestate 3 detected")
                image = "moon5"
                button1 = ""
                button2 = "OK"
                msg = "Only for over 12 years old"
                opgrp_show()
            } else if gamestate == 4 {
                print("gamecheck => gamestate 4 detected")
                image = "ma"
                button1 = ""
                button2 = "set name"
                msg = "What is your name?"
                opgrp_show()
            } else if gamestate == 5 {
                print("gamecheck => gamestate 5 detected")
                name_set = true
                image = "ma"
                button1 = ""
                button2 = "OK"
                msg = "I'm lost in this place"
                opgrp_show()
            } else if gamestate == 6 {
                print("gamecheck => gamestate 6 detected")
                image = "hand2"
                button1 = "No"
                button2 = "Yes"
                msg = "Would you like to help me?"
                opgrp_show()
            }
        } else if gamestate > 6 {
            print("executed second layer")
            if gamestate == 7 {
                print("gamecheck => gamestate 7 detected")
                print("gamecheck => detected choseable question")
                print("gamecheck => aperantly answere from button2")
                image = "card0"
                button1 = ""
                button2 = "OK"
                msg = name + " you are a wonderful person"
                opgrp_show()
            }
            if gamestate == 8 {
                print("gamecheck => gamestate 8 detected")
                print("gamecheck => detected choseable question")
                print("gamecheck => aperantly answere from button1")
                image = "moon6"
                button1 = "No"
                button2 = "Yes"
                msg = "You have a hard heart"
                opgrp_show()
                print("gamecheck => setting song name")
                sound = "crying"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
            }
            if gamestate == 9 {
                print("gamecheck => gamestate 8 detected")
                image = "ma"
                button1 = ""
                button2 = "What else?"
                msg = "You must love goodness for all"
                opgrp_show()
            }
            if gamestate == 10 {
                print("gamecheck => gamestate 9 detected")
                print("deadend detected")
                image = "face"
                button1 = ""
                button2 = ""
                msg = "Stay away from me. I am tired.."
                opgrp_show()
                delay(2.0) {
                    print("gamecheck_helper => escaping deadend")
                    gamestate = 11
                    opgrp_hide()
                    gamecheck()
                }
            }
            if gamestate == 11 {
                print("gamecheck => gamestate 11 detected")
                print("gamecheck => detected choseable question")
                image = "ma"
                button1 = "No"
                button2 = "Yes"
                msg = "Do you regretful"
                opgrp_show()
            }
            if gamestate == 12 {
                print("gamecheck => gamestate 12 detected")
                print("gamecheck => detected choseable question")
                image = "ma"
                button1 = "you are a ghost"
                button2 = "I hate you only"
                msg = "do you think I am a ghost?"
                opgrp_show()
            }
            if gamestate == 13 {
                print("gamecheck => gamestate 13 detected")
                print("gamecheck => detected choseable question")
                image = "ma"
                button1 = "You are scary"
                button2 = "No, you are ugly"
                msg = "Why. I love everyone"
                opgrp_show()
            }
            if gamestate == 14 {
                print("gamecheck => gamestate 14 detected")
                print("gamecheck => detected choseable question")
                image = "hand"
                button1 = "OK"
                button2 = "I don't want to"
                msg = "Come and make sure"
                opgrp_show()
            }
            if gamestate == 15 {
                print("gamecheck => gamestate 15 detected")
                print("gamecheck => detected choseable question")
                image = "ma"
                button1 = ""
                button2 = "OK"
                msg = "I have fooled you. I am just a girl"
                print("gamecheck => setting song name")
                sound = "scream"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
            }
            if gamestate == 16 {
                print("gamecheck => gamestate 16 detected")
                image = "ma"
                button1 = ""
                button2 = "OK"
                msg = "My house.. It was here"
                opgrp_show()
            }
            if gamestate == 17 {
                print("gamecheck => gamestate 17 detected")
                image = "card3"
                button1 = ""
                button2 = "OK"
                msg = "So dark, I couldn't see anything"
                print("gamecheck => setting song name")
                sound = "rain"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
            }
            if gamestate == 18 {
                print("gamecheck => gamestate 17 detected")
                image = "ma"
                button1 = "Right side"
                button2 = "Left side"
                msg = "What do you think?"
                opgrp_show()
            }
            if gamestate == 19 {
                print("gamecheck => gamestate 19 detected")
                image = "tree3"
                button1 = ""
                button2 = "OK"
                msg = "Let's go"
                opgrp_show()
            }
            if gamestate == 20 {
                print("gamecheck => gamestate 20 detected")
                image = "moon7"
                button1 = ""
                button2 = "Like what?"
                msg = "while we walk, I would like talking to you"
                print("gamecheck => setting song name")
                sound = "rain"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
            }
            if gamestate == 21 {
                print("gamecheck => gamestate 21 detected")
                image = "ma"
                button1 = "I will do"
                button2 = "YES"
                msg = "The light is on? Are you scared?"
                print("gamecheck => setting song name")
                sound = "heartbeat"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
            }
            if gamestate == 22 {
                print("gamecheck => gamestate 22 detected")
                image = "house1"
                button1 = ""
                button2 = ""
                msg = "We arrived. wait. I will be back in a few seconds"
                print("gamecheck => setting song name")
                sound = "rain"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
                delay(5.0) {
                    print("gamecheck_helper => house scene detected")
                    gamestate = 23
                    stopMusic()
                    opgrp_hide()
                    gamecheck()
                }
            }
            if gamestate == 23 {
                print("gamecheck => gamestate 23 detected")
                image = "ma"
                button1 = "change it"
                button2 = "My real name"
                msg = name + " is your name really or would you change it?"
                opgrp_show()
            }
            if gamestate == 24 {
                print("gamecheck => gamestate 24 detected")
                image = "ma"
                button1 = ""
                button2 = "OK"
                msg = "I told my mother about you"
                print("gamecheck => setting song name")
                sound = "darius"
                print("gamecheck => trying to execute sound on the allready playing sound")
                audioPlayer = playSong()
                opgrp_show()
            }
        }
        print("gamestate = " + String(gamestate))
    }
    private func playSong() -> AVAudioPlayer? {
        if let audioUrl = Bundle.main.url(forResource: sound, withExtension: "mp3", subdirectory: "sounds") {
            do {
                let player = try AVAudioPlayer(contentsOf: audioUrl)
                player.numberOfLoops = 0 // Set the number of loops to -1 for infinite loop (repeat)
                player.prepareToPlay()
                player.play()
                return player
            } catch {
                print("Error playing audio: \(error.localizedDescription)")
            }
        }
        return nil
    }
    private func stopMusic() {
        if let player = audioPlayer {
            if player.isPlaying {
                player.stop()
                // Optionally reset the player to its initial state
                player.currentTime = 0
            }
        }
    }
    func delay(_ seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            closure()
        }
    }
}
