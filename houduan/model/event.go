package model

// 交通事件对象
type Event struct {
	EventID     string `json:"eventid"`
	EventType   string `json:"eventtype"`
	Timestamp   string `json:"timestamp"`
	Description string `json:"description"`
	RoadID      int    `json:"roadid"`
}
