//
//  ZKActivityWidgetLiveActivity.swift
//  ZKActivityWidget
//
//  Created by mac on 2022/11/3.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ZKActivityWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ZKWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            HStack {
                VStack (alignment: .leading){
                    HStack {
                        Image("ic_get_up")
                        Text("Time to get up now")
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "666666"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    Text(timerInterval: context.state.monitorTime,countsDown: false)
                        .fontWeight(.semibold)
                        .font(.system(size: 36))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                Spacer()
                    
                ZStack (alignment: .center){
                    Text("sdsadsadsasa")
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background (Color(hex: "333333",alpha: 0.16))
                    .cornerRadius(22)
                    .border(Color(hex: "333333",alpha: 0.16),width: 0)
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: -30, trailing: 0))
            }.padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
            .activityBackgroundTint(Color(hex: "F7DFC6"))
            .activitySystemActionForegroundColor(nil)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    VStack (alignment: .leading){
                        HStack {
                            Image("ic_in_bed")
                            Text("In bed for")
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "FFFFFF",alpha:0.5))
                        }
                        Text(timerInterval: context.state.monitorTime,countsDown: false)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "FFFFFF"))
                    
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                }
                DynamicIslandExpandedRegion(.trailing) {
                    ZStack (alignment: .center){
                        Text(NSLocalizedString("Stop", comment: ""))
                        .fontWeight(.bold)
                        .font(.system(size: 14))

                    }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing:5))
                    
                }
                DynamicIslandExpandedRegion(.bottom) {
                    // more content
                }
            } compactLeading: {
                Image("ic_in_bed")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            } compactTrailing: {
                Text(timerInterval: context.state.monitorTime,countsDown: false)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            } minimal: {
                Image("ic_in_bed")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.gray)
        }
    }
}


struct SleepInLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ZKWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            ZStack{
                LinearGradient(colors: [Color(hex: "16283B"),Color(hex: "1A3451")], startPoint: .leading, endPoint: .bottom)
                HStack (alignment: .center){
                    VStack (alignment: .leading){
                        HStack {
                            Image("ic_in_bed")
                            Text("In bed for")
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "FFFFFF",alpha:0.5))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                        }
                        Text("07:25").fontWeight(.semibold)
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "FFFFFF"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                        }.padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                    
                    Spacer()
                        
                    ZStack (alignment: .center){
                        CircleView(thickness: 12,width: 84,startAngle: 90,progress:0.3)
                        Text("70%")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(Color(hex: "FFFFFF"))
                    }.padding(EdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20))
                }
            }
            .activityBackgroundTint(Color(hex: "16283B"))
            .activitySystemActionForegroundColor(Color(hex: "1A3451"))
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Image("ic_in_bed")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
