#import "LLDBValue.h"

@import lldb_API;

NS_ASSUME_NONNULL_BEGIN

@interface LLDBValue ()

- (instancetype)initWithValue:(lldb::SBValue)value NS_DESIGNATED_INITIALIZER;

@property (readonly) lldb::SBValue value;

@end

NS_ASSUME_NONNULL_END
