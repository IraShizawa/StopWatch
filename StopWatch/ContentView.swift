//
//  ContentView.swift
//  StopWatch
//
//  Created by Shizawa Ira on 2026/08/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer: Timer!
    @State private var secondElapsed: Double = 0.0
    @State private var isRunnning = false
    var body: some View {
        VStack {
            Text(String(format: "%.2f", secondElapsed))
                .font(.title)
            HStack{
                if isRunnning{
                    Button{
                        pause()
                    }label:{
                        Image(systemName: "pause.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .clipShape(.circle)
                    }
                } else {
                    Button{
                        start()
                    }label: {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .clipShape(.circle)
                    }
                }
                
                if secondElapsed != 0.0 {
                    Button{
                        stop()
                    }label:{
                        Image(systemName: "stop.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .clipShape(.circle)
                    }
                    
                }
            }
            
        }
        .padding()
    }
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
            secondElapsed += 0.1
        }
        isRunnning = true
    }
    
    func pause(){
        timer.invalidate()
        isRunnning = false
        
    }
    
    func stop(){
        timer.invalidate()
        isRunnning = false
        secondElapsed = 0
    }
}

#Preview {
    ContentView()
}
