package controller

import (
"net/http"
"encoding/json"
"fmt"
"california14ersapi/model"
)

type MountainController struct {}

var(
	mountainRepository 	model.MountainRepository 
)

func (m MountainController) indexAction(w http.ResponseWriter, r *http.Request) {
	results := mountainRepository.GetAll()
	m.sendJSONResponse(w, results)
}

func (m MountainController) findAction(w http.ResponseWriter, r *http.Request, id int) {
	result := mountainRepository.FindById(id)
	fmt.Println(result)
	var resultSlice []model.Mountain
	results := append(resultSlice,result)
	fmt.Println(results)
	m.sendJSONResponse(w, results)
}

func (m MountainController) sendJSONResponse(w http.ResponseWriter, results []model.Mountain) {
	enc := json.NewEncoder(w)
	err := enc.Encode(results)
	if(err != nil) {
		fmt.Printf(err.Error())
	}
}