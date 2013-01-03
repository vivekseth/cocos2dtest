//
//  VSSmartSprite.h
//  cocos2dtest
//
//  Created by Vivek Seth on 11/25/12.
//
//

#import "CCSprite.h"
#import "VSSmartSpriteSheet.h"

@interface VSSmartSprite : CCSprite

@property (nonatomic, retain) VSSmartSpriteSheet * spriteSheet;
@property (nonatomic, retain) NSMutableDictionary * actionDict;

- (id) initWithSpriteSheet:(VSSmartSpriteSheet *) spriteSheet StartingFrameName:(NSString *) frameName;
- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex BaseFrameName:(NSString *) baseFrameName;
- (void) playAnimation:(NSString *)animationName;
- (void) addAnimation:(NSString *)animationName FromFrame:(int) startIndex To:(int) endIndex BaseFrameName:(NSString *) baseFrameName RepeatForever:(Boolean) repeatForever Delay: (float) delay;

@end
