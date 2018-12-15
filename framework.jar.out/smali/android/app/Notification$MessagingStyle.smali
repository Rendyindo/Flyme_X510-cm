.class public Landroid/app/Notification$MessagingStyle;
.super Landroid/app/Notification$Style;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/Notification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessagingStyle"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/app/Notification$MessagingStyle$Message;
    }
.end annotation


# static fields
.field public static final MAXIMUM_RETAINED_MESSAGES:I = 0x19


# instance fields
.field mConversationTitle:Ljava/lang/CharSequence;

.field mMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Notification$MessagingStyle$Message;",
            ">;"
        }
    .end annotation
.end field

.field mUserDisplayName:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 4676
    invoke-direct {p0}, Landroid/app/Notification$Style;-><init>()V

    .line 4674
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    .line 4676
    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "userDisplayName"    # Ljava/lang/CharSequence;

    .prologue
    .line 4685
    invoke-direct {p0}, Landroid/app/Notification$Style;-><init>()V

    .line 4674
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    .line 4686
    iput-object p1, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    .line 4685
    return-void
.end method

.method private findLatestIncomingMessage()Landroid/app/Notification$MessagingStyle$Message;
    .locals 4

    .prologue
    .line 4840
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 4841
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Notification$MessagingStyle$Message;

    .line 4843
    .local v1, "m":Landroid/app/Notification$MessagingStyle$Message;
    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4844
    return-object v1

    .line 4840
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 4847
    .end local v1    # "m":Landroid/app/Notification$MessagingStyle$Message;
    :cond_1
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 4849
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Notification$MessagingStyle$Message;

    return-object v2

    .line 4851
    :cond_2
    const/4 v2, 0x0

    return-object v2
.end method

