package main

import( 
"net/http"
"fmt"
"log"
"goapi/controller"
"goapi/model"
"database/sql"
 _ "github.com/go-sql-driver/mysql"
)

var(
router controller.Router
)

func main() {
	db := connectDB()
	defer db.Close()
	router.Bootstrap()
	http.ListenAndServe(":8005", nil)
}

func connectDB() *sql.DB {
	db, err := sql.Open("mysql", "root:@/california_fourteeners")
	if err != nil {
		log.Fatalln(fmt.Errorf("DB could not connect %v", err))
	}	
	model.SetDatabase(db)
	return db
}