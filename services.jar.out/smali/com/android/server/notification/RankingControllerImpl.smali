.class public Lcom/android/server/notification/RankingControllerImpl;
.super Ljava/lang/Object;
.source "RankingControllerImpl.java"

# interfaces
.implements Lcom/flyme/server/notfication/RankingController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/notification/RankingControllerImpl$H;,
        Lcom/android/server/notification/RankingControllerImpl$1;
    }
.end annotation


# static fields
.field private static final CLEAR_PACKAGE_DAILY:I = 0x3

.field private static final EVENT_TYPE_CLICK:I = 0x2

.field private static final EVENT_TYPE_NONE:I = -0x1

.field private static final EVENT_TYPE_POST:I = 0x1

.field private static final EVENT_TYPE_REMOVE_BY_USER:I = 0x3

.field private static final LOAD_DAILY_RECORDS:I = 0x4

.field private static final LOAD_PACKAGE_DATA:I = 0x1

.field private static final MSG_CLICK:I = 0x6

.field private static final MSG_POST:I = 0x5

.field private static final MSG_REMOVE:I = 0x7

.field private static final ONE_DAY_TIME:J = 0x5265c00L

.field private static SCORE_SCALE:F = 0.0f

.field private static TAG:Ljava/lang/String; = null

.field private static final UPDATE_PACKAGE_DAILY:I = 0x2


# instance fields
.field private final mAppDailyMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Lmeizu/notification/RankingDaily;",
            ">;"
        }
    .end annotation
.end field

.field private final mAppResultMap:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Lmeizu/notification/RankingResult;",
            ">;"
        }
    .end annotation
.end field

.field private final mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

.field private final mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

.field mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

.field private mRecordCurrentTime:J

.field private mTimeSetReceive:Landroid/content/BroadcastReceiver;

.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "RankingControllerImpl"

    sput-object v0, Lcom/android/server/notification/RankingControllerImpl;->TAG:Ljava/lang/String;

    .line 36
    const v0, 0x3f333333    # 0.7f

    sput v0, Lcom/android/server/notification/RankingControllerImpl;->SCORE_SCALE:F

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppResultMap:Landroid/util/ArrayMap;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mRecordCurrentTime:J

    new-instance v0, Lcom/android/server/notification/RankingControllerImpl$1;

    invoke-direct {v0, p0}, Lcom/android/server/notification/RankingControllerImpl$1;-><init>(Lcom/android/server/notification/RankingControllerImpl;)V

    iput-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mTimeSetReceive:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/flyme/server/notfication/DatabaseHelper;

    const-string v1, "notification_ranking.db"

    invoke-direct {v0, p1, v1}, Lcom/flyme/server/notfication/DatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    new-instance v0, Lcom/android/server/notification/RankingControllerImpl$H;

    invoke-direct {v0, p0, p2, v2}, Lcom/android/server/notification/RankingControllerImpl$H;-><init>(Lcom/android/server/notification/RankingControllerImpl;Landroid/os/Looper;Lcom/android/server/notification/RankingControllerImpl$H;)V

    iput-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    const/4 v0, 0x4

    invoke-direct {p0, v0, v2}, Lcom/android/server/notification/RankingControllerImpl;->sendHandlerMessage(ILjava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/android/server/notification/RankingControllerImpl;->initTimeSetReceive(Landroid/content/Context;)V

    return-void
.end method

.method private parseNotificationRecord(Lcom/android/server/notification/NotificationRecord;I)Lmeizu/notification/RankingDaily;
    .locals 5
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;
    .param p2, "eventType"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lmeizu/notification/RankingDaily;

    invoke-direct {v0}, Lmeizu/notification/RankingDaily;-><init>()V

    .local v0, "rankingDaily":Lmeizu/notification/RankingDaily;
    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v2}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/server/notification/CloudNotificationHelper;->getOrigPackageName(Landroid/app/Notification;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lmeizu/notification/RankingDaily;->packageName:Ljava/lang/String;

    iput v3, v0, Lmeizu/notification/RankingDaily;->allNum:I

    iput v3, v0, Lmeizu/notification/RankingDaily;->clickNum:I

    iput v3, v0, Lmeizu/notification/RankingDaily;->removeNum:I

    packed-switch p2, :pswitch_data_0

    :goto_0
    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    iput-object v1, v0, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v1, v1, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    iput v1, v0, Lmeizu/notification/RankingDaily;->score:F

    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v1, v1, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    iput v1, v0, Lmeizu/notification/RankingDaily;->score_scale:F

    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v1, v1, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    iput v1, v0, Lmeizu/notification/RankingDaily;->notification_priority:I

    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v1, v1, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v1, v1, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    iput v1, v0, Lmeizu/notification/RankingDaily;->category_priority:I

    return-object v0

    :pswitch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lmeizu/notification/RankingDaily;->postDate:J

    iget-object v1, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v1}, Landroid/service/notification/StatusBarNotification;->getPostTime()J

    move-result-wide v2

    iput-wide v2, v0, Lmeizu/notification/RankingDaily;->updateDate:J

    iput v4, v0, Lmeizu/notification/RankingDaily;->allNum:I

    goto :goto_0

    :pswitch_1
    iput v4, v0, Lmeizu/notification/RankingDaily;->clickNum:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lmeizu/notification/RankingDaily;->updateDate:J

    goto :goto_0

    :pswitch_2
    iput v4, v0, Lmeizu/notification/RankingDaily;->removeNum:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lmeizu/notification/RankingDaily;->updateDate:J

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private pruneIfNecessary()V
    .locals 0

    .prologue
    return-void
