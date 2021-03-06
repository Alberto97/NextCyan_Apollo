.class public Lcom/andrew/apollo/loaders/ArtistSongLoader;
.super Lcom/andrew/apollo/loaders/WrappedAsyncTaskLoader;
.source "ArtistSongLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/andrew/apollo/loaders/WrappedAsyncTaskLoader",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/andrew/apollo/model/Song;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final mArtistID:Ljava/lang/Long;

.field private mCursor:Landroid/database/Cursor;

.field private final mSongList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/andrew/apollo/model/Song;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/Long;)V
    .locals 1
    .parameter "context"
    .parameter "artistId"

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/andrew/apollo/loaders/WrappedAsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 38
    invoke-static {}, Lcom/andrew/apollo/utils/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mSongList:Ljava/util/ArrayList;

    .line 58
    iput-object p2, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mArtistID:Ljava/lang/Long;

    .line 59
    return-void
.end method

.method public static final makeArtistSongCursor(Landroid/content/Context;Ljava/lang/Long;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"
    .parameter "artistId"

    .prologue
    .line 105
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .local v6, selection:Ljava/lang/StringBuilder;
    const-string v0, "is_music=1"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    const-string v0, " AND title != \'\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " AND artist_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "title"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "artist"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "album"

    aput-object v4, v2, v3

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {p0}, Lcom/andrew/apollo/utils/PreferenceUtils;->getInstance(Landroid/content/Context;)Lcom/andrew/apollo/utils/PreferenceUtils;

    move-result-object v5

    invoke-virtual {v5}, Lcom/andrew/apollo/utils/PreferenceUtils;->getArtistSongSortOrder()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/andrew/apollo/loaders/ArtistSongLoader;->loadInBackground()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/andrew/apollo/model/Song;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/andrew/apollo/loaders/ArtistSongLoader;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mArtistID:Ljava/lang/Long;

    invoke-static {v6, v7}, Lcom/andrew/apollo/loaders/ArtistSongLoader;->makeArtistSongCursor(Landroid/content/Context;Ljava/lang/Long;)Landroid/database/Cursor;

    move-result-object v6

    iput-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    .line 69
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 72
    :cond_0
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 75
    .local v1, id:J
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, songName:Ljava/lang/String;
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x2

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, artist:Ljava/lang/String;
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x3

    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 84
    .local v5, album:Ljava/lang/String;
    new-instance v0, Lcom/andrew/apollo/model/Song;

    const/4 v6, -0x1

    invoke-direct/range {v0 .. v6}, Lcom/andrew/apollo/model/Song;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 87
    .local v0, song:Lcom/andrew/apollo/model/Song;
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mSongList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 91
    .end local v0           #song:Lcom/andrew/apollo/model/Song;
    .end local v1           #id:J
    .end local v3           #songName:Ljava/lang/String;
    .end local v4           #artist:Ljava/lang/String;
    .end local v5           #album:Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    if-eqz v6, :cond_2

    .line 92
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 93
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mCursor:Landroid/database/Cursor;

    .line 95
    :cond_2
    iget-object v6, p0, Lcom/andrew/apollo/loaders/ArtistSongLoader;->mSongList:Ljava/util/ArrayList;

    return-object v6
.end method
