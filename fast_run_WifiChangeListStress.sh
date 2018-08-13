#!/system/bin/sh
current_case_folder=$(date '+%Y%m%d_%H%M%S')
echo 'create file folder in scard path'
mkdir -p /sdcard/$current_case_folder
echo "Screenrecord..."
#在sdcard路径下生成以当前测试文件及时间命名的视频文件
screenrecord --verbose --size 1280x720 --time-limit 180 /sdcard/screenrecord.mp4 &
am instrument -w -r   -e debug false  -e ssid "MiTVOS" -e password "mitv2018" -e StressIterations 20 -e class stresstest.xiaomi.android.xiaomiswitchwifiliststress.XiaoMiSwitchWiFiListStressTest stresstest.xiaomi.android.xiaomiswitchwifiliststress.test/android.support.test.runner.AndroidJUnitRunner
echo $result_folder/$current_case_folder
print 'start loop'
while true; do
  p=`ps | grep "stresstest.xiaomi.android.xiaomiswitchwifiliststress"`
  if [[ -z $p ]]; then
    print 'copy /data/log ...'
    cp -r /data/log /data/local/tmp/log-$p
    echo "adb pull screenrecord video"
    mv /sdcard/*.mp4 /sdcard/$current_case_folder
    print 'done.'
    exit
  fi
done