.end method

.method private sendHandlerMessage(ILjava/lang/Object;)V
    .locals 2
    .param p1, "what"    # I
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .local v0, "message":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    invoke-virtual {v1, v0}, Lcom/android/server/notification/RankingControllerImpl$H;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private updateAppDaily(Lmeizu/notification/RankingDaily;Z)V
    .locals 8
    .param p1, "RankingDaily"    # Lmeizu/notification/RankingDaily;
    .param p2, "addMode"    # Z

    .prologue
    if-eqz p2, :cond_1

    iget-wide v2, p1, Lmeizu/notification/RankingDaily;->updateDate:J

    invoke-static {v2, v3}, Lcom/flyme/server/notfication/MyDateUtils;->getDate(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p1, Lmeizu/notification/RankingDaily;->updateDate:J

    iget-object v2, p1, Lmeizu/notification/RankingDaily;->packageName:Ljava/lang/String;

    iget-object v3, p1, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/android/server/notification/RankingControllerImpl;->getRankingDailyKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmeizu/notification/RankingDaily;

    .local v1, "oldDaily":Lmeizu/notification/RankingDaily;
    :goto_0
    if-eqz v1, :cond_0

    iget-wide v2, v1, Lmeizu/notification/RankingDaily;->key:J

    iput-wide v2, p1, Lmeizu/notification/RankingDaily;->key:J

    iget v2, p1, Lmeizu/notification/RankingDaily;->allNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->allNum:I

    add-int/2addr v2, v3

    iput v2, p1, Lmeizu/notification/RankingDaily;->allNum:I

    iget v2, p1, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->clickNum:I

    add-int/2addr v2, v3

    iput v2, p1, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v2, p1, Lmeizu/notification/RankingDaily;->removeNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->removeNum:I

    add-int/2addr v2, v3

    iput v2, p1, Lmeizu/notification/RankingDaily;->removeNum:I

    iget-object v2, v1, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    iput-object v2, p1, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    iget v2, v1, Lmeizu/notification/RankingDaily;->score_scale:F

    iput v2, p1, Lmeizu/notification/RankingDaily;->score_scale:F

    iget v2, v1, Lmeizu/notification/RankingDaily;->notification_priority:I

    iput v2, p1, Lmeizu/notification/RankingDaily;->notification_priority:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->category_priority:I

    iput v2, p1, Lmeizu/notification/RankingDaily;->category_priority:I

    :cond_0
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "oldDaily":Lmeizu/notification/RankingDaily;
    :cond_1
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    const/4 v3, 0x1

    invoke-virtual {v2, p1, v3}, Lcom/flyme/server/notfication/DatabaseHelper;->insertOrUpdateDaily(Lmeizu/notification/RankingDaily;Z)J

    move-result-wide v2

    iput-wide v2, p1, Lmeizu/notification/RankingDaily;->key:J

    return-void

    .restart local v0    # "key":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    iget-object v3, p1, Lmeizu/notification/RankingDaily;->packageName:Ljava/lang/String;

    iget-object v4, p1, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    iget-wide v6, p1, Lmeizu/notification/RankingDaily;->updateDate:J

    invoke-virtual {v2, v3, v4, v6, v7}, Lcom/flyme/server/notfication/DatabaseHelper;->getDaily(Ljava/lang/String;Ljava/lang/String;J)Lmeizu/notification/RankingDaily;

    move-result-object v1

    .restart local v1    # "oldDaily":Lmeizu/notification/RankingDaily;
    goto :goto_0
.end method

.method private writeEvent(ILmeizu/notification/RankingDaily;)V
    .locals 6
    .param p1, "eventType"    # I
    .param p2, "rankingDaily"    # Lmeizu/notification/RankingDaily;

    .prologue
    iget-object v2, p2, Lmeizu/notification/RankingDaily;->packageName:Ljava/lang/String;

    iget-object v3, p2, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/android/server/notification/RankingControllerImpl;->getRankingDailyKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmeizu/notification/RankingDaily;

    .local v1, "oldDaily":Lmeizu/notification/RankingDaily;
    :goto_0
    if-eqz v1, :cond_0

    iget-wide v2, v1, Lmeizu/notification/RankingDaily;->key:J

    iput-wide v2, p2, Lmeizu/notification/RankingDaily;->key:J

    packed-switch p1, :pswitch_data_0

    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v0, p2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    const/4 v3, 0x1

    invoke-virtual {v2, p2, v3}, Lcom/flyme/server/notfication/DatabaseHelper;->insertOrUpdateDaily(Lmeizu/notification/RankingDaily;Z)J

    move-result-wide v2

    iput-wide v2, p2, Lmeizu/notification/RankingDaily;->key:J

    invoke-direct {p0}, Lcom/android/server/notification/RankingControllerImpl;->pruneIfNecessary()V

    return-void

    .end local v1    # "oldDaily":Lmeizu/notification/RankingDaily;
    :cond_1
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    iget-object v3, p2, Lmeizu/notification/RankingDaily;->packageName:Ljava/lang/String;

    iget-object v4, p2, Lmeizu/notification/RankingDaily;->category:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/flyme/server/notfication/DatabaseHelper;->getDaily(Ljava/lang/String;Ljava/lang/String;)Lmeizu/notification/RankingDaily;

    move-result-object v1

    .restart local v1    # "oldDaily":Lmeizu/notification/RankingDaily;
    goto :goto_0

    :pswitch_0
    iget v2, p2, Lmeizu/notification/RankingDaily;->allNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->allNum:I

    add-int/2addr v2, v3

    iput v2, p2, Lmeizu/notification/RankingDaily;->allNum:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->clickNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->removeNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->removeNum:I

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

    iget-wide v4, p2, Lmeizu/notification/RankingDaily;->postDate:J

    invoke-interface {v2, v1, v4, v5}, Lcom/android/server/notification/NotificationFirewall;->offsetScore(Lmeizu/notification/RankingDaily;J)F

    move-result v2

    iput v2, p2, Lmeizu/notification/RankingDaily;->score:F

    iget v2, v1, Lmeizu/notification/RankingDaily;->score_scale:F

    iput v2, p2, Lmeizu/notification/RankingDaily;->score_scale:F

    goto :goto_1

    :pswitch_1
    iget v2, v1, Lmeizu/notification/RankingDaily;->allNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->allNum:I

    iget v2, p2, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->clickNum:I

    add-int/2addr v2, v3

    iput v2, p2, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->removeNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->removeNum:I

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

    invoke-interface {v2, v1}, Lcom/android/server/notification/NotificationFirewall;->increaseScore(Lmeizu/notification/RankingDaily;)F

    move-result v2

    iput v2, p2, Lmeizu/notification/RankingDaily;->score:F

    iget v2, v1, Lmeizu/notification/RankingDaily;->score_scale:F

    iput v2, p2, Lmeizu/notification/RankingDaily;->score_scale:F

    goto :goto_1

    :pswitch_2
    iget v2, v1, Lmeizu/notification/RankingDaily;->allNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->allNum:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->clickNum:I

    iput v2, p2, Lmeizu/notification/RankingDaily;->clickNum:I

    iget v2, p2, Lmeizu/notification/RankingDaily;->removeNum:I

    iget v3, v1, Lmeizu/notification/RankingDaily;->removeNum:I

    add-int/2addr v2, v3

    iput v2, p2, Lmeizu/notification/RankingDaily;->removeNum:I

    iget v2, v1, Lmeizu/notification/RankingDaily;->score_scale:F

    iput v2, p2, Lmeizu/notification/RankingDaily;->score_scale:F

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public addNotification(Lcom/android/server/notification/NotificationRecord;)V
    .locals 0
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    invoke-virtual {p0, p1}, Lcom/android/server/notification/RankingControllerImpl;->logPosted(Lcom/android/server/notification/NotificationRecord;)V

    return-void
.end method

.method public compare(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/StatusBarNotification;)I
    .locals 1
    .param p1, "sbn1"    # Landroid/service/notification/StatusBarNotification;
    .param p2, "sbn2"    # Landroid/service/notification/StatusBarNotification;

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "sbn1"    # Ljava/lang/Object;
    .param p2, "sbn2"    # Ljava/lang/Object;

    .prologue
    check-cast p1, Landroid/service/notification/StatusBarNotification;

    .end local p1    # "sbn1":Ljava/lang/Object;
    check-cast p2, Landroid/service/notification/StatusBarNotification;

    .end local p2    # "sbn2":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/android/server/notification/RankingControllerImpl;->compare(Landroid/service/notification/StatusBarNotification;Landroid/service/notification/StatusBarNotification;)I

    move-result v0

    return v0
.end method

.method public dump(Ljava/io/PrintWriter;Ljava/lang/String;Lcom/android/server/notification/NotificationManagerService$DumpFilter;)V
    .locals 5
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "filter"    # Lcom/android/server/notification/NotificationManagerService$DumpFilter;

    .prologue
    const-string v3, "Current Flyme Notification Intelligent Management \n"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    .local v2, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lmeizu/notification/RankingDaily;>;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "ds$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .local v0, "ds":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lmeizu/notification/RankingDaily;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmeizu/notification/RankingDaily;

    invoke-virtual {v3}, Lmeizu/notification/RankingDaily;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " RankingDaily key = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .end local v0    # "ds":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lmeizu/notification/RankingDaily;>;"
    :cond_0
    return-void
.end method

.method public getPackageCategoryScore(Lcom/android/server/notification/NotificationRecord;)F
    .locals 5
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    iget-object v2, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v2}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;

    move-result-object v2

    iget-object v3, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    invoke-virtual {v3}, Landroid/service/notification/StatusBarNotification;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/server/notification/CloudNotificationHelper;->getOrigPackageName(Landroid/app/Notification;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v3, v3, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v3, v3, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/android/server/notification/RankingControllerImpl;->getRankingDailyKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v2, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmeizu/notification/RankingDaily;

    .local v0, "daily":Lmeizu/notification/RankingDaily;
    if-eqz v0, :cond_0

    iget-object v2, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v2, v2, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v2, v2, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    iput v2, v0, Lmeizu/notification/RankingDaily;->score_scale:F

    iget-object v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

    invoke-interface {v2, v0}, Lcom/android/server/notification/NotificationFirewall;->decreaseScore(Lmeizu/notification/RankingDaily;)F

    move-result v2

    iput v2, v0, Lmeizu/notification/RankingDaily;->score:F

    const/4 v2, 0x0

    iget v4, v0, Lmeizu/notification/RankingDaily;->score:F

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    monitor-exit v3

    return v2

    .end local v0    # "daily":Lmeizu/notification/RankingDaily;
    :cond_0
    monitor-exit v3

    iget-object v2, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v2, v2, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

    const/4 v4, 0x0

    invoke-direct {p0, p1, v4}, Lcom/android/server/notification/RankingControllerImpl;->parseNotificationRecord(Lcom/android/server/notification/NotificationRecord;I)Lmeizu/notification/RankingDaily;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/android/server/notification/NotificationFirewall;->decreaseScore(Lmeizu/notification/RankingDaily;)F

    move-result v3

    iput v3, v2, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    iget-object v2, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;

    iget-object v2, v2, Landroid/service/notification/StatusBarNotification;->mFlymeFilter:Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    iget v2, v2, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    return v2

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public getPackageClickPercentage(Ljava/lang/String;Ljava/lang/String;)F
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppResultMap:Landroid/util/ArrayMap;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppResultMap:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppResultMap:Landroid/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmeizu/notification/RankingResult;

    iget v0, v0, Lmeizu/notification/RankingResult;->score:F

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :cond_0
    monitor-exit v1

    return v2

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public logClicked(Lcom/android/server/notification/NotificationRecord;)V
    .locals 3
    .param p1, "notification"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    const/4 v2, 0x6

    invoke-virtual {v1, v2, p1}, Lcom/android/server/notification/RankingControllerImpl$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/notification/RankingControllerImpl$H;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public logPosted(Lcom/android/server/notification/NotificationRecord;)V
    .locals 3
    .param p1, "notification"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    const/4 v2, 0x5

    invoke-virtual {v1, v2, p1}, Lcom/android/server/notification/RankingControllerImpl$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/notification/RankingControllerImpl$H;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public logRemoved(Lcom/android/server/notification/NotificationRecord;)V
    .locals 3
    .param p1, "notification"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mHandler:Lcom/android/server/notification/RankingControllerImpl$H;

    const/4 v2, 0x7

    invoke-virtual {v1, v2, p1}, Lcom/android/server/notification/RankingControllerImpl$H;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/notification/RankingControllerImpl$H;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public notificationOnCanceledByUser(Lcom/android/server/notification/NotificationRecord;)V
    .locals 0
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    invoke-virtual {p0, p1}, Lcom/android/server/notification/RankingControllerImpl;->logRemoved(Lcom/android/server/notification/NotificationRecord;)V

    return-void
.end method

.method public notificationOnClick(Lcom/android/server/notification/NotificationRecord;)V
    .locals 0
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;

    .prologue
    invoke-virtual {p0, p1}, Lcom/android/server/notification/RankingControllerImpl;->logClicked(Lcom/android/server/notification/NotificationRecord;)V

    return-void
.end method

.method public setNotificationFirewall(Lcom/android/server/notification/NotificationFirewall;)V
    .locals 0
    .param p1, "firewall"    # Lcom/android/server/notification/NotificationFirewall;

    .prologue
    iput-object p1, p0, Lcom/android/server/notification/RankingControllerImpl;->mNotificationFirewall:Lcom/android/server/notification/NotificationFirewall;

    return-void
.end method


# direct methods
.method static synthetic -get0(Lcom/android/server/notification/RankingControllerImpl;)Landroid/util/ArrayMap;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/notification/RankingControllerImpl;)Lcom/flyme/server/notfication/DatabaseHelper;
    .locals 1

    iget-object v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/notification/RankingControllerImpl;)J
    .locals 2

    iget-wide v0, p0, Lcom/android/server/notification/RankingControllerImpl;->mRecordCurrentTime:J

    return-wide v0
