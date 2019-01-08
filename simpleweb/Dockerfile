# base image
# FROM alpine
FROM node:alpine

# Install dependencies
WORKDIR /usr/app
# Explicity copies the package.json without copying other files,
# since package.json is needed for installing dependencies.
# The benefit is if other files are changed, there will be no need
# to install the packages while rebuilding. Docker will use cache instead.
COPY ./package.json ./
RUN npm install
COPY ./ ./


# Default command
CMD ["npm", "start"]