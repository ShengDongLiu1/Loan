package com.ht.h.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class EmailCode {

    public static String getCode() {
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        StringBuilder stringBuilder = new StringBuilder(format.format(new Date()));
        for (int i = 0; i < 1; i++) {
            stringBuilder.append(new Random().nextInt(2));
        }
        return stringBuilder.toString();
    }

}