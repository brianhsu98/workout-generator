package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func generateWorkout(c *gin.Context) {
	prompt := c.PostForm("prompt")
	fmt.Println(prompt)
	// TODO: Implement calling openAI API
}

func main() {
	r := gin.Default()
	r.POST("/prompt", generateWorkout)
	r.Run()
}
