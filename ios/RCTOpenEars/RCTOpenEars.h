#import <React/RCTBridgeModule.h>
#import <OpenEars/OELanguageModelGenerator.h>
#import <OpenEars/OEAcousticModel.h>

@interface RCTOpenEars : NSObject <RCTBridgeModule>
{
    OELanguageModelGenerator *lmGenerator;
}

@end