.method private fixTitleAndTextExtras(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 4778
    invoke-direct {p0}, Landroid/app/Notification$MessagingStyle;->findLatestIncomingMessage()Landroid/app/Notification$MessagingStyle$Message;

    move-result-object v1

    .line 4779
    .local v1, "m":Landroid/app/Notification$MessagingStyle$Message;
    if-nez v1, :cond_2

    const/4 v3, 0x0

    .line 4780
    :goto_0
    if-nez v1, :cond_3

    const/4 v2, 0x0

    .line 4783
    :goto_1
    iget-object v5, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 4784
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 4785
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    move-result-object v0

    .line 4786
    .local v0, "bidi":Landroid/text/BidiFormatter;
    iget-object v5, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v5}, Landroid/app/Notification$Builder;->-get1(Landroid/app/Notification$Builder;)Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    .line 4788
    iget-object v7, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v7}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    const/4 v8, 0x0

    aput-object v7, v6, v8

    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    .line 4787
    const v7, 0x104065a

    .line 4786
    invoke-virtual {v5, v7, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 4796
    .end local v0    # "bidi":Landroid/text/BidiFormatter;
    .local v4, "title":Ljava/lang/CharSequence;
    :goto_2
    if-eqz v4, :cond_0

    .line 4797
    const-string/jumbo v5, "android.title"

    invoke-virtual {p1, v5, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 4799
    :cond_0
    if-eqz v3, :cond_1

    .line 4800
    const-string/jumbo v5, "android.text"

    invoke-virtual {p1, v5, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 4777
    :cond_1
    return-void

    .line 4779
    .end local v4    # "title":Ljava/lang/CharSequence;
    :cond_2
    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v3

    .local v3, "text":Ljava/lang/CharSequence;
    goto :goto_0

    .line 4781
    .end local v3    # "text":Ljava/lang/CharSequence;
    :cond_3
    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    .local v2, "sender":Ljava/lang/CharSequence;
    goto :goto_1

    .end local v2    # "sender":Ljava/lang/CharSequence;
    :cond_4
    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v2

    .restart local v2    # "sender":Ljava/lang/CharSequence;
    goto :goto_1

    .line 4790
    .end local v2    # "sender":Ljava/lang/CharSequence;
    :cond_5
    iget-object v4, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    .restart local v4    # "title":Ljava/lang/CharSequence;
    goto :goto_2

    .line 4793
    .end local v4    # "title":Ljava/lang/CharSequence;
    :cond_6
    move-object v4, v2

    .restart local v4    # "title":Ljava/lang/CharSequence;
    goto :goto_2
.end method

.method private static makeFontColorSpan(I)Landroid/text/style/TextAppearanceSpan;
    .locals 6
    .param p0, "color"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 4963
    new-instance v0, Landroid/text/style/TextAppearanceSpan;

    .line 4964
    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move v3, v2

    move-object v5, v1

    .line 4963
    invoke-direct/range {v0 .. v5}, Landroid/text/style/TextAppearanceSpan;-><init>(Ljava/lang/String;IILandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    return-object v0
.end method

.method private makeMessageLine(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;
    .locals 7
    .param p1, "m"    # Landroid/app/Notification$MessagingStyle$Message;

    .prologue
    const/4 v6, 0x0

    .line 4926
    invoke-static {}, Landroid/text/BidiFormatter;->getInstance()Landroid/text/BidiFormatter;

    move-result-object v0

    .line 4927
    .local v0, "bidi":Landroid/text/BidiFormatter;
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4928
    .local v2, "sb":Landroid/text/SpannableStringBuilder;
    invoke-static {p1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 4929
    iget-object v4, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    if-nez v4, :cond_0

    const-string/jumbo v1, ""

    .line 4930
    .local v1, "replyName":Ljava/lang/CharSequence;
    :goto_0
    invoke-virtual {v0, v1}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 4931
    iget-object v5, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v5}, Landroid/app/Notification$Builder;->resolveContrastColor()I

    move-result v5

    invoke-static {v5}, Landroid/app/Notification$MessagingStyle;->makeFontColorSpan(I)Landroid/text/style/TextAppearanceSpan;

    move-result-object v5

    .line 4930
    invoke-virtual {v2, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    .line 4938
    .end local v1    # "replyName":Ljava/lang/CharSequence;
    :goto_1
    invoke-static {p1}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v4

    if-nez v4, :cond_2

    const-string/jumbo v3, ""

    .line 4939
    .local v3, "text":Ljava/lang/CharSequence;
    :goto_2
    const-string/jumbo v4, "  "

    invoke-virtual {v2, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    invoke-virtual {v0, v3}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 4940
    return-object v2

    .line 4929
    .end local v3    # "text":Ljava/lang/CharSequence;
    :cond_0
    iget-object v1, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    goto :goto_0

    .line 4934
    :cond_1
    invoke-static {p1}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/text/BidiFormatter;->unicodeWrap(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 4935
    iget-object v5, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-virtual {v5}, Landroid/app/Notification$Builder;->getSenderTextColor()I

    move-result v5

    invoke-static {v5}, Landroid/app/Notification$MessagingStyle;->makeFontColorSpan(I)Landroid/text/style/TextAppearanceSpan;

    move-result-object v5

    .line 4934
    invoke-virtual {v2, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;Ljava/lang/Object;I)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    .line 4938
    :cond_2
    invoke-static {p1}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v3

    .restart local v3    # "text":Ljava/lang/CharSequence;
    goto :goto_2
.end method


# virtual methods
.method public addExtras(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 4763
    invoke-super {p0, p1}, Landroid/app/Notification$Style;->addExtras(Landroid/os/Bundle;)V

    .line 4764
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 4765
    const-string/jumbo v0, "android.selfDisplayName"

    iget-object v1, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 4767
    :cond_0
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    if-eqz v0, :cond_1

    .line 4768
    const-string/jumbo v0, "android.conversationTitle"

    iget-object v1, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 4770
    :cond_1
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "android.messages"

    .line 4771
    iget-object v1, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-static {v1}, Landroid/app/Notification$MessagingStyle$Message;->getBundleArrayForMessages(Ljava/util/List;)[Landroid/os/Bundle;

    move-result-object v1

    .line 4770
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 4774
    :cond_2
    invoke-direct {p0, p1}, Landroid/app/Notification$MessagingStyle;->fixTitleAndTextExtras(Landroid/os/Bundle;)V

    .line 4762
    return-void
.end method

.method public addMessage(Landroid/app/Notification$MessagingStyle$Message;)Landroid/app/Notification$MessagingStyle;
    .locals 2
    .param p1, "message"    # Landroid/app/Notification$MessagingStyle$Message;

    .prologue
    .line 4744
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4745
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x19

    if-le v0, v1, :cond_0

    .line 4746
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 4748
    :cond_0
    return-object p0
.end method

.method public addMessage(Ljava/lang/CharSequence;JLjava/lang/CharSequence;)Landroid/app/Notification$MessagingStyle;
    .locals 2
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "timestamp"    # J
    .param p4, "sender"    # Ljava/lang/CharSequence;

    .prologue
    .line 4731
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    new-instance v1, Landroid/app/Notification$MessagingStyle$Message;

    invoke-direct {v1, p1, p2, p3, p4}, Landroid/app/Notification$MessagingStyle$Message;-><init>(Ljava/lang/CharSequence;JLjava/lang/CharSequence;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4732
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x19

    if-le v0, v1, :cond_0

    .line 4733
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 4735
    :cond_0
    return-object p0
.end method

.method public getConversationTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 4712
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/app/Notification$MessagingStyle$Message;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4755
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    return-object v0
.end method

.method public getUserDisplayName()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 4693
    iget-object v0, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public makeBigContentView()Landroid/widget/RemoteViews;
    .locals 17

    .prologue
    .line 4859
    invoke-static/range {p0 .. p0}, Landroid/app/Notification$Style;->-get0(Landroid/app/Notification$Style;)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 4860
    invoke-static/range {p0 .. p0}, Landroid/app/Notification$Style;->-get0(Landroid/app/Notification$Style;)Ljava/lang/CharSequence;

    move-result-object v12

    .line 4862
    .local v12, "title":Ljava/lang/CharSequence;
    :goto_0
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_1

    const/4 v6, 0x0

    .line 4864
    .local v6, "hasTitle":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_3

    .line 4869
    if-eqz v6, :cond_2

    .line 4870
    move-object v1, v12

    .line 4871
    .local v1, "bigTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/Notification$MessagingStyle$Message;

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Landroid/app/Notification$MessagingStyle;->makeMessageLine(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 4876
    .local v11, "text":Ljava/lang/CharSequence;
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    .line 4877
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v14}, Landroid/app/Notification$Builder;->-wrap9(Landroid/app/Notification$Builder;)I

    move-result v14

    .line 4878
    const/4 v15, 0x0

    const/16 v16, 0x0

    .line 4876
    move-object/from16 v0, v16

    invoke-static {v13, v14, v15, v1, v0}, Landroid/app/Notification$Builder;->-wrap1(Landroid/app/Notification$Builder;IZLjava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/widget/RemoteViews;

    move-result-object v2

    .line 4879
    .local v2, "contentView":Landroid/widget/RemoteViews;
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v13, v2, v11}, Landroid/app/Notification$BigTextStyle;->applyBigTextContentView(Landroid/app/Notification$Builder;Landroid/widget/RemoteViews;Ljava/lang/CharSequence;)V

    .line 4880
    return-object v2

    .line 4861
    .end local v1    # "bigTitle":Ljava/lang/CharSequence;
    .end local v2    # "contentView":Landroid/widget/RemoteViews;
    .end local v6    # "hasTitle":Z
    .end local v11    # "text":Ljava/lang/CharSequence;
    .end local v12    # "title":Ljava/lang/CharSequence;
    :cond_0
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    goto :goto_0

    .line 4862
    .restart local v12    # "title":Ljava/lang/CharSequence;
    :cond_1
    const/4 v6, 0x1

    .restart local v6    # "hasTitle":Z
    goto :goto_1

    .line 4873
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/Notification$MessagingStyle$Message;

    invoke-static {v13}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 4874
    .restart local v1    # "bigTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/app/Notification$MessagingStyle$Message;

    invoke-static {v13}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v11

    .restart local v11    # "text":Ljava/lang/CharSequence;
    goto :goto_2

    .line 4883
    .end local v1    # "bigTitle":Ljava/lang/CharSequence;
    .end local v11    # "text":Ljava/lang/CharSequence;
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    .line 4884
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v14}, Landroid/app/Notification$Builder;->-wrap11(Landroid/app/Notification$Builder;)I

    move-result v14

    .line 4885
    const/4 v15, 0x0

    .line 4887
    const/16 v16, 0x0

    .line 4883
    move-object/from16 v0, v16

    invoke-static {v13, v14, v15, v12, v0}, Landroid/app/Notification$Builder;->-wrap1(Landroid/app/Notification$Builder;IZLjava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/widget/RemoteViews;

    move-result-object v2

    .line 4889
    .restart local v2    # "contentView":Landroid/widget/RemoteViews;
    const/4 v13, 0x7

    new-array v10, v13, [I

    .local v10, "rowIds":[I
    fill-array-data v10, :array_0

    .line 4893
    const/4 v13, 0x0

    array-length v14, v10

    :goto_3
    if-ge v13, v14, :cond_4

    aget v9, v10, v13

    .line 4894
    .local v9, "rowId":I
    const/16 v15, 0x8

    invoke-virtual {v2, v9, v15}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 4893
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 4897
    .end local v9    # "rowId":I
    :cond_4
    const/4 v7, 0x0

    .line 4899
    .local v7, "i":I
    if-eqz v6, :cond_6

    const v13, 0x1050052

    .line 4898
    :goto_4
    const v14, 0x10203c7

    invoke-virtual {v2, v14, v13}, Landroid/widget/RemoteViews;->setViewLayoutMarginBottomDimen(II)V

    .line 4900
    const-string/jumbo v14, "setNumIndentLines"

    .line 4901
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v13}, Landroid/app/Notification$Builder;->-get2(Landroid/app/Notification$Builder;)Landroid/app/Notification;

    move-result-object v13

    invoke-static {v13}, Landroid/app/Notification;->-wrap1(Landroid/app/Notification;)Z

    move-result v13

    if-nez v13, :cond_7

    const/4 v13, 0x0

    .line 4900
    :goto_5
    const v15, 0x10203c6

    invoke-virtual {v2, v15, v14, v13}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4903
    const/4 v3, -0x1

    .line 4904
    .local v3, "contractedChildId":I
    invoke-direct/range {p0 .. p0}, Landroid/app/Notification$MessagingStyle;->findLatestIncomingMessage()Landroid/app/Notification$MessagingStyle$Message;

    move-result-object v4

    .line 4905
    .local v4, "contractedMessage":Landroid/app/Notification$MessagingStyle$Message;
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    array-length v14, v10

    sub-int/2addr v13, v14

    const/4 v14, 0x0

    invoke-static {v14, v13}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 4906
    .local v5, "firstMessage":I
    :goto_6
    add-int v13, v5, v7

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    if-ge v13, v14, :cond_9

    array-length v13, v10

    if-ge v7, v13, :cond_9

    .line 4907
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    add-int v14, v5, v7

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/Notification$MessagingStyle$Message;

    .line 4908
    .local v8, "m":Landroid/app/Notification$MessagingStyle$Message;
    aget v9, v10, v7

    .line 4910
    .restart local v9    # "rowId":I
    const/4 v13, 0x0

    invoke-virtual {v2, v9, v13}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 4911
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Landroid/app/Notification$MessagingStyle;->makeMessageLine(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v2, v9, v13}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 4913
    if-ne v4, v8, :cond_5

    .line 4914
    move v3, v9

    .line 4917
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 4899
    .end local v3    # "contractedChildId":I
    .end local v4    # "contractedMessage":Landroid/app/Notification$MessagingStyle$Message;
    .end local v5    # "firstMessage":I
    .end local v8    # "m":Landroid/app/Notification$MessagingStyle$Message;
    .end local v9    # "rowId":I
    :cond_6
    const/4 v13, 0x0

    goto :goto_4

    .line 4901
    :cond_7
    if-eqz v6, :cond_8

    const/4 v13, 0x1

    goto :goto_5

    :cond_8
    const/4 v13, 0x2

    goto :goto_5

    .line 4920
    .restart local v3    # "contractedChildId":I
    .restart local v4    # "contractedMessage":Landroid/app/Notification$MessagingStyle$Message;
    .restart local v5    # "firstMessage":I
    :cond_9
    const-string/jumbo v13, "setContractedChildId"

    const v14, 0x10203c6

    invoke-virtual {v2, v14, v13, v3}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4922
    return-object v2

    .line 4889
    :array_0
    .array-data 4
        0x10203be
        0x10203bf
        0x10203c0
        0x10203c1
        0x10203c2
        0x10203c3
        0x10203c4
    .end array-data
.end method

.method public makeContentView()Landroid/widget/RemoteViews;
    .locals 6

    .prologue
    .line 4825
    invoke-direct {p0}, Landroid/app/Notification$MessagingStyle;->findLatestIncomingMessage()Landroid/app/Notification$MessagingStyle$Message;

    move-result-object v0

    .line 4826
    .local v0, "m":Landroid/app/Notification$MessagingStyle$Message;
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    if-eqz v3, :cond_0

    .line 4827
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    .line 4829
    :goto_0
    if-nez v0, :cond_2

    .line 4830
    const/4 v1, 0x0

    .line 4833
    :goto_1
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    iget-object v4, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v4}, Landroid/app/Notification$Builder;->-wrap6(Landroid/app/Notification$Builder;)I

    move-result v4

    .line 4834
    const/4 v5, 0x0

    .line 4833
    invoke-static {v3, v4, v5, v2, v1}, Landroid/app/Notification$Builder;->-wrap4(Landroid/app/Notification$Builder;IZLjava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/widget/RemoteViews;

    move-result-object v3

    return-object v3

    .line 4828
    :cond_0
    if-nez v0, :cond_1

    const/4 v2, 0x0

    .local v2, "title":Ljava/lang/CharSequence;
    goto :goto_0

    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_1
    invoke-static {v0}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v2

    .local v2, "title":Ljava/lang/CharSequence;
    goto :goto_0

    .line 4831
    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_2
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    if-eqz v3, :cond_3

    invoke-direct {p0, v0}, Landroid/app/Notification$MessagingStyle;->makeMessageLine(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v1

    .local v1, "text":Ljava/lang/CharSequence;
    goto :goto_1

    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_3
    invoke-static {v0}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/CharSequence;
    goto :goto_1
.end method

.method public makeHeadsUpContentView()Landroid/widget/RemoteViews;
    .locals 6

    .prologue
    .line 4948
    invoke-direct {p0}, Landroid/app/Notification$MessagingStyle;->findLatestIncomingMessage()Landroid/app/Notification$MessagingStyle$Message;

    move-result-object v0

    .line 4949
    .local v0, "m":Landroid/app/Notification$MessagingStyle$Message;
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    if-eqz v3, :cond_0

    .line 4950
    iget-object v2, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    .line 4952
    :goto_0
    if-nez v0, :cond_2

    .line 4953
    const/4 v1, 0x0

    .line 4956
    :goto_1
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    iget-object v4, p0, Landroid/app/Notification$MessagingStyle;->mBuilder:Landroid/app/Notification$Builder;

    invoke-static {v4}, Landroid/app/Notification$Builder;->-wrap7(Landroid/app/Notification$Builder;)I

    move-result v4

    .line 4957
    const/4 v5, 0x0

    .line 4956
    invoke-static {v3, v4, v5, v2, v1}, Landroid/app/Notification$Builder;->-wrap1(Landroid/app/Notification$Builder;IZLjava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/widget/RemoteViews;

    move-result-object v3

    return-object v3

    .line 4951
    :cond_0
    if-nez v0, :cond_1

    const/4 v2, 0x0

    .local v2, "title":Ljava/lang/CharSequence;
    goto :goto_0

    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_1
    invoke-static {v0}, Landroid/app/Notification$MessagingStyle$Message;->-get0(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v2

    .local v2, "title":Ljava/lang/CharSequence;
    goto :goto_0

    .line 4954
    .end local v2    # "title":Ljava/lang/CharSequence;
    :cond_2
    iget-object v3, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    if-eqz v3, :cond_3

    invoke-direct {p0, v0}, Landroid/app/Notification$MessagingStyle;->makeMessageLine(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v1

    .local v1, "text":Ljava/lang/CharSequence;
    goto :goto_1

    .end local v1    # "text":Ljava/lang/CharSequence;
    :cond_3
    invoke-static {v0}, Landroid/app/Notification$MessagingStyle$Message;->-get1(Landroid/app/Notification$MessagingStyle$Message;)Ljava/lang/CharSequence;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/CharSequence;
    goto :goto_1
.end method

.method protected restoreFromExtras(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 4809
    invoke-super {p0, p1}, Landroid/app/Notification$Style;->restoreFromExtras(Landroid/os/Bundle;)V

    .line 4811
    iget-object v1, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 4812
    const-string/jumbo v1, "android.selfDisplayName"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Landroid/app/Notification$MessagingStyle;->mUserDisplayName:Ljava/lang/CharSequence;

    .line 4813
    const-string/jumbo v1, "android.conversationTitle"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    .line 4814
    const-string/jumbo v1, "android.messages"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    .line 4815
    .local v0, "parcelables":[Landroid/os/Parcelable;
    if-eqz v0, :cond_0

    instance-of v1, v0, [Landroid/os/Parcelable;

    if-eqz v1, :cond_0

    .line 4816
    invoke-static {v0}, Landroid/app/Notification$MessagingStyle$Message;->getMessagesFromBundleArray([Landroid/os/Parcelable;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Landroid/app/Notification$MessagingStyle;->mMessages:Ljava/util/List;

    .line 4808
    :cond_0
    return-void
.end method

.method public setConversationTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$MessagingStyle;
    .locals 0
    .param p1, "conversationTitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 4703
    iput-object p1, p0, Landroid/app/Notification$MessagingStyle;->mConversationTitle:Ljava/lang/CharSequence;

    .line 4704
    return-object p0
.end method
