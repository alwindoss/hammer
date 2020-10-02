package main

import (
	"log"
	"os"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/filesystem"
	fs "github.com/rakyll/statik/fs"

	// This is needed for embedding
	_ "github.com/alwindoss/hammer/statik"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}
	app := fiber.New()
	statikFS, err := fs.New()
	if err != nil {
		panic(err)
	}
	app.Use("/", filesystem.New(filesystem.Config{
		Root: statikFS,
	}))

	// app.Static("/public", "./public")
	// app.Static("/", "./ui")

	log.Fatal(app.Listen(":" + port))
}
