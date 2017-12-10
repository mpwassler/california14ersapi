package controller

import(
"fmt"

"net/http"
"encoding/json"
// "encoding/json"

"goapi/model"
)

type RouteController struct {}

var(
	routeRepository 	model.RouteRepository 
)


func (rc RouteController) findAction(w http.ResponseWriter, r *http.Request, id int) {
	results := routeRepository.GetRoutesByMountain(id)
	sendJSONResponse(w, results)
}

func sendJSONResponse(w http.ResponseWriter, results []model.Route) {
	enc := json.NewEncoder(w)
	err := enc.Encode(results)
	if(err != nil) {
		fmt.Printf(err.Error())
	}
}