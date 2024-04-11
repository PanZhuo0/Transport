package model

// 道路对象
type Road struct {
	RoadID   string  `json:"roadid"`
	RoadName string  `json:"roadname"`
	Length   float64 `json:"length"`
	Type     string  `json:"type"`
}
