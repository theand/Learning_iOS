//
//  ViewController.m
//  ios20121019_cardgame
//
//  Created by sdt5 on 10/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

typedef enum _CARD_TYPE {
    EMPEROR = 0,
    SLAVE = 1,
    CITIZEN = 2
} CARD_TYPE;

typedef enum _FIGHT_RESULT{
    DRAW=0,
    WIN=1,
    LOSE=2
} FIGHT_RESULT;

@implementation ViewController {
    BOOL isPlayersTurn;
    UIImageView *computerCard[6];
    UIImageView *playerCard[6];
    UIImageView *imageShadow[6];
    int numberOfGame;
    BOOL doesPlayerHaveEmperor;
    UIImage *cardImage[3];
    UIImage *backsideImage;
    NSString *cardName[3];
    NSString *resultCaption[3];
    int playerScore;
    int computerScore;
}
@synthesize compCard1;
@synthesize compCard2;
@synthesize compCard3;
@synthesize compCard4;
@synthesize compCard5;
@synthesize playerCard1;
@synthesize playerCard2;
@synthesize playerCard3;
@synthesize playerCard4;
@synthesize playerCard5;
@synthesize compFightCard;
@synthesize playerFightCard;
@synthesize imageShadow1;
@synthesize imageShadow2;
@synthesize imageShadow3;
@synthesize imageShadow4;
@synthesize imageShadow5;
@synthesize compScoreLabel;
@synthesize playerScoreLabel;
@synthesize gameCountLabel;
@synthesize doesPlayerHaveEmperor;


#pragma mark 뷰 컨트롤러 라이프 사이클

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initGameConfiguration];

    [self prepareStage];

//    NSLog(@"Players Card: ")

}


