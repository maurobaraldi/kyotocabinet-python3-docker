# kyotocabinet-python3-docker
Python 3 Docker Alpine image with Kyotocabinet DB.

Kyotocabinet version 1.2.79
Python lib version 1.23

## Build

To build in a simple way, just for tests

`docker build -t kyotocabinet-python .`

## Run

`docker run -it -v ${PWD}:/var/code --name kyotodb-py3 maurobaraldi/kyotocabinet-python:0.0.1 /bin/sh`

## Testing

`docker run -it -v ${PWD}:/var/code --name kyotodb-py3 maurobaraldi/kyotocabinet-python:0.0.1 python -c "import kyotocabinet"`

