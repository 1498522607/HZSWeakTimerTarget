//
//  HZSWeakTimerTarget.m
//  HZSWeakTimerTarget
//
//  Created by hzsMac on 2020/11/14.
//

#import "HZSWeakTimerTarget.h"

@interface HZSWeakTimerTarget ()

/**
 *  真正监听定时器的对象
 */
@property(nonatomic,weak) id target;
/**
 *  真正监听定时器的对象回调方法
 */
@property(nonatomic,assign) SEL selector;
@property(nonatomic,weak) NSTimer *timer;

@end


@implementation HZSWeakTimerTarget



//aTarget:控制器
//aSelector:控制器的回调方法

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo runLoopMode:(NSRunLoopMode)runLoopMode
{
    // 创建接管定时器强引用的对象
    HZSWeakTimerTarget *targetObject = [[HZSWeakTimerTarget alloc] init];
    // 记录真正监听定时器回调的对象
    targetObject.target = aTarget; // self
    // 回调方法
    targetObject.selector = aSelector; // @selector(timerBlock:)
    
    targetObject.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:targetObject selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop mainRunLoop] addTimer:targetObject.timer forMode:runLoopMode];
    return targetObject.timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)yesOrNo runLoopMode:(NSRunLoopMode)runLoopMode block:(HZSTimerHandler)block;
{
    NSMutableDictionary * userDic = [[NSMutableDictionary alloc] init];
    if (block) {
        [userDic setValue:[block copy] forKey:@"callBackBlock"];
    }
    if (userInfo) {
        [userDic setValue:userInfo forKey:@"userInfo"];
    }
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerBlock:) userInfo:userDic repeats:yesOrNo runLoopMode:runLoopMode];
}

/**
 *  定时回调block
 */
+ (void)timerBlock:(NSDictionary *)userDic
{
    HZSTimerHandler block = [userDic objectForKey:@"callBackBlock"];
    if (block)
    {
        block([userDic objectForKey:@"userInfo"]);
    }
}
/**
 *  定时器回调selector
 */
- (void)fire:(NSTimer *)timer
{
    if (self.target)
    { // self timerBlock:
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else
    {
        [self.timer invalidate];
    }
}

- (void)dealloc
{

}



@end
