//
//  EasyCCSprite.h
//  cocos2dtest
//
//  Created by Vivek Seth on 11/23/12.
//
//

#import "CCSprite.h"
#import "cocos2d.h"
#import "VSSpriteSheet.h"

@interface VSSprite : CCSprite

@property (nonatomic, retain) VSSpriteSheet * spriteSheet;
@property (nonatomic, retain) NSMutableDictionary * actionDict;

- (id) initWithSpriteSheet:(VSSpriteSheet *) spriteSheet StartingFrameIndex:(int) startIndex;
- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex;
- (void) playAnimation:(NSString *)animationName;
- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex RepeatForever:(Boolean) repeatForever Delay: (float) delay;
@end

/*
 
 should have a pointer to the spritesheet
 
 on init should add as child to spritesheet
 have a dictionary of animateions
 be able to create animations
    addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex;
 be able to play animations using name;
    playAnimation:(NSString *)animationName;
 
 
 */
