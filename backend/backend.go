package main

import (
	"fmt"
	badger "github.com/dgraph-io/badger/v3"
	"github.com/gin-gonic/gin"
	"log"
)

type Service struct {
	db *badger.DB
}

func NewService(db *badger.DB) *Service {
	return &Service{db: db}
}

func (app *Service) generateWorkout(c *gin.Context) {
	prompt := c.PostForm("prompt")
	fmt.Println(prompt)

	// TODO: Implement calling openAI API
}

func main() {
	db, err := badger.Open(badger.DefaultOptions("").WithInMemory(true))
	if err != nil {
		log.Fatal(err)
	}
	service := NewService(db)

	r := gin.Default()
	r.POST("/prompt", service.generateWorkout)
	r.Run()
}