.end method

.method static synthetic -set0(Lcom/android/server/notification/RankingControllerImpl;J)J
    .locals 1

    iput-wide p1, p0, Lcom/android/server/notification/RankingControllerImpl;->mRecordCurrentTime:J

    return-wide p1
.end method

.method static synthetic -wrap0(Lcom/android/server/notification/RankingControllerImpl;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "category"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/notification/RankingControllerImpl;->getRankingDailyKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap1(Lcom/android/server/notification/RankingControllerImpl;Lcom/android/server/notification/NotificationRecord;I)Lmeizu/notification/RankingDaily;
    .locals 1
    .param p1, "r"    # Lcom/android/server/notification/NotificationRecord;
    .param p2, "eventType"    # I

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/notification/RankingControllerImpl;->parseNotificationRecord(Lcom/android/server/notification/NotificationRecord;I)Lmeizu/notification/RankingDaily;

    move-result-object v0

    return-object v0
.end method

.method static synthetic -wrap2(Lcom/android/server/notification/RankingControllerImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/server/notification/RankingControllerImpl;->clearAllPostDate()V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/server/notification/RankingControllerImpl;Lmeizu/notification/RankingDaily;Z)V
    .locals 0
    .param p1, "RankingDaily"    # Lmeizu/notification/RankingDaily;
    .param p2, "addMode"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/notification/RankingControllerImpl;->updateAppDaily(Lmeizu/notification/RankingDaily;Z)V

    return-void
.end method

.method static synthetic -wrap4(Lcom/android/server/notification/RankingControllerImpl;ILmeizu/notification/RankingDaily;)V
    .locals 0
    .param p1, "eventType"    # I
    .param p2, "rankingDaily"    # Lmeizu/notification/RankingDaily;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/notification/RankingControllerImpl;->writeEvent(ILmeizu/notification/RankingDaily;)V

    return-void
.end method

.method private clearAllPostDate()V
    .locals 6

    .prologue
    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v3}, Landroid/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 175
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "key$iterator":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 151
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mAppDailyMap:Landroid/util/ArrayMap;

    invoke-virtual {v3, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmeizu/notification/RankingDaily;

    .local v2, "rankingDaily":Lmeizu/notification/RankingDaily;
    if-eqz v2, :cond_0

    const-wide/16 v4, 0x0

    iput-wide v4, v2, Lmeizu/notification/RankingDaily;->postDate:J

    iget-object v3, p0, Lcom/android/server/notification/RankingControllerImpl;->mDataHelper:Lcom/flyme/server/notfication/DatabaseHelper;

    const/4 v4, 0x1

    invoke-virtual {v3, v2, v4}, Lcom/flyme/server/notfication/DatabaseHelper;->insertOrUpdateDaily(Lmeizu/notification/RankingDaily;Z)J

    move-result-wide v4

    iput-wide v4, v2, Lmeizu/notification/RankingDaily;->key:J

    goto :goto_0

    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "rankingDaily":Lmeizu/notification/RankingDaily;
    :cond_1
    return-void
.end method

.method private getRankingDailyKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "category"    # Ljava/lang/String;

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initTimeSetReceive(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIME_TICK"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/server/notification/RankingControllerImpl;->mTimeSetReceive:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/server/notification/RankingControllerImpl;->mRecordCurrentTime:J

    .line 334
    return-void
.end method
