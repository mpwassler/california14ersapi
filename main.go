package main

import( 
"net/http"
"goapi/controller"
)

func main() {
	controller.Bootstrap()
	http.ListenAndServe(":8005", nil)
}