//
//  CircleWidget.swift
//  TestLiveActivity
//
//  Created by mac on 2022/11/4.
//

import Foundation
import SwiftUI

struct CircleView: View {

    var thickness: CGFloat = 12.0
    var width: CGFloat = 84.0
    var startAngle = -90.0
    @State var progress = 0.0

    var body: some View {
        VStack {
            ZStack {

                // 外环
                Circle()
                    .stroke(Color(hex: "FFFFFF",alpha: 0.08), lineWidth: thickness)
                // 内环
                RingShape(progress: progress, thickness: thickness)
                    .fill(Color(hex: "9769FA"))
            }
            .frame(width: width, height: width, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}

// 内环
struct RingShape: Shape {
    var progress: Double = 0.0
        var thickness: CGFloat = 12.0
        var startAngle: Double = -90.0

        var animatableData: Double {
            get { progress }
            set { progress = newValue }
        }

        func path(in rect: CGRect) -> Path {

            var path = Path()

            path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0), radius: min(rect.width, rect.height) / 2.0,startAngle: .degrees(startAngle),endAngle: .degrees(360 * progress + startAngle), clockwise: false)

            return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
        }
}
