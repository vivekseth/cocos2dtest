//
//  SpriteSheet.h
//  cocos2dtest
//
//  Created by Vivek Seth on 11/23/12.
//
//

#import "cocos2d.h"

@interface VSSpriteSheet : NSObject

@property (nonatomic) int columns;
@property (nonatomic) int rows;
@property (nonatomic, retain) CCTexture2D * texture;
@property (nonatomic, retain) CCSpriteBatchNode * spriteBatchNode;
- (id) initWithFileName:(NSString *)filename Columns:(int)cols Rows:(int) rows AndAddToLayer:(CCLayer*) layer;
- (CCSpriteFrame *) getFrameAtIndex:(int)index;
- (NSArray *) getFramesFrom:(int)startIndex To:(int)endIndex;
- (int) getIndexWithRow:(int)row AndColumn:(int) column;
@end
