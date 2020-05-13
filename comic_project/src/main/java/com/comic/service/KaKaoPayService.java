package com.comic.service;

import com.google.gson.JsonElement;

public interface KaKaoPayService {

	public JsonElement kakaoPay(int room_num, String id, int totalprice);

	public void insertSale(String id);

	public void resetRoom(String id);

}
