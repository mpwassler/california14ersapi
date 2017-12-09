package controller

var(
	mountainController Mountain
)

func Bootstrap() {
	mountainController.registerRoutes()
}