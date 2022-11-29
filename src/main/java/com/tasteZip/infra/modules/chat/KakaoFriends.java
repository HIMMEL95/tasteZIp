package com.tasteZip.infra.modules.chat;

public class KakaoFriends {

    public String profile_nickname, profile_thumbnail_image;
    public String id, uuid;
    public boolean allowed_msg, favorite;
    public String getProfile_nickname() {
        return profile_nickname;
    }
    public void setProfile_nickname(String profile_nickname) {
        this.profile_nickname = profile_nickname;
    }
    public String getProfile_thumbnail_image() {
        return profile_thumbnail_image;
    }
    public void setProfile_thumbnail_image(String profile_thumbnail_image) {
        this.profile_thumbnail_image = profile_thumbnail_image;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUuid() {
        return uuid;
    }
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    public boolean isAllowed_msg() {
        return allowed_msg;
    }
    public void setAllowed_msg(boolean allowed_msg) {
        this.allowed_msg = allowed_msg;
    }
    public boolean isFavorite() {
        return favorite;
    }
    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }
}
