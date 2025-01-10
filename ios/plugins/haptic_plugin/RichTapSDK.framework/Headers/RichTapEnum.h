//
//  RichTapEnum.h
//
//  Copyright © 2024 Shanghai Ruisheng Kaitai Acoustic Science And Technology Co., Ltd. All rights reserved.
//

typedef NS_ENUM(NSUInteger, PrebakedEffectId){
    RT_CLICK = 10001,
    RT_DOUBLE_CLICK,
    RT_SOFT_CLICK,
    RT_TICK,
    RT_THUD,
    RT_FAILURE,
    RT_SUCCESS,
    RT_RAMP_UP,
    RT_TOGGLE_SWITCH,
    RT_LONG_PRESS,
    RT_VIRTUAL_KEY,
    RT_KEYBOARD_TAP,
    RT_CLOCK_TICK,
    RT_CALENDAR_DATE,
    RT_CONTEXT_CLICK,
    RT_KEYBOARD_RELEASE,
    RT_VIRTUAL_KEY_RELEASE,
    RT_TEXT_HANDLE_MOVE,
    RT_ENTRY_BUMP,
    RT_DRAG_CROSSING,
    RT_GESTURE,
    RT_CONFIRM,
    RT_REJECT,
    RT_BOMB,
    RT_SWORD,
    RT_GUNSHOT,
    RT_SPEED_UP,
    RT_JUMP,
    RT_DRUM,
    RT_COIN_DROP,
    RT_HEARTBEAT,
    RT_PLUCKING,
    RT_DRAWING_ARROW,
    RT_CAMERA_SHUTTER,
    RT_FIREWORKS,
    RT_SNIPER_RIFLE,
    RT_ASSAULT_RIFLE,
    RT_CYMBAL,
    RT_TAMBOURINE,
    RT_FAST_MOVING,
    RT_FLY,
    RT_FOOTSTEP,
    RT_ICE,
    RT_LIGHTNING,
    RT_SPRING,
    RT_SWING,
    RT_WIND,
    RT_VICTORY,
    RT_AWARD,
    RT_GAMEOVER
};

typedef NS_ENUM(NSUInteger, PlayerStatus){
    END,
    ERROR,
    STARTED,
    PAUSED,
    STOPPED,
    COMPLETED,
    PREPARE,
};

typedef NS_ENUM(NSUInteger, PlayChannel){
    Phone = 0,
    GamePad,
    All,
};


static NSErrorDomain RichTapErrorDomain = @"com.RichTap.CoreHaptics";
typedef NS_ERROR_ENUM(RichTapErrorDomain, RichTapError) {

    ErrorUnknow                             = -1,
    ErrorParameter                          = 100,
    ErrorParseJson                          = 101,
    ErrorHeVersionMismatch                  = 102,
    ErrorCurrentNoPlaying                   = 103,
    ErrorCurrentNoHapticStop                = 104,
    ErrorCurrentHapticAlreadyStop           = 105,
    ErrorCurrentHapticAlreadyPlaying        = 106,
    ErrorSystemVersionNotSupported          = 110,
    ErrorCurrentPlaybackInterrupted         = 111,
    ErrorRichTapControllerLibNotFound       = 112,
};
