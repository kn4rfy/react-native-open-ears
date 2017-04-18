#import "RCTOpenEars.h"

@implementation RCTOpenEars

-(instancetype)init
{
    self = [super init];
    if (self) {
        lmGenerator = [[OELanguageModelGenerator alloc] init];

        self.openEarsEventsObserver = [[OEEventsObserver alloc] init];
        [self.openEarsEventsObserver setDelegate:self];
    }

    return self;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startListening:(NSDictionary *)args)
{
    NSArray *words = [args objectForKey:@"words"];
    NSString *name = [args objectForKey:@"name"];
    NSError *err = [lmGenerator generateLanguageModelFromArray:words withFilesNamed:name forAcousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"]]; // Change "AcousticModelEnglish" to "AcousticModelSpanish" to create a Spanish language model instead of an English one.

    NSString *lmPath = nil;
    NSString *dicPath = nil;

    if(err == nil) {

        lmPath = [lmGenerator pathToSuccessfullyGeneratedLanguageModelWithRequestedName:name];
        dicPath = [lmGenerator pathToSuccessfullyGeneratedDictionaryWithRequestedName:name];

        [[OEPocketsphinxController sharedInstance] setActive:TRUE error:nil];
        [[OEPocketsphinxController sharedInstance] startListeningWithLanguageModelAtPath:lmPath dictionaryAtPath:dicPath acousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"] languageModelIsJSGF:NO]; // Change "AcousticModelEnglish" to "AcousticModelSpanish" to perform Spanish recognition instead of English.

    } else {
        NSLog(@"Error: %@",[err localizedDescription]);
    }
}

RCT_EXPORT_METHOD(stopListening)
{
    [[OEPocketsphinxController sharedInstance] setActive:FALSE error:nil];
    [[OEPocketsphinxController sharedInstance] stopListening];
}

RCT_EXPORT_METHOD(suspendRecognition)
{
    [[OEPocketsphinxController sharedInstance] suspendRecognition];
}

RCT_EXPORT_METHOD(resumeRecognition)
{
    [[OEPocketsphinxController sharedInstance] resumeRecognition];
}

- (void) pocketsphinxDidReceiveHypothesis:(NSString *)hypothesis recognitionScore:(NSString *)recognitionScore utteranceID:(NSString *)utteranceID {
    NSLog(@"The received hypothesis is %@ with a score of %@ and an ID of %@", hypothesis, recognitionScore, utteranceID);
}

- (void) pocketsphinxDidStartListening {
    NSLog(@"Pocketsphinx is now listening.");
}

- (void) pocketsphinxDidDetectSpeech {
    NSLog(@"Pocketsphinx has detected speech.");
}

- (void) pocketsphinxDidDetectFinishedSpeech {
    NSLog(@"Pocketsphinx has detected a period of silence, concluding an utterance.");
}

- (void) pocketsphinxDidStopListening {
    NSLog(@"Pocketsphinx has stopped listening.");
}

- (void) pocketsphinxDidSuspendRecognition {
    NSLog(@"Pocketsphinx has suspended recognition.");
}

- (void) pocketsphinxDidResumeRecognition {
    NSLog(@"Pocketsphinx has resumed recognition.");
}

- (void) pocketsphinxDidChangeLanguageModelToFile:(NSString *)newLanguageModelPathAsString andDictionary:(NSString *)newDictionaryPathAsString {
    NSLog(@"Pocketsphinx is now using the following language model: \n%@ and the following dictionary: %@",newLanguageModelPathAsString,newDictionaryPathAsString);
}

- (void) pocketSphinxContinuousSetupDidFailWithReason:(NSString *)reasonForFailure {
    NSLog(@"Listening setup wasn't successful and returned the failure reason: %@", reasonForFailure);
}

- (void) pocketSphinxContinuousTeardownDidFailWithReason:(NSString *)reasonForFailure {
    NSLog(@"Listening teardown wasn't successful and returned the failure reason: %@", reasonForFailure);
}

- (void) testRecognitionCompleted {
    NSLog(@"A test file that was submitted for recognition is now complete.");
}


@end
