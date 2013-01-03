//
//  SmartSpriteSheet.m
//  cocos2dtest
//
//  Created by Vivek Seth on 11/25/12.
//
//

#import "VSSmartSpriteSheet.h"

@implementation VSSmartSpriteSheet

@synthesize spriteBatchNode = _spriteBatchNode;

- (id) initWithName:(NSString *) name ImageExtension:(NSString *) extension AndAddToLayer:(CCLayer*) layer {
    if((self = [super init])) {
        NSString * plist = [NSString stringWithFormat:@"%@%@", name, @".plist" ];
        NSString * spriteSheetFileName = [NSString stringWithFormat:@"%@%@", name, extension ];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:plist];
        self.spriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:spriteSheetFileName];
        [layer addChild:self.spriteBatchNode];
    }
    return self;
}

- (CCSpriteFrame *) getFrameByName:(NSString *) frameName {
    return [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:frameName];
}

- (NSArray *) getFramesFrom:(int)startIndex To:(int)endIndex UsingBaseFrameName:(NSString *) baseFrameName {
    NSMutableArray * frameArray = [NSMutableArray array];
    for (int i=startIndex;i<endIndex+1;i++) {
        NSString * frameName = [NSString stringWithFormat:baseFrameName, i ];
        [frameArray addObject:[self getFrameByName:frameName]];
    }
    return frameArray;
}

@end
