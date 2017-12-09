package controller

import (
	"net/http"
)

type Mountain struct {

}

func (m Mountain) registerRoutes() {
	http.HandleFunc("/mountains", m.getAllMountains)
}

func (m Mountain) getAllMountains(w http.ResponseWriter, r *http.Request) {
	
}