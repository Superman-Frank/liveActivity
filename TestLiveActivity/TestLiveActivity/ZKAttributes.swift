//
//  ZKAttributes.swift
//  TestLiveActivity
//
//  Created by mac on 2022/11/3.
//

import Foundation
import ActivityKit


struct ZKWidgetAttributes: ActivityAttributes {
    
    public typealias ZKWidgetState = ContentState
    
    public struct ContentState: Codable, Hashable {
        //参数，当前的监测时间
        var monitorTime: ClosedRange<Date>
        var sleepProgress: Double
        var activityType: Bool
    }
    
    var sleepGoal: Double
    
}

@available(iOS 16.1, *)
public class ZkActivityManager : NSObject{
    
    var timer: Timer?
    
    var sleepTime: Int = 0
    
    static var progress: Double = 0.0
    
    var StartDate: Date = Date()
    
    static let defaultManager: ZkActivityManager = ZkActivityManager()
    
    @objc public class func defaultManage() -> ZkActivityManager
    {
        return ZkActivityManager.defaultManager
    }
        
    @objc public func startActivity(sleepGoal:Int,currentDate:Date,type:Bool){
        self.startTimer()
        
        let attributes = ZKWidgetAttributes(sleepGoal: Double(sleepGoal))
        
        let initialConetntState = ZKWidgetAttributes.ZKWidgetState(monitorTime: StartDate...Date().addingTimeInterval(12 * 60 * 60 ),sleepProgress: ZkActivityManager.progress, activityType: type)
        
        do {
            let activity = try Activity<ZKWidgetAttributes>.request(attributes: attributes, contentState: initialConetntState, pushType: nil)
            print("Requested a pizza delivery Live Activity \(activity.id)")
        } catch (let error) {
            print("Error requesting pizza delivery Live Activity \(error.localizedDescription)")
        }
        
    }
    
    @objc public func updateActivity(currentDate:Date,type:Bool){
        self.updateCircle()
        print("更新了\(ZkActivityManager.progress)")
        Task {
            let updateStatus = ZKWidgetAttributes.ZKWidgetState(monitorTime: currentDate...Date().addingTimeInterval(1 * 60),sleepProgress:Double(ZkActivityManager.progress), activityType: type)
            
            for activity in Activity<ZKWidgetAttributes>.activities{
                await activity.update(using: updateStatus)
            }
        }
    }
   
    @objc public func stopActivity (){
        
        Task {
            for activity in Activity<ZKWidgetAttributes>.activities{
                await activity.end(dismissalPolicy: .immediate)
            }
        }
        self.cancelTimer()
    }
    
    @objc public func isOpenLiveActivity ()-> Bool {
        if !ActivityAuthorizationInfo().areActivitiesEnabled {
            return false
        }
        return true
    }
    
    @objc public func getLiveActivityList () async{
        for await activity in Activity<ZKWidgetAttributes>.activityUpdates {
            print("Pizza delivery details: \(activity.attributes)")
        }
    }
    
    @objc public func startTimer() {
   
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(recordTime), userInfo: nil, repeats: true)
        
        if let curTimer : Timer = timer {
            RunLoop.main.add(curTimer, forMode: .common)
        }
    }
    
    @objc func recordTime(){

        sleepTime += 1

        print("开始计时：\(self.sleepTime)")

        ZkActivityManager.progress = Double(sleepTime) / 480.0
        
        if ZkActivityManager.progress > 1 {
            ZkActivityManager.progress = 1
        }
        print("目前进度：\(ZkActivityManager.progress)")
    }

    deinit {
        cancelTimer()
    }

    func cancelTimer() {
        timer?.invalidate()
        timer = nil
        ZkActivityManager.progress = 0
    }
    
    @objc func updateCircle(){
        if ZkActivityManager.progress > 1 {
            ZkActivityManager.progress = 1
        }
    }
}