- (void)viewDidUnload {
    for (int i = 1; i < 6; i++) {
        computerCard[i] = nil;
        playerCard[i] = nil;
        imageShadow[i] = nil;
    }

    [self setCompCard1:nil];
    [self setCompCard2:nil];
    [self setCompCard3:nil];
    [self setCompCard4:nil];
    [self setCompCard5:nil];
    [self setPlayerCard1:nil];
    [self setPlayerCard2:nil];
    [self setPlayerCard3:nil];
    [self setPlayerCard4:nil];
    [self setPlayerCard5:nil];
    [self setCompScoreLabel:nil];
    [self setPlayerScoreLabel:nil];
    [self setGameCountLabel:nil];
    [self setCompFightCard:nil];
    [self setPlayerFightCard:nil];
    [self setImageShadow1:nil];
    [self setImageShadow2:nil];
    [self setImageShadow3:nil];
    [self setImageShadow4:nil];
    [self setImageShadow5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark  최초 초기화

- (void)initGameConfiguration {
    isPlayersTurn = YES;
    numberOfGame = 1;

    self->computerCard[1] = compCard1;
    self->computerCard[2] = compCard2;
    self->computerCard[3] = compCard3;
    self->computerCard[4] = compCard4;
    self->computerCard[5] = compCard5;

    self->playerCard[1] = playerCard1;
    self->playerCard[2] = playerCard2;
    self->playerCard[3] = playerCard3;
    self->playerCard[4] = playerCard4;
    self->playerCard[5] = playerCard5;

    self->imageShadow[1] = imageShadow1;
    self->imageShadow[2] = imageShadow2;
    self->imageShadow[3] = imageShadow3;
    self->imageShadow[4] = imageShadow4;
    self->imageShadow[5] = imageShadow5;

    backsideImage = [UIImage imageNamed:@"back.png"];
    cardImage[EMPEROR] = [UIImage imageNamed:@"emperor.png"];
    cardImage[SLAVE] = [UIImage imageNamed:@"slave.png"];
    cardImage[CITIZEN] = [UIImage imageNamed:@"citizen.png"];
    cardName[EMPEROR] = @"Emperor";
    cardName[SLAVE] = @"Slave";
    cardName[CITIZEN] = @"Citizen";

    resultCaption[DRAW] = @"무승부";
    resultCaption[WIN] = @"승리";
    resultCaption[LOSE] = @"패배";
}


#pragma mark  스테이지 준비
- (void)prepareStage {
    NSLog(@"%s", sel_getName(_cmd));
    [self determineWhoHasEmperor];
    [self clearStage];
    [self prepareCard:playerCard isPlayerCard:YES];
    [self prepareCard:computerCard isPlayerCard:NO];
    [self prepareComputerCardShadow];
}

- (void)determineWhoHasEmperor {
    if (numberOfGame == 1) {
        doesPlayerHaveEmperor = YES;
    } else {
        if (( (numberOfGame-1) % 3) == 0) {
            doesPlayerHaveEmperor = !doesPlayerHaveEmperor;
            NSLog(@"Change Emperor Turn");
        }
    }
    NSLog(@"doesPlayerHaveEmperor : %s", doesPlayerHaveEmperor ? "YES" : "NO");
}

- (void)clearStage {
    playerFightCard.image = nil;
    compFightCard.image = nil;
}

- (void)prepareCard:(UIImageView * __strong *)cards isPlayerCard:(BOOL)isPlayerCard {
/*
                           isPlayerCard
                          | Y | N |
doesPlayerHaveEmperor | Y | Y | N |
                      | N | N | Y | -> isPositionForEmperor
 */
    BOOL isPositionForEmperor = !(doesPlayerHaveEmperor ^ isPlayerCard);

    int r = [self getRandomPosition];
    for (int i = 1; i < 6; i++) {
        if (i == r) {
            if (isPositionForEmperor) {
                cards[i].image = cardImage[EMPEROR];
            } else {
                cards[i].image = cardImage[SLAVE];
            }
        } else {
            cards[i].image = cardImage[CITIZEN];
        }
    }
}


- (int)getRandomPosition {
    return (arc4random() % 5) + 1;
}

- (void)prepareComputerCardShadow {
    for( int i=1; i<6; i++){
        imageShadow[i].image = backsideImage;
    }
}


#pragma mark  사용자가 카드 선택
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (!isPlayersTurn) {
        NSLog(@"Not yet my turn");
        return;
    }

    for (int i = 1; i < 6; i++) {
        if ([self isAlreadyUsed:i]) {
            continue;
        }
        if ([self isTouchedCardAt:point position:i]) {
            [self fightBeginsByPlayersChoiceAt:i];
            break;
        }
    }
}

- (BOOL)isAlreadyUsed:(int)i {
    return playerCard[i].image == nil;
}

- (BOOL)isTouchedCardAt:(CGPoint)point position:(int)i {
    return CGRectContainsPoint(playerCard[i].frame, point);
}

#pragma mark  사용자가 고른 카드에 따라 게임 진행(메인루틴)
- (void)fightBeginsByPlayersChoiceAt:(int)i {
    [self playerChooseCardAt:i];
    [self computerChooseCardRandomly];
    FIGHT_RESULT result = [self fightForEachOther];
    [self arrangeFightResult:result];
}


#pragma mark  메인 루틴의 각 부분 구현 -  사용자 카드 선택
- (void)playerChooseCardAt:(int)i {
//    NSLog(@"Player card %d", i);
    playerFightCard.image = playerCard[i].image;
    playerCard[i].image = nil;

    CARD_TYPE type = [self selectedCardTypeOf:playerFightCard.image];
    NSLog(@"Player Selected Card is %@", [self selectedCardName:type]);
}

#pragma mark  메인 루틴의 각 부분 구현 - 컴퓨터 카드 선택
- (void)computerChooseCardRandomly {
    int r = [self randomChoiceForComputerCard];
//    NSLog(@"Computer card %d", r);
    compFightCard.image = computerCard[r].image;
    computerCard[r].image = nil;
    imageShadow[r].image = nil;

    CARD_TYPE type = [self selectedCardTypeOf:compFightCard.image];
    NSLog(@"Computer Selected Card is %@", [self selectedCardName:type]);
}

- (int)randomChoiceForComputerCard {
    int r;
    while ( YES ){
        r = [self getRandomPosition];
        if (  computerCard[r].image == nil)
            continue;
        else
            break;
    }
    return r;
}

#pragma mark  메인 루틴의 각 부분 구현 - 두 카드 대결

- (FIGHT_RESULT)fightForEachOther {
    CARD_TYPE player = [self selectedCardTypeOf:playerFightCard.image];
    CARD_TYPE computer = [self selectedCardTypeOf:compFightCard.image];

    FIGHT_RESULT result;

    if ( player != CITIZEN || computer != CITIZEN ){
        NSAssert1( player!=computer , @"XXX: This cannot happen. Two cards are same emperor or slave", nil);
    }

    result = [self getResultByFormulaWithPlayer:player computer:computer];
    NSLog(@"Fight Result is %@", resultCaption[result]);

    return result;
}

- (FIGHT_RESULT)getResultByFormulaWithPlayer:(CARD_TYPE)player computer:(CARD_TYPE)computer {
    /*
    formula is (player - computer)
                 | Computer
                 | Emperor | Slave     | Citizen
Player | Emperor | X (0)   | Lose (-1) | Win (-2)
         Slave   | Win (1) | X (0)     | Lose (-1)
         Citizen | Lose (2)| Win (1)   | Draw (0)
    */

    FIGHT_RESULT result;
    int formula = player - computer;
    switch (formula){
        case 0:
            result = DRAW;
            break;
        case 1:
        case -2:
            result = WIN;
            break;
        case -1:
        case 2:
            result = LOSE;
            break;
        default:
            NSAssert(NO, @"XXX: Unpredicted formula");
    }
    return result;
}

#pragma mark  메인 루틴의 각 부분 구현 - 승부 결과 정리

- (void)arrangeFightResult:(FIGHT_RESULT)result {
    if ( result == DRAW)
        return;

    [self recordScore:result];


}

#pragma mark  메인 루틴의 각 부분 구현 - 승부 결과 정리 - 결과 표시

- (void)recordScore:(FIGHT_RESULT)result {
    NSLog(@"%s", sel_getName(_cmd));
    switch (result){
        case WIN:
            playerScore++;
            break;
        case LOSE:
            computerScore++;
            break;
        default:
            NSAssert(NO, @"XXX: Unpredicted result came in.");
    }
    playerScoreLabel.text = [NSString stringWithFormat:@"%d", playerScore];
    compScoreLabel.text = [NSString stringWithFormat:@"%d", computerScore];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:resultCaption[result] message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];;
}

