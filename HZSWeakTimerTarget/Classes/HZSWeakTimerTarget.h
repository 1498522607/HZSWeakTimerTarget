//
//  HZSWeakTimerTarget.h
//  HZSWeakTimerTarget
//
//  Created by hzsMac on 2020/11/14.
//

#import <Foundation/Foundation.h>

typedef void (^HZSTimerHandler)(id userInfo);


@interface HZSWeakTimerTarget : NSObject
/**
 *  自定义的NSTimer，系统自带的容易引起内存泄露，这个方法会创建一个timer并添加到runLoop中
 *  用法与系统的一样
 *  @param interval  执行时序
 *  @param aTarget   方法目标（直接写方法所在的控制器，会在内部指向HMWeakTimerTarget的对象）
 *  @param aSelector 循环调用方法
 *  @param userInfo  用户
 *  @param yesOrNo   是否重复
 *  记得重写dealloc中调用[self.timer invalidate];方法销毁时钟
 *  @return <#return value description#>
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

/**
 *  自定义的NSTimer，系统自带的容易引起内存泄露，这个方法会创建一个timer并添加到runLoop中
 *  用法与系统的一样
 *  @param interval  执行时序
 *  @param aTarget   方法目标（直接写方法所在的控制器，会在内部指向HMWeakTimerTarget的对象）
 *  @param aSelector 循环调用方法
 *  @param userInfo  用户
 *  @param yesOrNo   是否重复
 *  记得重写dealloc中调用[self.timer invalidate];方法销毁时钟
 *  @return <#return value description#>
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget block:(HZSTimerHandler)block userInfo:(id)userInfo repeats:(BOOL)yesOrNo;
@end
