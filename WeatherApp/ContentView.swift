//
//  ContentView.swift
//  WeatherApp
//
//  Created by Youssif Hany on 27/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight=false
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .white)
            VStack{
                CityView(cityName: "Cairo, EG")
                
                MainWeatherView(image: isNight ? "moon.fill" :"cloud.sun.fill", temp: 20)
                
                HStack(spacing: 30){
                    WeatherDayView(
                        dayOfWeek: "SUN",
                        image: "smoke.fill",
                        temp:20)
                    
                    WeatherDayView(
                        dayOfWeek: "MON",
                        image: "cloud.sun.fill",
                        temp:18)
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        image: "sun.max.fill",
                        temp:23)
                    
                    WeatherDayView(
                        dayOfWeek: "WED",
                        image: "sun.max.fill",
                        temp:22)
                    
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        image: "cloud.rain.fill",
                        temp:16)
                }.padding()
                
                Spacer()
                
                Button {
                    isNight.toggle()
                }label:{
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backColor: .white)
                }
            }
            
            .padding(.bottom,80)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek:String
    var image:String
    var temp:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size:20,weight: .medium))
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height:40)
            Text("\(temp)°")
                .font(.system(size: 20,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor:Color
    var bottomColor:Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .foregroundColor(.white)
            .font(.system(size: 32,weight: .medium))
            .padding()
    }
}

struct MainWeatherView: View {
    
    var image:String
    var temp:Int
    
    var body: some View {
        VStack(spacing:10){
            Image(systemName: image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButtonView: View {
    
    var title:String
    var textColor:Color
    var backColor:Color
    
    var body: some View {
        Text(title)
            .frame(width:280,height: 50)
            .background(backColor)
            .foregroundColor(textColor)
            .font(.system(size: 20,weight: .bold))
            .cornerRadius(10)
    }
}
