package model

type Route struct {
	Id int `json:"id"`
	MountainId int `json:"-"`
	Name string `json:"name"`
	Difficulty string `json:"rating"`	
}

type RouteRepository struct {}

func (r RouteRepository) GetRoutesByMountain(id int) ([]Route) {
	var results []Route
	rows, err := db.Query(`
		SELECT id, mountain_id, name, difficulty
		FROM mountains_routes
		WHERE mountain_id = ?
	`, id)
	handleError(err)
	defer rows.Close()
	for rows.Next() {
		row := Route{}
		err := rows.Scan(&row.Id, &row.MountainId, &row.Name, &row.Difficulty)
		handleError(err)
		results = append(results, row)
	}
	err = rows.Err()
	handleError(err)
	return results
}



