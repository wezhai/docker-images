#!/bin/bash
set -ex

function build_ubuntu() {
  PYTHON_VERSION=$1
  docker build --build-arg PYTHON_VERSION=$PYTHON_VERSION -t "wezhai/python:${PYTHON_VERSION}-ubuntu22.04" -f Dockerfile-ubuntu22.04 .
  docker tag wezhai/python:${PYTHON_VERSION}-ubuntu22.04 wezhai/python:${PYTHON_VERSION}-ubuntu
  docker tag wezhai/python:${PYTHON_VERSION}-ubuntu22.04 wezhai/python:${PYTHON_VERSION}

  docker push wezhai/python:${PYTHON_VERSION}-ubuntu22.04
  docker push wezhai/python:${PYTHON_VERSION}-ubuntu
  docker push wezhai/python:${PYTHON_VERSION}

  docker rmi wezhai/python:${PYTHON_VERSION}-ubuntu22.04
  docker rmi wezhai/python:${PYTHON_VERSION}-ubuntu
  docker rmi wezhai/python:${PYTHON_VERSION}
}

function build_debian() {
  PYTHON_VERSION=$1

  docker build --build-arg PYTHON_VERSION=$PYTHON_VERSION -t "wezhai/python:${PYTHON_VERSION}-debian12" -f Dockerfile-debian12 .
  docker tag wezhai/python:${PYTHON_VERSION}-debian12 wezhai/python:${PYTHON_VERSION}-debian

  docker push wezhai/python:${PYTHON_VERSION}-debian12
  docker push wezhai/python:${PYTHON_VERSION}-debian

  docker rmi wezhai/python:${PYTHON_VERSION}-debian12
  docker rmi wezhai/python:${PYTHON_VERSION}-debian
}


function build_centos() {
  PYTHON_VERSION=$1

  docker build --build-arg PYTHON_VERSION=$PYTHON_VERSION -t "wezhai/python:${PYTHON_VERSION}-centos7.9.2009" -f Dockerfile-centos7.9.2009 .
  docker tag wezhai/python:${PYTHON_VERSION}-centos7.9.2009 wezhai/python:${PYTHON_VERSION}-centos7.9
  docker tag wezhai/python:${PYTHON_VERSION}-centos7.9.2009 wezhai/python:${PYTHON_VERSION}-centos7
  docker tag wezhai/python:${PYTHON_VERSION}-centos7.9.2009 wezhai/python:${PYTHON_VERSION}-centos

  docker push wezhai/python:${PYTHON_VERSION}-centos7.9.2009
  docker push wezhai/python:${PYTHON_VERSION}-centos7.9
  docker push wezhai/python:${PYTHON_VERSION}-centos7
  docker push wezhai/python:${PYTHON_VERSION}-centos

  docker rmi wezhai/python:${PYTHON_VERSION}-centos7.9.2009
  docker rmi wezhai/python:${PYTHON_VERSION}-centos7.9
  docker rmi wezhai/python:${PYTHON_VERSION}-centos7
  docker rmi wezhai/python:${PYTHON_VERSION}-centos
}

function build() {
  PYTHON_VERSION=$1
  build_centos $VERSION
  build_debian $VERSION
  build_ubuntu $VERSION
}

cat version.txt | while IFS= read -r VERSION; do 
    build $VERSION
done
