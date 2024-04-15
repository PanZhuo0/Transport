package util

import (
	"fmt"
	"time"
)

// string 是前端传来的时间对象
// 返回一个可以插入到数据库的时间，时区:UTC+8北京时间
func TimeParse(str string) (t string) {
	parsedTime, err := time.Parse(time.RFC3339, str)
	if err != nil {
		fmt.Println("解析时间字符串出错:", err)
		return
	}

	// 将时间转换为 UTC 时间
	utcTime := parsedTime.UTC()

	// 转换为指定时区的时间
	location, err := time.LoadLocation("Asia/Shanghai")
	if err != nil {
		fmt.Println("加载时区出错:", err)
		return
	}
	localTime := utcTime.In(location)

	fmt.Println("转换后的时间(UTC+8):", localTime)
	return localTime.Format("2006-01-02 15:04:05")
}
