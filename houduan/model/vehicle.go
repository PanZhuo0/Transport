package model

type Vehicle struct {
	VehicleID     int    `json:"vehicleid"`
	LicensePlate  string `json:"licenseplate"`
	VehicleType   string `json:"vehicletype"`
	OwnerName     string `json:"ownername"`
	ContactNumber string `json:"contactnumber"`
}
