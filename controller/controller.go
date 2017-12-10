package controller

import(
"net/http"
"regexp"
"strconv"
"strings"
)

var(
	mountainController MountainController
	routeController RouteController
)

type Router struct {}

func (router Router) Bootstrap() {	
	http.HandleFunc("/mountains", router.delegateMountainRequests)
	http.HandleFunc("/mountains/", router.delegateMountainRequests)
}

func (router Router) delegateMountainRequests(w http.ResponseWriter, r *http.Request) {

	switch {

	case strings.Contains(r.URL.Path, `/routes`):
		pattern, _ := regexp.Compile(`/mountains/(\d+)/routes`)
		matches := pattern.FindStringSubmatch(r.URL.Path)
		id, _ := strconv.Atoi(matches[1])
		routeController.findAction(w, r, id)

	default:
		pattern, _ := regexp.Compile(`/mountains/(\d+)`)
		matches := pattern.FindStringSubmatch(r.URL.Path)	
		if len(matches) > 0 {
			id, _ := strconv.Atoi(matches[1])
			mountainController.findAction(w, r, id)
		} else {
			mountainController.indexAction(w, r)
		}

	}
	
}

