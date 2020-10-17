# Dockerfile (note: no .dev or .prod pseudo-extension)
FROM  node:erbium-alpine

# set container working directory (c-wd) for running commands
WORKDIR '/app' 
# copy package.json into c-wd, /app
COPY package.json . 
# install package in c-wd, /app
RUN npm install 
# copy remaining files from local wd to c-wd
COPY . . 
# build production code in c-wd
RUN npm run build 

# [download and] use NGINX base image
FROM nginx:latest

# Copy build artefact from previous build stage to this new stage.
COPY --from=0 /app/build /usr/share/nginx/html
# default command from nginx base image automatically starts NGINX for us