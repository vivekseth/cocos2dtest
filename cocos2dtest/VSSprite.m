//
//  EasyCCSprite.m
//  cocos2dtest
//
//  Created by Vivek Seth on 11/23/12.
//
//

#import "VSSprite.h"

@implementation VSSprite

@synthesize spriteSheet = _spriteSheet;
@synthesize actionDict = _actionDict;

- (id) initWithSpriteSheet:(VSSpriteSheet *) spriteSheet StartingFrameIndex:(int) startIndex {
    if( (self = [super initWithSpriteFrame:[spriteSheet getFrameAtIndex:startIndex] ]) )
	{
        self.spriteSheet = spriteSheet;
        self.actionDict = [[NSMutableDictionary alloc] init];
        [spriteSheet.spriteBatchNode addChild:self];
	}
	return self;
}

- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex {
    [self addAnimation:animationName FromFrame:startIndex To:endIndex RepeatForever:false Delay:0.05f];
}

- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex RepeatForever:(Boolean) repeatForever Delay: (float) delay {
    //delay
    //CCRepeatForever
    
    NSArray * animFrames = [self.spriteSheet getFramesFrom:startIndex To:endIndex];

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
    
    //[self runAction:action];
    
    [self.actionDict setValue:action forKey:animationName];
    
    [animFrames dealloc];
    [animation dealloc];
    [animate dealloc];
    [action dealloc];
    
}

- (void) playAnimation:(NSString *)animationName {
    CCAction * action = (CCAction *)[self.actionDict valueForKey:animationName];
    [self runAction:action];
}

- (void) dealloc {
    [super dealloc];
    
}

@end
