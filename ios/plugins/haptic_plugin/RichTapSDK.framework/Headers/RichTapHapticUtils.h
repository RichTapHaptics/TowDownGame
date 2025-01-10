//
//  RichTapHapticUtils.h
//
//  Copyright © 2024 Shanghai Ruisheng Kaitai Acoustic Science And Technology Co., Ltd. All rights reserved.
//

#import <RichTapSDK/RichTapEnum.h>
NS_ASSUME_NONNULL_BEGIN


@interface RichTapHapticUtils : NSObject

/// 查看是否支持core haptic
+(BOOL)supportRichTap;

/// 设置播放通道
/// @param mode 通道参数
/// @param error 如果操作失败，将返回错误信息
+(void)setHapticMode:(PlayChannel)mode error:(NSError *_Nullable *_Nullable)error;;

/// 获取播放通道
/// @param error getHapticMode
+(PlayChannel)getHapticMode:(NSError *_Nullable *_Nullable)error;

/// 退出core haptic
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(BOOL)quit:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 停止震动
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(BOOL)stop:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 判断he文件播放是否暂停（目前只针对音频与震动同步接口）
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(BOOL)isPlaying:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 设置到某一时间段开始震动（只针对播放中的信号起作用）
/// @param playID 指定的播放ID
/// @param millSeconds 跳跃的时间（毫秒）
/// @param error 如果操作失败，将返回错误信息
+(BOOL)seekTo:(int)millSeconds playID:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 暂停震动（只针对播放的信号起作用）
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(BOOL)pause:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 继续震动（只在pause接口生效后，有作用）
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(BOOL)start:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 设置震动播放倍速
/// @param playID 指定的播放ID
///@param multiple 设置的播放倍速，取值范围[0.5,3]
///@param error 如果操作失败，将返回错误信息
+(BOOL)setSpeed:(float)multiple playID:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 获取震动播放倍速
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(float)getSpeed:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;


/// 返回当前振动的总时长
/// @param playID 指定的播放ID
/// @param error 如果操作失败，将返回错误信息
+(int)getDuration:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

/// 返回he信号的总时长
/// @param str 文件路径或he格式json字符串
/// @param error 如果操作失败，将返回错误信息
+(int)getLength:(NSString*)str error:(NSError *_Nullable *_Nullable)error;

/// 返回PrebakedEffectId的总时长
/// @param effect 指定哪个效果，取值范围[0,49]
/// @param error 如果操作失败，将返回错误信息
+(int)getPrebakedLength:(PrebakedEffectId)effect error:(NSError *_Nullable *_Nullable)error;

/// 播放he2.0效果文件，声音与震动自动同步接口（适配高自定义场景）
/// @param str 文件路径或he格式json字符串
/// @param amplitude 播放强度，取值范围 [0-511]
/// @param freq  播放频率，取值范围 [-100-100]
/// @param playProgress 同步的callBack，内部return 播放器进度（单位秒）
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str amplitude:(int)amplitude freq:(int)freq playProgress:(double(^_Nonnull)(void))playProgress error:(NSError *_Nullable *_Nullable)error;

/// 加载预置效果（类似于先加载，后调用start播放）
/// @param effect 指定哪个效果，取值范围[0,49]
/// @param error error 如果操作失败，将返回错误信息
+(NSInteger)prepareExtPrebaked:(PrebakedEffectId)effect error:(NSError *_Nullable *_Nullable)error;

/// 调用通用效果库中的效果,目前定义了49个效果
/// @param effect 指定哪个效果，取值范围[0,49]
/// @param strength 指定效果的强度，取值范围是[0, 511]
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playExtPrebaked:(PrebakedEffectId)effect strength:(int)strength error:(NSError *_Nullable *_Nullable)error;


/// 加载播放效果（类似于先加载，后调用start播放）
/// @param str str 文件路径或he格式json字符串
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)prepareHaptic:(NSString*)str error:(NSError *_Nullable *_Nullable)error;

/// 预加载he效果文件
/// @param str 文件路径或he格式json字符串
/// @param loop 文件循环次数，取值范围 [-1-+∞]
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str loop:(int)loop error:(NSError *_Nullable *_Nullable)error;

/// 播放he效果文件，添加强度参数
/// @param str  文件路径或he格式json字符串
/// @param loop 文件循环次数，取值范围 [-1-+∞]
/// @param amplitude 播放强度，取值范围 [0-511]
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str loop:(int)loop amplitude:(int)amplitude error:(NSError *_Nullable *_Nullable)error;

