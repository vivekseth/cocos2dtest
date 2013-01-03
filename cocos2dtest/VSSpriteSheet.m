//
//  SpriteSheet.m
//  cocos2dtest
//
//  Created by Vivek Seth on 11/23/12.
//
//

#import "VSSpriteSheet.h"

@implementation VSSpriteSheet

@synthesize columns = _columns;
@synthesize rows = _rows;
@synthesize texture = _texture;
@synthesize spriteBatchNode = _spriteBatchNode;

- (id) initWithFileName:(NSString *)filename Columns:(int)cols Rows:(int) rows AndAddToLayer:(CCLayer*) layer {
    if( (self = [super init]) )
	{
        self.texture = [[CCTextureCache sharedTextureCache] addImage:filename];
        self.columns = cols;
        self.rows = rows;
        self.spriteBatchNode = [CCSpriteBatchNode batchNodeWithTexture:self.texture];
        [layer addChild:self.spriteBatchNode];
	}
	return self;
}

- (CCSpriteFrame *) getFrameAtIndex:(int)index {
    int numRowsToSkip = index / self.columns;
    int indexOnNextRow = index % self.columns;
    int frameHeight = self.texture.pixelsHigh /self.rows;
    int frameWidth = self.texture.pixelsWide / self.columns;
    
    CCSpriteFrame *frame = (CCSpriteFrame *)[CCSpriteFrame frameWithTexture:self.texture rect:CGRectMake(indexOnNextRow*frameWidth, numRowsToSkip*frameHeight, frameWidth, frameHeight)];
    
    return frame;
}

- (NSArray *) getFramesFrom:(int)startIndex To:(int)endIndex {
    NSMutableArray * framesArray = [NSMutableArray array];
    for (int i = startIndex; i < endIndex+1; i++) {
        [framesArray addObject:[self getFrameAtIndex:i]];
    }
    return framesArray;
}

- (int) getIndexWithRow:(int)row AndColumn:(int) column {
    //both row and col start at 0
    int index = self.columns*row + column;
    return index;
}

@end
