package model

type Vio struct {
	Id              int    `json:"id"`
	Name            string `json:"name"`
	License_Plate   string `json:"licenseplate"`
	Vio_Time        string `json:"violation_time"`
	Location        string `json:"location"`
	Vio_description string ` json:"violation_description"`
	Penalty         string `json:"penalty"`
}
