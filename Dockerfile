############################################
# For JavaScript and NodeJS based Projects #  
#               START                      #
############################################

[1]
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Bundle app source
COPY . .

EXPOSE 5000

CMD [ "node", "app.js" ]


[2]
# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies, including Material-UI 5
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (adjust if needed)
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]


[3]
# Use Node.js Alpine base image
FROM node:alpine

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

# Install dependencies
RUN npm install

# Copy the entire codebase to the working directory
COPY . /app/

# Expose the port your app runs on (replace <PORT_NUMBER> with your app's actual port)
EXPOSE 3000

# Define the command to start your application (replace "start" with the actual command to start your app)
CMD ["npm", "start"]


[3]
# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (usually 3000 by default)
EXPOSE 3000

# Start the React app when the container starts
CMD [ "npm", "start" ]


[4]
# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (usually 3000 by default)
EXPOSE 3000

# Start the React app when the container starts
CMD [ "npm", "start" ]


[5]
# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (usually 3000 by default)
EXPOSE 3000

# Start the React app when the container starts
CMD [ "npm", "start" ]


[6]
# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on (usually 3000 by default)
EXPOSE 3000

# Start the React app when the container starts
CMD [ "npm", "start" ]


[7]
# Use Node.js 16 slim as the base image
FROM node:16-slim

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 (or the port your app is configured to listen on)
EXPOSE 3000

# Start your Node.js server (assuming it serves the React app)
CMD ["npm", "start"]


############################################
# For JavaScript and NodeJS based Projects #  
#                END                       #
############################################

---------------------------------------------------------------------------------------------------------------------------------------------------------------

###########################
# For Java based Projects #  
#          START          #
###########################

[1]
# Use an official Apache Tomcat image as a base
FROM tomcat:9.0

# Copy the packaged WAR file into the webapps directory of Tomcat
COPY target/petclinic.war /usr/local/tomcat/webapps/

# Expose port 8080 (Tomcat's default port)
EXPOSE 8080

--------------------------------------------------------------------

[2]
FROM openjdk:17.0.2
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN ./mvnw clean package
CMD ./mvnw cargo:run -P tomcat90


###########################
# For Java based Projects #  
#         END             #
###########################

---------------------------------------------------------------------------------------------------------------------------------------------------------------

#################################
# For TypeScript based Projects #  
#             START             #
#################################

[1]
FROM node:16.17.0-alpine as builder
WORKDIR /app
COPY ./package.json .
COPY ./yarn.lock .
RUN yarn install
COPY . .
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}  // for API
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"  // API entry point
RUN yarn build

FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]


[2]
# Use Node.js 16 as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 for the React app
EXPOSE 3000

# Start the React app
CMD ["npm", "start"]


[3]
FROM node:19-alpine3.15

WORKDIR /reddit-clone

COPY . /reddit-clone
RUN npm install 

EXPOSE 3000
CMD ["npm","run","dev"]


#################################
# For TypeScript based Projects #  
#             END               #
#################################

----------------------------------------------------------------------------------------------------------------------------------------------------------------

#############################
# For Python based Projects #  
#           START           #
#############################

[1]
FROM python:3.9-buster

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run"]


[2]


#############################
# For Python based Projects #  
#           END             #
#############################

----------------------------------------------------------------------------------------------------------------------------------------------------------------

###########################
# For HTML based Projects #  
#          START          #
###########################

[1]
# Use the official Nginx image as base image
FROM nginx:latest

# Copy the HTML files to the Nginx default html directory
COPY ultimately.html /usr/share/nginx/html/
COPY onlyYes.html /usr/share/nginx/html/
COPY fixdate.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Expose port 80 for web traffic
EXPOSE 80

# Verify file permissions
RUN chmod 644 /usr/share/nginx/html/ultimately.html && \
    chmod 644 /usr/share/nginx/html/onlyYes.html && \
    chmod 644 /usr/share/nginx/html/fixdate.html && \
    chmod 644 /usr/share/nginx/html/style.css

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]


[2]
# Use the official Nginx image as base image
FROM nginx:alpine

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the content of the Band Website repository into the container
COPY . .

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]


###########################
# For HTML based Projects #  
#          END            #
###########################
---------------------------------------------------------------------------------------------------------------------------------------------------------------

#########################
# For C# based Projects #  
#         START         #
#########################


---> [Make File] <---

# Used by `image`, `push` & `deploy` targets, override as required
IMAGE_REG ?= docker.io
IMAGE_REPO ?= yash5090/dotnet-monitoring
IMAGE_TAG ?= latest

# Used by `deploy` target, sets Azure webap defaults, override as required
AZURE_RES_GROUP ?= demoapps
AZURE_REGION ?= northeurope
AZURE_APP_NAME ?= dotnet-demoapp

# Used by `test-api` target
TEST_HOST ?= localhost:5000

# Don't change
SRC_DIR := src
TEST_DIR := tests

.PHONY: help lint lint-fix image push run deploy undeploy test test-report test-api clean .EXPORT_ALL_VARIABLES
.DEFAULT_GOAL := help

help: ## 💬 This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: ## 🔎 Lint & format, will not fix but sets exit code on error 
	@dotnet format --help > /dev/null 2> /dev/null || dotnet tool install --global dotnet-format
	dotnet format --verbosity diag ./src

image: ## 🔨 Build container image from Dockerfile 
	docker build . --file build/Dockerfile \
	--tag $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

push: ## 📤 Push container image to registry 
	docker push $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

run: ## 🏃‍ Run locally using Dotnet CLI
	dotnet watch --project $(SRC_DIR)/dotnet-demoapp.csproj

