#!/usr/bin/make

SHELL = /bin/sh

UID := $(shell id -u)
GID := $(shell id -g)

export UID
export GID

up: 
	docker-compose up -d --build

build: 
	docker-compose build

reup:
	docker-compose down && docker-compose rm -f && docker-compose up -d --build 

down:
	docker-compose down
