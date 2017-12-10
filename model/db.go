package model 

import (
	"database/sql"
	"log"
)

var db *sql.DB

func SetDatabase(database *sql.DB) {
	db = database
}

func handleError(err error) {
	if err != nil {
		log.Fatal(err)
	}
}