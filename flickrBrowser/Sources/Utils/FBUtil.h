//
//  FBUtil.h
//  flickBrowser
//
//  Created by Katekov Anton on 2/2/18.
//  Copyright © 2017 katekovanton. All rights reserved.
//

#ifndef FBUtil_h
#define FBUtil_h

#import <Foundation/Foundation.h>



typedef void (^FBEmptyBlock)(void);
typedef void (^FBBOOLBlock)(BOOL);



#define PERFORM_BLOCK_IF_NOT_NIL(block, ...) \
if (block) {\
block(__VA_ARGS__); \
}

#define WEAK(param) __weak typeof(param) param ## _weak_ = param;


#endif /* FBUtil_h */
