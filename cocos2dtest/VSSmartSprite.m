//
//  VSSmartSprite.m
//  cocos2dtest
//
//  Created by Vivek Seth on 11/25/12.
//
//

#import "VSSmartSprite.h"

@implementation VSSmartSprite

@synthesize spriteSheet = _spriteSheet;
@synthesize actionDict = _actionDict;

- (id) initWithSpriteSheet:(VSSmartSpriteSheet *) spriteSheet StartingFrameName:(NSString *) frameName {
    if( (self = [super initWithSpriteFrame:[spriteSheet getFrameByName:frameName] ]) )
	{
        self.spriteSheet = spriteSheet;
        self.actionDict = [[NSMutableDictionary alloc] init];
        [spriteSheet.spriteBatchNode addChild:self];
	}
	return self;
}

- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex BaseFrameName:(NSString *) baseFrameName {
    [self addAnimation:animationName FromFrame:startIndex To:endIndex BaseFrameName:baseFrameName RepeatForever:false Delay:0.05f];
}
- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex BaseFrameName:(NSString *) baseFrameName RepeatForever:(Boolean) repeatForever Delay: (float) delay {
    NSArray * animFrames = [self.spriteSheet getFramesFrom:startIndex To:endIndex UsingBaseFrameName:baseFrameName];
    
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:animFrames delay:delay];
    CCAnimate * animate = [CCAnimate actionWithAnimation:animation];
    //CCSequence *seq = [CCSequence actions: animate, nil];
    
    CCAction* action;
    if (repeatForever == true) {
        action = [CCRepeatForever actionWithAction:animate];
    }
    else {
        action = animate;
    }
        
    [self.actionDict setValue:action forKey:animationName];
}

- (void) playAnimation:(NSString *)animationName {
    CCAction * action = (CCAction *)[self.actionDict valueForKey:animationName];
    [self runAction:action];
}

@end
