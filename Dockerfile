# Use an official Newman image
FROM postman/newman:alpine

# Install git to clone the repo
RUN apk add --no-cache git

# Clone the Postman collection from your GitLab repo (replace with your repo URL)
RUN git clone --branch main https://github.com/mmba007/test-argo-newman /usr/src/app

# Set the working directory
WORKDIR /usr/src/app

# Command to run the Postman collection
# Here, we run Newman with the collection and environment files from the Git repo
ENTRYPOINT ["newman", "run"]
CMD ["fake-collection.json", "--environment", "env.json", "--reporters", "cli"]
