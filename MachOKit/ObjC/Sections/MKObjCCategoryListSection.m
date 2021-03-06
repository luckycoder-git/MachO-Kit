//----------------------------------------------------------------------------//
//|
//|             MachOKit - A Lightweight Mach-O Parsing Library
//|             MKObjCCategoryListSection.m
//|
//|             D.V.
//|             Copyright (c) 2014-2015 D.V. All rights reserved.
//|
//| Permission is hereby granted, free of charge, to any person obtaining a
//| copy of this software and associated documentation files (the "Software"),
//| to deal in the Software without restriction, including without limitation
//| the rights to use, copy, modify, merge, publish, distribute, sublicense,
//| and/or sell copies of the Software, and to permit persons to whom the
//| Software is furnished to do so, subject to the following conditions:
//|
//| The above copyright notice and this permission notice shall be included
//| in all copies or substantial portions of the Software.
//|
//| THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//| OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//----------------------------------------------------------------------------//

#import "MKObjCCategoryListSection.h"
#import "NSError+MK.h"
#import "MKSegment.h"
#import "MKObjCCategory.h"

//----------------------------------------------------------------------------//
@implementation MKObjCCategoryListSection

//|++++++++++++++++++++++++++++++++++++|//
+ (uint32_t)canInstantiateWithSectionLoadCommand:(id<MKLCSection>)sectionLoadCommand inSegment:(MKSegment*)segment
{
    if ([segment.name rangeOfString:@SEG_DATA].location != 0)
        return 0;
    
    if ([sectionLoadCommand.sectname isEqualToString:@"__objc_catlist"] == NO &&
        [sectionLoadCommand.sectname isEqualToString:@"__objc_nlcatlist"] == NO)
        return 0;
    
    return 50;
}

//|++++++++++++++++++++++++++++++++++++|//
+ (Class)classForGenericArgumentAtIndex:(__unused NSUInteger)index
{ return MKObjCCategory.class; }

@end
