#!/bin/sh
adb push /home/user/workspace/github_myself/XiaoMiWifiSwitchListStressTest/MyApplication/app/build/outputs/apk/app-debug.apk /data/local/tmp/stresstest.xiaomi.android.xiaomiswitchwifiliststress
adb shell pm install -r "/data/local/tmp/stresstest.xiaomi.android.xiaomiswitchwifiliststress"

adb push /home/user/workspace/github_myself/XiaoMiWifiSwitchListStressTest/MyApplication/app/build/outputs/apk/app-debug-androidTest.apk /data/local/tmp/stresstest.xiaomi.android.xiaomiswitchwifiliststress.test
adb shell pm install -r "/data/local/tmp/stresstest.xiaomi.android.xiaomiswitchwifiliststress.test"
