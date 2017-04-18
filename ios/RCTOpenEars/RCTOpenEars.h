#import <React/RCTBridgeModule.h>
#import <OpenEars/OELanguageModelGenerator.h>
#import <OpenEars/OEAcousticModel.h>
#import <OpenEars/OEPocketsphinxController.h>
#import <OpenEars/OEAcousticModel.h>
#import <OpenEars/OEEventsObserver.h>

@interface RCTOpenEars : NSObject <RCTBridgeModule, OEEventsObserverDelegate>
{
    OELanguageModelGenerator *lmGenerator;
}

@property (strong, nonatomic) OEEventsObserver *openEarsEventsObserver;

@end
