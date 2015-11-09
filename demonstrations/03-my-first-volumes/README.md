# Build

docker build -t my-first-volumes .

# Run

docker run -d -p 80:3000 --volume ${PWD}/public/live:/usr/src/app/public/live my-first-volumes
