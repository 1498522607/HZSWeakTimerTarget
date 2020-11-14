//
//  HZSWeakTimerTarget.h
//  HZSWeakTimerTarget
//
//  Created by hzsMac on 2020/11/14.
//

#import <Foundation/Foundation.h>

typedef void (^HZSTimerHandler)(id userInfo);


@interface HZSWeakTimerTarget : NSObject

/*
    场景说明：当我们在一个页面使用定时器时，这时候如果直接退出，因为控制器被强引用其实根本无法回调- (void)dealloc
            而我们又是在dealloc 中调用[self.timer invalidate]; 这个类的目的是为了防止某些原因突然退出页面
            而无法调用invalidate引起的泄漏
 */
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
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo runLoopMode:(NSRunLoopMode)runLoopMode;

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
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)yesOrNo runLoopMode:(NSRunLoopMode)runLoopMode block:(HZSTimerHandler)block;
@end
