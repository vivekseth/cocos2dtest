//
//  testScene.m
//  cocos2dtest
//
//  Created by Vivek Seth on 11/23/12.
//
//

#import "testScene.h"
#import "VSSprite.h"
#import "VSSmartSprite.h"

@implementation testScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	testScene *layer = [testScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) onEnter
{
	[super onEnter];
    
	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];
    
    VSSpriteSheet * spritesheet = [[VSSpriteSheet alloc] initWithFileName:@"explosion.png" Columns:5 Rows:5 AndAddToLayer:self];
    VSSmartSpriteSheet * smartSpritesheet = [[VSSmartSpriteSheet alloc] initWithName:@"bear" ImageExtension:@".png" AndAddToLayer:self];
        
    VSSprite * sprite = [[VSSprite alloc] initWithSpriteSheet:spritesheet StartingFrameIndex:0];
    sprite.position = ccp(size.width/2, size.height/2);
    [sprite addAnimation:@"explosion" FromFrame:0 To:24 RepeatForever:true Delay:0.05f];
    [sprite playAnimation:@"explosion"];
    
    VSSprite * sprite2 = [[VSSprite alloc] initWithSpriteSheet:spritesheet StartingFrameIndex:0];
    sprite2.position = ccp(size.width/3, size.height/3);
    [sprite2 addAnimation:@"explosion" FromFrame:0 To:24 RepeatForever:true Delay:0.06f];
    [sprite2 playAnimation:@"explosion"];
    
    VSSmartSprite * sprite3 = [[VSSmartSprite alloc] initWithSpriteSheet:smartSpritesheet StartingFrameName:@"bear1.png"];
    sprite3.position = ccp(size.width/1.5, size.height/1.5);
    [sprite3 addAnimation:@"walking" FromFrame:1 To:8 BaseFrameName:@"bear%i.png" RepeatForever:true Delay:0.1f];
    [sprite3 playAnimation:@"walking"];
    
}

-(void) makeTransition:(ccTime)dt
{
	//[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
}


@end