/// 播放he效果文件，添加强度参数&间隔参数
/// @param str  文件路径或he格式json字符串
/// @param loop 文件循环次数，取值范围 [-1 - +∞]
/// @param amplitude 播放强度，取值范围 [0 - 511]
/// @param interval 循环播放间隔，取值范围 [0 - ∞]ms
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str loop:(int)loop amplitude:(int)amplitude interval:(int)interval error:(NSError *_Nullable *_Nullable)error;

/// 播放he效果文件，添加强度参数、频率参数&间隔参数
/// @param str  文件路径或he格式json字符串
/// @param loop 文件循环次数，取值范围 [-1 - +∞]
/// @param amplitude 播放强度，取值范围 [0 - 511]
/// @param interval 循环播放间隔，取值范围 [0 - +∞]ms
/// @param freq 表示频率，取值范围是[-100 - 100]
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str loop:(int)loop amplitude:(int)amplitude interval:(int)interval freq:(int)freq error:(NSError *_Nullable *_Nullable)error;


/// 播放he效果文件，添加强度参数、频率参数、间隔参数、偏置位置
/// @param str  文件路径或he格式json字符串
/// @param loop 文件循环次数，取值范围 [-1 - +∞]
/// @param amplitude 播放强度，取值范围 [0 - 511]
/// @param interval 循环播放间隔，取值范围 [0 - +∞]ms
/// @param freq 表示频率，取值范围是[-100 - 100]
/// @param offsetMillis 表示开始播放时间的偏移值，从HE指定的时间节点开始播放，该值仅在大于0且小于HE的时长时生效，注：若HE中最后一个事件的时间小于设置的值，则不会触发振动效果
/// @param error 如果操作失败，将返回错误信息
+(NSInteger)playHaptic:(NSString*)str loop:(int)loop amplitude:(int)amplitude interval:(int)interval freq:(int)freq offsetMillis:(int)offsetMillis error:(NSError *_Nullable *_Nullable)error;

/// 用来调整Loop Pattern的缩放幅度和间隔，必须在loop>0时，才有效
/// @param playID 指定的播放ID
/// @param intensity 表示缩放值，取值范围是[0 - 511]
/// @param interval 表示每次播放结束到下次开始的时间，取值范围是[0 - +∞]ms
/// @param error 如果操作失败，将返回错误信息
+(void)sendLoopParameter:(NSInteger)playID intensity:(int)intensity interval:(int)interval error:(NSError *_Nullable *_Nullable)error;


/// 用来调整Loop Pattern的缩放幅度、频率和间隔，必须在loop>0时，才有效
/// @param playID 指定的播放ID
/// @param intensity 表示缩放值，取值范围是[0 - 511]
/// @param interval 表示每次播放结束到下次开始的时间，取值范围是[0 - +∞]ms
/// @param freq 表示频率，取值范围是[-100 - 100]
/// @param error 如果操作失败，将返回错误信息
+(void)sendLoopParameter:(NSInteger)playID intensity:(int)intensity interval:(int)interval freq:(int)freq error:(NSError *_Nullable *_Nullable)error;


/// 及时调整播放信号的强度
/// @param playID 指定的播放ID
/// @param amplitude 播放强度，取值范围 [0 - 255]
/// @param error 如果操作失败，将返回错误信息
+(void)setGain:(NSInteger)playID amplitude:(int)amplitude error:(NSError *_Nullable *_Nullable)error;


/// 添加播放状态的监听
/// @param callBack 监听的结构体
+(BOOL)registerPlayerEventCallback:(void(^_Nonnull)(NSInteger playID,PlayerStatus status))callBack;


/// 取消播放状态的监听
+(BOOL)unregisterPlayerEventCallback;


/// 获取当前播放的进度值
/// @param playID 播放id
/// @param error 如果操作失败，将返回错误信息
+(int)getCurrentPosition:(NSInteger)playID error:(NSError *_Nullable *_Nullable)error;

//+(NSInteger)startPlayHapticWithHEPath:(NSString *)path audioPath:(NSString*)audioPath delayTime:(NSTimeInterval)delayTime Loop:(NSUInteger)loop  playCodeCallBack:(void(^ _Nullable)(int code))playCodeCallBack;

+(NSString *)getRichtapSDKVersion;

@end

NS_ASSUME_NONNULL_END
