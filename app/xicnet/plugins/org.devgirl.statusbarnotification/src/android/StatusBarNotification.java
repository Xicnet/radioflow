package org.devgirl.statusbarnotification;
 
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;
import android.content.Intent;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;

import android.util.Log;



public class StatusBarNotification extends CordovaPlugin {
    public static final String NOTIFY = "addCalendarEntry";
    public static final String CLEAR = "removeNotification";
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try {
                Log.d("NotificationPlugin: ", action);
            if (NOTIFY.equals(action)) { 
                JSONObject arg_object = args.getJSONObject(0);

                String tag = "tag";
                String title = "Xicnet";
                String body = "";
                String flag = "FLAG_NO_CLEAR";
                Log.d("NotificationPlugin", "Notification: " + tag + ", " + title + ", " + body);
                //int notificationFlag = getFlagValue(flag);
                showNotification(tag, title, body, 32);
             
               //this.cordova.getActivity().startActivity(calIntent);
               callbackContext.success();
               return true;
            } 
            if (CLEAR.equals(action)) {
		clearAllNotifications();
		return true;
            }
            callbackContext.error("Invalid action");
            return false;
        } catch(Exception e) {
            System.err.println("Exception: " + e.getMessage());
            callbackContext.error(e.getMessage());
            return false;
        } 
    }


    public void showNotification( CharSequence tag, CharSequence contentTitle, CharSequence contentText, int flag) {
        String ns = Context.NOTIFICATION_SERVICE;
        context = cordova.getActivity().getApplicationContext();
        mNotificationManager = (NotificationManager) context.getSystemService(ns);

        Notification noti = StatusNotificationIntent.buildNotification(context, tag, contentTitle, contentText, flag);
        mNotificationManager.notify(tag.hashCode(), noti);
    }


    private int getFlagValue(String flag) {
                int flagVal = Notification.FLAG_AUTO_CANCEL;

                // We trust the flag value as it comes from our JS constant.
                // This is also backwards compatible as it will be emtpy.
                if (!flag.isEmpty()){
                        flagVal = Integer.parseInt(flag);
                }
                
                return flagVal;
        }

    /**     
     * Removes all Notifications from the status bar.
     */     
    public void clearAllNotifications() {
	try {   
		mNotificationManager.cancelAll();
	} catch (Exception e) {
		Log.d("StatusBarNotification", "Some error occurred while trying to clear all notifications");
	}
    }   


    /**
     * Removes all Notifications on exit.
     */
    public void onDestroy() {
        this.clearAllNotifications();
        Log.d("StatusBarNotification", "Clearing all notifications on exit");
    }


    private NotificationManager mNotificationManager;
    private Context context;

}

