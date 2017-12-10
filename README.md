# california14ersapi
Just a demo project built with golang

requires a mysql database and the "github.com/go-sql-driver/mysql" driver for mysql

Sample sql dump of data is included

Add folder to the src directory in your $GOPATH 

`go build main.go`

`./main.go`

An API for quering the 14k foot peaks in California and their most will known routes. Endpoints include:

## `localhost:8005/mountains`

## `localhost:8005/mountains/{id}`

## `localhost:8005/mountains/{id}/routes`