#pragma mark  메인 루틴의 각 부분 구현 - 스테이지 정리

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    NSLog(@"%s", sel_getName(_cmd));
    [self endStage];
}

- (void)endStage {
    NSLog(@"%s", sel_getName(_cmd));
    numberOfGame++;
    if( numberOfGame>12){
        int diff = playerScore - computerScore;
        NSString *msg;
        if ( diff>0 ){
            msg = @"플레이어 최종 승리";
        } else if ( diff == 0){
            msg = @"최종 무승부";
        }else{
            msg = @"플레이어 최종 패배";
        }
        UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"%@ : Play Again?", msg] delegate:self cancelButtonTitle:@"No" destructiveButtonTitle:nil otherButtonTitles:@"Yes", nil];
        action.actionSheetStyle = UIActionSheetStyleDefault;
        [action showInView:self.view];
    }else{
        gameCountLabel.text = [NSString stringWithFormat:@"Game %d", numberOfGame];
        [self prepareStage];

    }
}

#pragma mark  메인 루틴의 각 부분 구현 - 최종 게임 정리

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if( buttonIndex==actionSheet.cancelButtonIndex)
        return;

    [self initWholeStage];
}


- (void)initWholeStage {
    isPlayersTurn= YES;

    numberOfGame=1;
    gameCountLabel.text = [NSString stringWithFormat:@"%d", numberOfGame];

    playerScore=0;
    computerScore=0;
    playerScoreLabel.text = [NSString stringWithFormat:@"%d", playerScore];
    compScoreLabel.text = [NSString stringWithFormat:@"%d", computerScore];
    
    [self prepareStage];

}

#pragma mark  카드 종류 판별 루틴


- (NSString *)selectedCardName:(CARD_TYPE)type {
    return cardName[type];

}

- (CARD_TYPE)selectedCardTypeOf:(UIImage *)img {
    if (img == cardImage[EMPEROR])
        return EMPEROR;
    else if (img == cardImage[SLAVE])
        return SLAVE;
    else if (img == cardImage[CITIZEN])
        return CITIZEN;
    else {
        NSAssert(NO, @"XXXXXXXXXXXX : card type doesn't match");
    }
}



/*****************        Minor Method ****************************/

- (IBAction)doRestart:(id)sender {
    [self initWholeStage];
}
@end