deploy: ## 🚀 Deploy to Azure Container App 
	az group create --resource-group $(AZURE_RES_GROUP) --location $(AZURE_REGION) -o table
	az deployment group create --template-file deploy/container-app.bicep \
		--resource-group $(AZURE_RES_GROUP) \
		--parameters appName=$(AZURE_APP_NAME) \
		--parameters image=$(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG) -o table
	@sleep 1
	@echo "### 🚀 App deployed & available here: $(shell az deployment group show --resource-group $(AZURE_RES_GROUP) --name container-app --query "properties.outputs.appURL.value" -o tsv)/"

undeploy: ## 💀 Remove from Azure 
	@echo "### WARNING! Going to delete $(AZURE_RES_GROUP) 😲"
	az group delete -n $(AZURE_RES_GROUP) -o table --no-wait

test: ## 🎯 Unit tests with xUnit
	dotnet test tests/tests.csproj 

test-report: ## 🤡 Unit tests with xUnit & output report
	rm -rf $(TEST_DIR)/TestResults
	dotnet test $(TEST_DIR)/tests.csproj --test-adapter-path:. --logger:junit --logger:html

test-api: .EXPORT_ALL_VARIABLES ##🚦 Run integration API tests, server must be running!
	cd tests \
	&& npm install newman \
	&& ./node_modules/.bin/newman run ./postman_collection.json --env-var apphost=$(TEST_HOST)

clean: ## 🧹 Clean up project
	rm -rf $(TEST_DIR)/node_modules
	rm -rf $(TEST_DIR)/package*
	rm -rf $(TEST_DIR)/TestResults
	rm -rf $(TEST_DIR)/bin
	rm -rf $(TEST_DIR)/obj
	rm -rf $(SRC_DIR)/bin
	rm -rf $(SRC_DIR)/obj

 ---> [Make File] <---


#########################
# For C# based Projects #  
#         END           #
#########################


---------------------------------------------------------------------------------------------------------------------------------------------------------------


#########################################################
# Make File for both JavaScript & Python based Projects #  
#                     START                             #
#########################################################


# Used by `image`, `push` & `deploy` targets, override as required
IMAGE_REG ?= docker.io
IMAGE_REPO ?= yash5090/python-system-monitoring
IMAGE_TAG ?= latest

# Used by `deploy` target, sets Azure webap defaults, override as required
AZURE_RES_GROUP ?= temp-demoapps
AZURE_REGION ?= uksouth
AZURE_SITE_NAME ?= pythonapp-$(shell git rev-parse --short HEAD)

# Used by `test-api` target
TEST_HOST ?= localhost:5000

# Don't change
SRC_DIR := src

.PHONY: help lint lint-fix image push run deploy undeploy clean test-api .EXPORT_ALL_VARIABLES
.DEFAULT_GOAL := help

help:  ## 💬 This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: venv  ## 🔎 Lint & format, will not fix but sets exit code on error 
	. $(SRC_DIR)/.venv/bin/activate \
	&& black --check $(SRC_DIR) \
	&& flake8 src/app/ && flake8 src/run.py

lint-fix: venv  ## 📜 Lint & format, will try to fix errors and modify code
	. $(SRC_DIR)/.venv/bin/activate \
	&& black $(SRC_DIR)

image:  ## 🔨 Build container image from Dockerfile 
	docker build . --file build/Dockerfile \
	--tag $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

push:  ## 📤 Push container image to registry 
	docker push $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

run: venv  ## 🏃 Run the server locally using Python & Flask
	. $(SRC_DIR)/.venv/bin/activate \
	&& python src/run.py

deploy:  ## 🚀 Deploy to Azure Web App 
	az group create --resource-group $(AZURE_RES_GROUP) --location $(AZURE_REGION) -o table
	az deployment group create --template-file deploy/webapp.bicep \
		--resource-group $(AZURE_RES_GROUP) \
		--parameters webappName=$(AZURE_SITE_NAME) \
		--parameters webappImage=$(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG) -o table 
	@echo "### 🚀 Web app deployed to https://$(AZURE_SITE_NAME).azurewebsites.net/"

undeploy:  ## 💀 Remove from Azure 
	@echo "### WARNING! Going to delete $(AZURE_RES_GROUP) 😲"
	az group delete -n $(AZURE_RES_GROUP) -o table --no-wait

test: venv  ## 🎯 Unit tests for Flask app
	. $(SRC_DIR)/.venv/bin/activate \
	&& pytest -v

test-report: venv  ## 🎯 Unit tests for Flask app (with report output)
	. $(SRC_DIR)/.venv/bin/activate \
	&& pytest -v --junitxml=test-results.xml

test-api: .EXPORT_ALL_VARIABLES  ## 🚦 Run integration API tests, server must be running 
	cd tests \
	&& npm install newman \
	&& ./node_modules/.bin/newman run ./postman_collection.json --env-var apphost=$(TEST_HOST)

clean:  ## 🧹 Clean up project
	rm -rf $(SRC_DIR)/.venv
	rm -rf tests/node_modules
	rm -rf tests/package*
	rm -rf test-results.xml
	rm -rf $(SRC_DIR)/app/__pycache__
	rm -rf $(SRC_DIR)/app/tests/__pycache__
	rm -rf .pytest_cache
	rm -rf $(SRC_DIR)/.pytest_cache

# ============================================================================

venv: $(SRC_DIR)/.venv/touchfile

$(SRC_DIR)/.venv/touchfile: $(SRC_DIR)/requirements.txt
	python3 -m venv $(SRC_DIR)/.venv
	. $(SRC_DIR)/.venv/bin/activate; pip install -Ur $(SRC_DIR)/requirements.txt
	touch $(SRC_DIR)/.venv/touchfile


#########################################################
# Make File for both JavaScript & Python based Projects #  
#                         END                           #
#########################################################
