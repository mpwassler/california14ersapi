package model

import (
	"fmt"
)

var(
	routeRepository RouteRepository 
)

type Mountain struct {
	Id int `json:"id"`
	Name string `json:"name"`
	Elevation int `json:"elevation"`
	Lat float64 `json:"latitude"`
	Lng float64 `json:"longitude"`
	Routes []Route `json:"routes"`
}

type MountainRepository struct {}

func (m MountainRepository) GetAll() ([]Mountain) {
	var results []Mountain
	rows, err := db.Query(`
		SELECT id, name, elevation, lat, lng
		FROM mountains 
	`)
	handleError(err)
	defer rows.Close()
	for rows.Next() {
		row := Mountain{}
		err := rows.Scan(&row.Id, &row.Name, &row.Elevation, &row.Lat, &row.Lng)
		handleError(err)
		row.Routes = routeRepository.GetRoutesByMountain(row.Id)
		results = append(results, row)
	}
	err = rows.Err()
	handleError(err)
	fmt.Println(results)
	return results
}

func (m MountainRepository) FindById(id int) Mountain {
	result := Mountain{}
	row := db.QueryRow(`
		SELECT id, name, elevation, lat, lng
		FROM mountains 
		WHERE id = ?
	`, id)
	err := row.Scan(&result.Id, &result.Name, &result.Elevation, &result.Lat, &result.Lng)
	result.Routes = routeRepository.GetRoutesByMountain(result.Id)
	handleError(err)
	fmt.Println(result)
	return result
}

