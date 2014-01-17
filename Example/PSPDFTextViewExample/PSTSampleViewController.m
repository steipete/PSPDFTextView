//
//  PSTSampleViewController.m
//  PSPDFTextViewExample
//
//  Created by Peter Steinberger on 08/01/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "PSTSampleViewController.h"
#import "PSPDFTextView.h"
#include <tgmath.h>

@interface PSTSampleViewController () <UITextViewDelegate> {
    CGRect _keyboardRect;
    BOOL _keyboardVisible;
}
@property (nonatomic, strong) PSPDFTextView *textView;
@end

@implementation PSTSampleViewController

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss Keyboard" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissKeyboard)];

    // Register notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];

    PSPDFTextView *textView = [[PSPDFTextView alloc] initWithFrame:self.view.bounds];
    textView.delegate = self;
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    textView.font = [UIFont systemFontOfSize:20.f];
    textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    textView.text = @"A surprise party? Mr. Worf, I hate surprise parties. I would *never* do that to you. We finished our first sensor sweep of the neutral zone. Earl Grey tea, watercress sandwiches... and Bularian canapés? Are you up for promotion? Fate. It protects fools, little children, and ships named \"Enterprise.\" In all trust, there is the possibility for betrayal. But the probability of making a six is no greater than that of rolling a seven. We know you're dealing in stolen ore. But I wanna talk about the assassination attempt on Lieutenant Worf. Maybe we better talk out here; the observation lounge has turned into a swamp. Congratulations - you just destroyed the Enterprise. Fate protects fools, little children and ships named Enterprise. You bet I'm agitated! I may be surrounded by insanity, but I am not insane. I'll alert the crew. I can't. As much as I care about you, my first duty is to the ship. Did you come here for something in particular or just general Riker-bashing? I'm afraid I still don't understand, sir. Talk about going nowhere fast. My oath is between Captain Kargan and myself. Your only concern is with how you obey my orders. Or do you prefer the rank of prisoner to that of lieutenant? Why don't we just give everybody a promotion and call it a night - 'Commander'? Some days you get the bear, and some days the bear gets you. Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody. I guess it's better to be lucky than good. This is not about revenge. This is about justice. I'll be sure to note that in my log. I will obey your orders. I will serve this ship as First Officer. And in an attack against the Enterprise, I will die with this crew. But I will not break my oath of loyalty to Starfleet. When has justice ever been as simple as a rule book? A lot of things can change in twelve years, Admiral. The Enterprise computer system is controlled by three primary main processor cores, cross-linked with a redundant melacortz ramistat, fourteen kiloquad interface modules. Mr. Crusher, ready a collision course with the Borg ship. Mr. Worf, you do remember how to fire phasers? Our neural pathways have become accustomed to your sensory input patterns. Flair is what marks the difference between artistry and mere competence. Yesterday I did not know how to eat gagh. I'd like to think that I haven't changed those things, sir. and attack the Romulans. How long can two people talk about nothing? Besides, you look good in a dress. Ensign Babyface! And blowing into maximum warp speed, you appeared for an instant to be in two places at once. Commander William Riker of the Starship Enterprise. The Federation's gone; the Borg is everywhere! I am your worst nightmare! Wait a minute - you've been declared dead. You can't give orders around here. Now, how the hell do we defeat an enemy that knows us better than we know ourselves? Could someone survive inside a transporter buffer for 75 years? The unexpected is our normal routine. The look in your eyes, I recognize it. You used to have it for me. For an android with no feelings, he sure managed to evoke them in others. Shields up! Rrrrred alert! Damage report! When has justice ever been as simple as a rule book? Computer, belay that order. Your head is not an artifact! Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody. Sure. You'd be surprised how far a hug goes with Geordi, or Worf. I'll be sure to note that in my log. I will obey your orders. I will serve this ship as First Officer. And in an attack against the Enterprise, I will die with this crew. But I will not break my oath of loyalty to Starfleet. When has justice ever been as simple as a rule book? A lot of things can change in twelve years, Admiral. The Enterprise computer system is controlled by three primary main processor cores, cross-linked with a redundant melacortz ramistat, fourteen kiloquad interface modules. Mr. Crusher, ready a collision course with the Borg ship. Mr. Worf, you do remember how to fire phasers? Our neural pathways have become accustomed to your sensory input patterns. Flair is what marks the difference between artistry and mere competence. Yesterday I did not know how to eat gagh. I'd like to think that I haven't changed those things, sir. and attack the Romulans. How long can two people talk about nothing? Besides, you look good in a dress. Ensign Babyface! And blowing into maximum warp speed, you appeared for an instant to be in two places at once. Commander William Riker of the Starship Enterprise. The Federation's gone; the Borg is everywhere! I am your worst nightmare! Wait a minute - you've been declared dead. You can't give orders around here. Now, how the hell do we defeat an enemy that knows us better than we know ourselves? Could someone survive inside a transporter buffer for 75 years? The unexpected is our normal routine. The look in your eyes, I recognize it. You used to have it for me. For an android with no feelings, he sure managed to evoke them in others. Shields up! Rrrrred alert! Damage report! When has justice ever been as simple as a rule book? Computer, belay that order. Your head is not an artifact! Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody. Sure. You'd be surprised how far a hug goes with Geordi, or Worf. I'll be sure to note that in my log. I will obey your orders. I will serve this ship as First Officer. And in an attack against the Enterprise, I will die with this crew. But I will not break my oath of loyalty to Starfleet. When has justice ever been as simple as a rule book? A lot of things can change in twelve years, Admiral. The Enterprise computer system is controlled by three primary main processor cores, cross-linked with a redundant melacortz ramistat, fourteen kiloquad interface modules. Mr. Crusher, ready a collision course with the Borg ship. Mr. Worf, you do remember how to fire phasers? Our neural pathways have become accustomed to your sensory input patterns. Flair is what marks the difference between artistry and mere competence. Yesterday I did not know how to eat gagh. I'd like to think that I haven't changed those things, sir. and attack the Romulans. How long can two people talk about nothing? Besides, you look good in a dress. Ensign Babyface! And blowing into maximum warp speed, you appeared for an instant to be in two places at once. Commander William Riker of the Starship Enterprise. The Federation's gone; the Borg is everywhere! I am your worst nightmare! Wait a minute - you've been declared dead. You can't give orders around here. Now, how the hell do we defeat an enemy that knows us better than we know ourselves? Could someone survive inside a transporter buffer for 75 years? The unexpected is our normal routine. The look in your eyes, I recognize it. You used to have it for me. For an android with no feelings, he sure managed to evoke them in others. Shields up! Rrrrred alert! Damage report! When has justice ever been as simple as a rule book? Computer, belay that order. Your head is not an artifact! Maybe if we felt any human loss as keenly as we feel one of those close to us, human history would be far less bloody. Sure. You'd be surprised how far a hug goes with Geordi, or Worf. ";
    [self.view addSubview:textView];
    self.textView = textView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self updateTextViewContentInset];
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Keyboard Notifications

- (void)keyboardWillShowNotification:(NSNotification *)notification {
    if (!_keyboardVisible) {
        _keyboardVisible = YES;
        _keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        [self updateTextViewContentInset];
        [(PSPDFTextView *)self.textView scrollToVisibleCaretAnimated:NO]; // Animating here won't bring us to the correct position.
    }
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    if (_keyboardVisible) {
        _keyboardVisible = NO;
        _keyboardRect = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        [self updateTextViewContentInset];
    }
}

- (void)updateTextViewContentInset {
    CGFloat top = self.topLayoutGuide.length, bottom = 0.f;

    // Don't execute this if in a popover.
    if (_keyboardVisible) {
        bottom = __tg_fmin(CGRectGetHeight(_keyboardRect), CGRectGetWidth(_keyboardRect)); // also work in landscape
    }

    UIEdgeInsets contentInset = UIEdgeInsetsMake(top, 0.f, bottom, 0.f);
    self.textView.contentInset = contentInset;
    self.textView.scrollIndicatorInsets = contentInset;
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Actions

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)aTextView {
    NSLog(@"Called %@", NSStringFromSelector(_cmd));
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)aTextView {
    NSLog(@"Called %@", NSStringFromSelector(_cmd));
    return YES;
}

@end
