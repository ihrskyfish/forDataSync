#!/bin/bash
# 获取Firefox的进程ID

app=$1
pid=$(pgrep $app)
if [ -z "$pid" ]; then
    # 如果app没有运行，启动它
    nohup $app &

else
    # 如果app已经在运行，将它的窗口置顶
    app_window_id=$(xdotool search --onlyvisible --class $app | head -1)
    xdotool windowactivate $app_window_id
fi
