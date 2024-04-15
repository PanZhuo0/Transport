package model

type Traffic struct {
	Id              string `json:"id"`
	RoadName        string `json:"roadname"`
	TrafficFlow     string `json:"trafficflow"`
	AverageSpeed    string `json:"averagespeed"`
	CongestionLevel string `json:"level"`
	TimeStamp       string `json:"timestamp"`
}
