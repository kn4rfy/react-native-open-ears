#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import <OpenEars/OELanguageModelGenerator.h>
#import <OpenEars/OEAcousticModel.h>
#import <OpenEars/OEPocketsphinxController.h>
#import <OpenEars/OEAcousticModel.h>
#import <OpenEars/OEEventsObserver.h>
#import <UIKit/UIApplication.h>

@interface RCTOpenEars : RCTEventEmitter <RCTBridgeModule, OEEventsObserverDelegate>
{
    OELanguageModelGenerator *lmGenerator;
}

@property (strong, nonatomic) OEEventsObserver *openEarsEventsObserver;

@end
