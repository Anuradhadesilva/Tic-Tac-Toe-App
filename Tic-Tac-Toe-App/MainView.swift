//
//  MainView.swift
//  Tic-Tac-Toe-App
//
//  Created by Anuradha Desilva on 08/03/2024.
//

import SwiftUI

struct MainView: View {
    @State var array = ["","","","","","","","",""]
    @State var count = 0
    @State private var selectedButton:Int?
    let winningSequences = [
           // Horizontal rows
           [0, 1, 2], [3, 4, 5], [6, 7, 8],
           // Diagonals
           [0, 4, 8], [2, 4, 6],
           // Vertical rows
           [0, 3, 6], [1, 4, 7], [2, 5, 8],
       ]
    var body: some View {
        VStack{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)){
                ForEach(0...8, id: \.self){ index in
                    VStack{
                        Button{
                            if count == 0 {
                                array[index] = "X"
                                count += 1
                            }
                            else if count == 1 {
                                array[index] = "O"
                                count -= 1
                            }
                            checkForWin()
                        }label:{
                            ZStack{
                                Rectangle()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    .foregroundColor(.white)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 5)
                                    .cornerRadius(8.0)
                                Text(array[index])
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                            }
                            .padding(1)
                        }
                        .disabled(array[index] == "X" || array[index] == "O")
                        
                    }
                }
            }
        }
        .padding(.horizontal,20)
    }
    func checkForWin() {
        for sequence in winningSequences {
            let first = array[sequence[0]]
            let second = array[sequence[1]]
            let third = array[sequence[2]]
            if !first.isEmpty && first == second && second == third {
                
                print("\(first) wins!")
                // Add your logic for winning state here
                return
            }
        }
    }
}

#Preview {
    MainView()
}
