//
//  SmartSpriteSheet.h
//  cocos2dtest
//
//  Created by Vivek Seth on 11/25/12.
//
//

#import "cocos2d.h"

@interface VSSmartSpriteSheet : NSObject

@property (nonatomic, retain) CCSpriteBatchNode * spriteBatchNode;

- (id) initWithName:(NSString *) name ImageExtension:(NSString *) extension AndAddToLayer:(CCLayer*) layer;
- (CCSpriteFrame *) getFrameByName:(NSString *) frameName;
- (NSArray *) getFramesFrom:(int)startIndex To:(int)endIndex UsingBaseFrameName:(NSString *) baseFrameName;

@end
