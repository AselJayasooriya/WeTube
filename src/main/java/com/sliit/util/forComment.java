package com.sliit.util;

import java.util.Date;

public class forComment {
    public static String generateCID() {
        Date date = new Date();
        String milli = Long.toString(date.getTime());
        String cid = "CID" + milli;
        String commentid = cid;
        return commentid;
    }
}
