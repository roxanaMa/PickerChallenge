//
//  ContentView.swift
//  Picker Challenge
//
//  Created by Roxy Mardare on 01.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    let cities = ["Bucharest","Iasi","Craiova", "Targul Jiu", "Brasov", "Valsui"]
    let recipes = ["Colcannon Potatoes", "Irish Spiced Beef", "Scottish Oatmeal Rolls","Almond Tea Bread", "English Rhubarb Crumble", "Crispy Fish & Chips", "Chicken Soup"]
    let deliveryOption = ["5pm","6pm", "7pm", "8pm","9pm"]
    
    @State var selectedCity = 0
    @State var food = 1
    @State var time = 2
    
    var body: some View {
        
        VStack (spacing: 50){
            
            Text("Ottimo Ristorante")
                .fontWeight(.semibold)
                .font(.title)
            
            HStack{
                Picker("Location:", selection: $selectedCity) {
                    
                    ForEach (0..<cities.count){index in
                        Text (cities[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Text(cities[selectedCity])
                    .padding(.leading, 20)
            }
           
            Text ("Order:")
                .fontWeight(.semibold)
            
            Picker("Menu", selection: $food) {
                ForEach(0..<recipes.count){index in
                    Text(recipes[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Text("Pickup time:")
                .fontWeight(.semibold)
            
            Picker("Pickup time", selection: $time) {
                ForEach(0..<deliveryOption.count){index in
                    Text(deliveryOption[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Button("Pick for me!") {
                selectedCity = Int.random (in: 0..<cities.count)
                food = Int.random (in: 0..<recipes.count)
                time = Int.random (in: 0..<deliveryOption.count)
            }
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
